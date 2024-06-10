//
//  TBRequestResult.swift
//
//  Created by Alex Nagy on 25.12.2022.
//

import SwiftUI

@propertyWrapper
public struct TBRequestResult<T: Decodable>: DynamicProperty {
    
    @StateObject private var manager: TBRequestResultManager<T>
    
    /// The query's configurable properties.
    public struct Configuration {
        
        public var request: TBRequest
        
        public var requester: TBRequester
        
        // The strategy to use in case there was a problem during the decoding phase.
        public var decodingFailureStrategy: ETBDecodingFailureStrategy = .raise
        
        /// If any errors occurred, they will be exposed here as well.
        public var error: Error?
        
    }
    
    public var wrappedValue: T? {
        get {
            manager.value
        }
        nonmutating set {
            manager.value = newValue
        }
    }
    
    public var projectedValue: Binding<T?> {
        Binding(
            get: {
                wrappedValue
            },
            set: {
                wrappedValue = $0
            }
        )
    }
    
    /// A binding to the request's mutable configuration properties
    public var configuration: Configuration {
        get {
            manager.configuration
        }
        nonmutating set {
            manager.objectWillChange.send()
            manager.configuration = newValue
        }
    }
    
    public init(request: TBRequest,
                requester: TBRequester = TBRequester(decoder: JSONDecoder()),
                decodingFailureStrategy: ETBDecodingFailureStrategy = .raise) {
        let configuration = Configuration(request: request, requester: requester, decodingFailureStrategy: decodingFailureStrategy)
        self._manager = StateObject(wrappedValue: TBRequestResultManager<T>(configuration: configuration))
    }
    
    public init(scheme: ETBURLScheme,
                host: String,
                path: String,
                port: Int? = nil,
                method: ETBHTTPMethod,
                headers: [String: String]? = nil,
                queryParameters: [String: String]? = nil,
                body: TBHTTPBody? = nil,
                session: URLSession = URLSession.shared,
                decoder: ITBGenericDecoder? = JSONDecoder(),
                decodingFailureStrategy: ETBDecodingFailureStrategy = .raise) {
        let request = TBRequest(scheme: scheme, host: host, path: path, port: port, method: method, headers: headers, queryParameters: queryParameters, body: body)
        let requester = TBRequester(session: session, decoder: decoder)
        let configuration = Configuration(request: request, requester: requester, decodingFailureStrategy: decodingFailureStrategy)
        self._manager = StateObject(wrappedValue: TBRequestResultManager<T>(configuration: configuration))
    }
}

@MainActor
final public class TBRequestResultManager<T: Decodable>: ObservableObject {
    @Published public var value: T?
    
    private var request: (() -> Void)!
    
    internal var shouldUpdateQuery = true
    internal var configuration: TBRequestResult<T>.Configuration {
        didSet {
            // prevent never-ending update cycle when updating the error field
            guard shouldUpdateQuery else { return }
            request()
        }
    }
    
    public init(configuration: TBRequestResult<T>.Configuration) {
        self.configuration = configuration
        fetch()
    }
    
    public func fetch() {
        request = createRequest(with: { [weak self] result in
            switch result {
            case .success(let value):
                if self?.configuration.error != nil {
                    if self?.configuration.decodingFailureStrategy == .raise {
                        withAnimation {
                            self?.value = nil
                        }
                    } else {
                        withAnimation {
                            self?.value = value
                        }
                    }
                } else {
                    withAnimation {
                        self?.value = value
                    }
                }
            case .failure(let error):
                withAnimation {
                    self?.value = nil
                    self?.projectError(error)
                }
            }
        })
        request()
    }
    
    private func createRequest(with completion: @escaping (Result<T?, Error>) -> Void)
    -> () -> Void {
        return {
            Task {
                do {
                    let requestResult = try await self.configuration.requester.send(self.configuration.request, expect: T.self)
                    completion(.success(requestResult.result))
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
    
    private func projectError(_ error: Error?) {
        shouldUpdateQuery = false
        configuration.error = error
        shouldUpdateQuery = true
    }
}
