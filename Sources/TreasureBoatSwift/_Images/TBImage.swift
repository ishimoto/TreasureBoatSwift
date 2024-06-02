//
//  TBImage.swift
//  TB Mobile
//
//  Created by Ken Ishimoto on 2020/11/14.
//

import SwiftUI

@available(iOS 17.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct TBImage: View {

    var location: String
    
    public init(location: String) {
        self.location = location
    }
    
    public var body: some View {
        if ETBUriResource.isHttps(location) {
            AsyncImage(url: location.url()) { phase in
                switch phase {
                    
                case .success(let image):
                    image
                        .resizable()
                        .transition(.move(edge: .bottom))
                        .transition(.slide)
                        .transition(.scale)
                    
                case .failure(_):
                    Image(systemSymbol: .antCircleFill)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 128)
                        .foregroundStyle(.purple)
                        .opacity(0.5)
                    
                case .empty:
                    Image(systemSymbol: .photoCircleFill)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 128)
                        .foregroundStyle(.purple)
                        .opacity(0.5)
                    
                @unknown default:
                    ProgressView()
                }
                
            }
            
        } else {
            displayLocalImage(location: location)
                .resizable()
                .scaledToFit()
        }
    }
    
    func displayLocalImage(location : String) -> Image {
        // remove static:// keyword
        let staticFile: String = location.replacingOccurrences(of: ETBUriResource.STATIC.rawValue,
                                                               with: "")
        
        if TBURI.isImage(staticFile) {
            // We have an image extension
    #if canImport(UIKit)
            return Image(uiImage: UIImage(named: staticFile)!)
    #elseif canImport(AppKit)
            return Image(nsImage: NSImage(named: staticFile)!)
    #endif
            
        }
        // We have only an Assetname
        return Image(staticFile)
    }
}

// MARK: - PREVIEW

//@available(iOS 17.0, macOS 12.0, tvOS 15.0, watchOS 10.0, *)
//#Preview("with https:// Link" , traits: .portrait) {
//    TBImage(location: "https://content.jwplatform.com/thumbs/O95Mw1wn-1280.jpg")
//        .frame(width: 500, height: 300, alignment: .center)
//}
//
//@available(iOS 17.0, macOS 12.0, tvOS 15.0, watchOS 10.0, *)
//#Preview("with static:// Link" , traits: .portrait) {
//    TBImage(location: "static://TBDevelopment3")
//        .frame(width: 500, height: 300, alignment: .center)
//}
//
//@available(iOS 17.0, macOS 12.0, tvOS 15.0, watchOS 10.0, *)
//#Preview("with only name Link" , traits: .portrait) {
//    TBImage(location: "TBDevelopment1")
//        .frame(width: 500, height: 300, alignment: .center)
//}
