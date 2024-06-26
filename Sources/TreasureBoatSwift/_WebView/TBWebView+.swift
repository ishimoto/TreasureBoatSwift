//
//  TBWebView+.swift
//
//  Created by Alex Nagy on 11.07.2022.
//

import SwiftUI

#if os(iOS)
public extension TBWebView {
    
    func load(url: URL?, webViewStore: TBWebViewStore, isActive: Binding<Bool>? = nil) -> some View {
        self
            .navigationBarTitle(Text(verbatim: webViewStore.title ?? ""), displayMode: .inline)
            .toolbar(content: {
                ToolbarItem(placement: .bottomBar) {
                    Spacer()
                }
                
                ToolbarItem(placement: .bottomBar) {
                    HStack(spacing: 16) {
                        Button(action: {
                            webViewStore.wkWebView.goBack()
                        }, label: {
                            Image(systemName: "chevron.left")
                                .imageScale(.large)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 32, height: 32)
                        }).disabled(!webViewStore.canGoBack)
                        
                        Button(action: {
                            webViewStore.wkWebView.goForward()
                        }, label: {
                            Image(systemName: "chevron.right")
                                .imageScale(.large)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 32, height: 32)
                        }).disabled(!webViewStore.canGoForward)
                    }
                }
            })
            .navigationBarItems(leading:
                                    Group {
                                        Button {
                                            isActive?.wrappedValue = false
                                        } label: {
                                            Text("Close").bold()
                                        }.opacity(isActive != nil ? 1 : 0)
                                    },
                                trailing:
                                    Button(action: {
                                        webViewStore.wkWebView.reload()
                                    }, label: {
                                        Image(systemName: "gobackward")
                                            .imageScale(.large)
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 32, height: 32)
                                    })
            )
            .onAppear {
                if let url = url {
                    webViewStore.wkWebView.load(URLRequest(url: url))
                }
            }
    }
}
#endif

