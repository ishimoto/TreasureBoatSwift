//
//  TBWebView.swift
//
//  Created by Alex Nagy on 11.07.2022.
//

#if os(iOS) || os(macOS)
import SwiftUI
import Combine
import WebKit

@dynamicMemberLookup
public class TBWebViewStore: ObservableObject {
    @Published public var wkWebView: WKWebView {
        didSet {
            setupObservers()
        }
    }
    
    public init(wkWebView: WKWebView = WKWebView()) {
        self.wkWebView = wkWebView
        setupObservers()
    }
    
    private func setupObservers() {
        func subscriber<Value>(for keyPath: KeyPath<WKWebView, Value>) -> NSKeyValueObservation {
            return wkWebView.observe(keyPath, options: [.prior]) { _, change in
                if change.isPrior {
                    self.objectWillChange.send()
                }
            }
        }
        // Setup observers for all KVO compliant properties
        observers = [
            subscriber(for: \.title),
            subscriber(for: \.url),
            subscriber(for: \.isLoading),
            subscriber(for: \.estimatedProgress),
            subscriber(for: \.hasOnlySecureContent),
            subscriber(for: \.serverTrust),
            subscriber(for: \.canGoBack),
            subscriber(for: \.canGoForward)
        ]
    }
    
    private var observers: [NSKeyValueObservation] = []
    
    public subscript<T>(dynamicMember keyPath: KeyPath<WKWebView, T>) -> T {
        wkWebView[keyPath: keyPath]
    }
}
#endif

#if os(iOS)
/// A container for using a WKWebView in SwiftUI
/// A SwiftUI component `View` that contains a `WKWebView`
///
/// Since `WKWebView` handles a lot of its own state, navigation stack, etc, it's almost easier to treat it as a mutable data model. You can set it up prior to how you need it, and then simply use its data within your SwiftUI View's.
///
/// Simply spin up a `WebViewStore` (optionally with your own `WKWebView`) and use that to access the `WKWebView` itself as if it was a data model.
///
/// Example usage:
///
/// ```swift
/// import SwiftUI
/// import Dot
///
/// struct ContentView: View {
///     @StateObject var webViewStore = WebViewStore()
///
///     var body: some View {
///         NavigationView {
///             WebView(wkWebView: webViewStore.wkWebView)
///                 .navigationBarTitle(Text(verbatim: webViewStore.title ?? ""), displayMode: .inline)
///                 .navigationBarItems(trailing: HStack {
///                     Button(action: goBack) {
///                         Image(systemName: "chevron.left")
///                             .imageScale(.large)
///                             .aspectRatio(contentMode: .fit)
///                             .frame(width: 32, height: 32)
///                     }.disabled(!webViewStore.canGoBack)
///                     Button(action: goForward) {
///                         Image(systemName: "chevron.right")
///                             .imageScale(.large)
///                             .aspectRatio(contentMode: .fit)
///                             .frame(width: 32, height: 32)
///                     }.disabled(!webViewStore.canGoForward)
///                 })
///         }.onAppear {
///             self.webViewStore.wkWebView.load(URLRequest(url: URL(string: "https://apple.com")!))
///         }
///     }
///
///     func goBack() {
///         webViewStore.wkWebView.goBack()
///     }
///
///     func goForward() {
///         webViewStore.wkWebView.goForward()
///     }
/// }
/// ```
///
/// Or use one of the `load` view modifiers
///
/// ```swift
/// import SwiftUI
/// import Dot
///
/// struct ContentView: View {
///     @StateObject var webViewStore = WebViewStore()
///
///     var body: some View {
///         NavigationView {
///             WebView(wkWebView: webViewStore.wkWebView)
///                 .load(url: URL(string: "https://apple.com")!, webViewStore: webViewStore)
///         }
///     }
/// }
/// ```
///
/// ```swift
/// import SwiftUI
/// import Dot
///
/// struct ContentView: View {
///     @StateObject var webViewStore = WebViewStore()
///     @State private var isWebViewPresented = false
///
///     var body: some View {
///         Button {
///             isWebViewPresented.toggle()
///         } label: {
///             Text("Show WebView")
///         }
///         .sheet(isPresented: $isWebViewPresented) {
///             NavigationView {
///                 WebView(wkWebView: webViewStore.wkWebView)
///                     .load(url: URL(string: "https://apple.com")!, webViewStore: webViewStore)
///             }
///         }
///     }
/// }
/// ```
///
/// ```swift
/// import SwiftUI
/// import Dot
///
/// struct ContentView: View {
///     @StateObject var webViewStore = WebViewStore()
///     @State private var isWebViewPresented = false
///
///     var body: some View {
///         Button {
///             isWebViewPresented.toggle()
///         } label: {
///             Text("Show WebView")
///         }
///         .fullScreenCover(isPresented: $isWebViewPresented) {
///             NavigationView {
///                 WebView(wkWebView: webViewStore.wkWebView)
///                     .load(url: URL(string: "https://apple.com")!, webViewStore: webViewStore, isActive: $isWebViewPresented)
///             }
///         }
///     }
/// }
/// ```
public struct TBWebView: View, UIViewRepresentable {
    
    /// The WKWebView to display
    public let wkWebView: WKWebView
    
    public init(wkWebView: WKWebView) {
        self.wkWebView = wkWebView
    }
    
    public func makeUIView(context: UIViewRepresentableContext<TBWebView>) -> WKWebView {
        wkWebView
    }
    
    public func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<TBWebView>) {

    }

}
#endif

#if os(macOS)
/// A container for using a WKWebView in SwiftUI
public struct TBWebView: View, NSViewRepresentable {
    /// The WKWebView to display
    public let wkWebView: WKWebView
    
    public init(wkWebView: WKWebView) {
        self.wkWebView = wkWebView
    }
    
    public func makeNSView(context: NSViewRepresentableContext<TBWebView>) -> WKWebView {
        wkWebView
    }
    
    public func updateNSView(_ uiView: WKWebView, context: NSViewRepresentableContext<TBWebView>) {
    }
}
#endif

#if os(iOS) || os(macOS)
public extension TBWebView {
    
    static func openWeb(url: String) -> URLRequest {
        let _url = URL(string: url)!
        return URLRequest(url: _url)
    }
    
    static func openPDF(fileName: String) -> URLRequest {
        let path = Bundle.main.path(forResource: fileName, ofType: "pdf")
        let url = URL(fileURLWithPath: path!)
        return URLRequest(url: url)
    }
}
#endif
