//
//  TBRequestResults.swift
//
//  Created by Alex Nagy on 26.12.2022.
//

import SwiftUI

@propertyWrapper
public struct TBRequestResults<T, U: Decodable>: DynamicProperty {
    
    @StateObject private var manager: RequestResultsManager<T, U>
    
    /// The query's configurable properties.
    public struct Configuration {
        
        public var request: TBRequest
        
        public var requester: TBRequester
        
        // The strategy to use in case there was a problem during the decoding phase.
        public var decodingFailureStrategy: ETBDecodingFailureStrategy = .raise
        
        /// If any errors occurred, they will be exposed here as well.
        public var error: Error?
        
    }
    
    public var wrappedValue: U {
        get {
            manager.value
        }
        nonmutating set {
            manager.value = newValue
        }
    }
    
    public var projectedValue: Binding<U> {
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
                decodingFailureStrategy: ETBDecodingFailureStrategy = .raise) where U == [T] {
        let configuration = Configuration(request: request, requester: requester, decodingFailureStrategy: decodingFailureStrategy)
        self._manager = StateObject(wrappedValue: RequestResultsManager<T, U>(configuration: configuration))
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
                decodingFailureStrategy: ETBDecodingFailureStrategy = .raise) where U == [T] {
        let request = TBRequest(scheme: scheme, host: host, path: path, port: port, method: method, headers: headers, queryParameters: queryParameters, body: body)
        let requester = TBRequester(session: session, decoder: decoder)
        let configuration = Configuration(request: request, requester: requester, decodingFailureStrategy: decodingFailureStrategy)
        self._manager = StateObject(wrappedValue: RequestResultsManager<T, U>(configuration: configuration))
    }
}

@MainActor
final fileprivate class RequestResultsManager<T, U: Decodable>: ObservableObject {
    @Published public var value: U
    
    private var request: (() -> Void)!
    
    internal var shouldUpdateQuery = true
    internal var configuration: TBRequestResults<T, U>.Configuration {
        didSet {
            // prevent never-ending update cycle when updating the error field
            guard shouldUpdateQuery else { return }
            request()
        }
    }
    
    public init(configuration: TBRequestResults<T, U>.Configuration) where U == [T] {
        self.value = [T]()
        self.configuration = configuration
        fetch()
    }
    
    public func fetch() where U == [T] {
        request = createRequest(with: { [weak self] result in
            switch result {
            case .success(let value):
                if self?.configuration.error != nil {
                    if self?.configuration.decodingFailureStrategy == .raise {
                        withAnimation {
                            self?.value = []
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
                    self?.value = []
                    self?.projectError(error)
                }
            }
        })
        request()
    }
    
    private func createRequest(with completion: @escaping (Result<U, Error>) -> Void)
    -> () -> Void where U == [T] {
        return {
            Task {
                do {
                    let requestResult = try await self.configuration.requester.send(self.configuration.request, expect: U.self)
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

