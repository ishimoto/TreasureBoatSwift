//
//  TBRemoteImage.swift
//  TB Mobile
//
//  Created by Ken Ishimoto on 2020/11/22.
//

import SwiftUI
import Combine

// TODO : https://www.vadimbulavin.com/asynchronous-swiftui-image-loading-from-url-with-combine-and-swift/

class ImageLoader: ObservableObject {
    
#if canImport(UIKit)
    @Published var image: UIImage?
#elseif canImport(AppKit)
    @Published var image: NSImage?
#endif
    
    private let url: URL
    private var cancellable: AnyCancellable?
    
    init(url: URL) {
        self.url = url
    }
    
    deinit {
        cancel()
    }
    
    func load() {
#if canImport(UIKit)
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.image = $0 }
#elseif canImport(AppKit)
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { NSImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.image = $0 }
#endif
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}

public struct TBRemoteImage<Placeholder: View>: View {
    
    @StateObject private var loader: ImageLoader
    private let placeholder: Placeholder
    
    public init(url: URL, @ViewBuilder placeholder: () -> Placeholder) {
        self.placeholder = placeholder()
        
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    
    public init(urlAsString: String, @ViewBuilder placeholder: () -> Placeholder) {
        self.placeholder = placeholder()
        
        _loader = StateObject(wrappedValue: ImageLoader(url: URL(string: urlAsString)!))
    }
    
    public var body: some View {
        content
            .onAppear(perform: loader.load)
    }
    
    private var content: some View {
        
        Group {
            if loader.image != nil {
#if canImport(UIKit)
                Image(uiImage: loader.image!)
                    .resizable()
#elseif canImport(AppKit)
                Image(nsImage: loader.image!)
                    .resizable()
#endif
            } else {
                placeholder
            }
        }
        
    }
}
