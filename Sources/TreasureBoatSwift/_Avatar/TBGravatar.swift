//
//  TBGravatar.swift
//
//  Created by Ken Ishimoto on 2021/02/26.
//

import SwiftUI
import CryptoKit

private protocol QueryItemConvertible {
    var queryItem: URLQueryItem {get}
}

// MARK: - TBGravatar

@available(iOS 17.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
struct TBGravatar {
    
    fileprivate static let baseURL = Foundation.URL(string: "https://www.gravatar.com/avatar")!
    
    public enum Rating: String, QueryItemConvertible {
        case G = "g"
        case PG = "pg"
        case R = "r"
        case X = "x"
        
        var queryItem: URLQueryItem {
            return URLQueryItem(name: "r", value: rawValue)
        }
    }
    
    public enum DefaultImage: String, QueryItemConvertible {
        case HTTP404 = "404"
        case MysteryMan = "mm"
        case Identicon = "identicon"
        case MonsterID = "monsterid"
        case Wavatar = "wavatar"
        case Retro = "retro"
        case Blank = "blank"
        
        var queryItem: URLQueryItem {
            return URLQueryItem(name: "d", value: rawValue)
        }
    }
    
    public var email: String
    public let defaultImage: DefaultImage
    public let rating: Rating
    
    public init(
        emailAddress: String,
        defaultImage: DefaultImage = .MysteryMan,
        rating: Rating = .PG)
    {
        email = emailAddress
        self.defaultImage = defaultImage
        self.rating = rating
        
        // Check if null
        email = hasEmail(email) ? email : ""
    }
    
    public func URL(size: CGFloat, scale: CGFloat) -> URL {
        var hash:String
        
        if email.isEmpty {
            hash = "00000000000000000000000000000000"
        } else {
            hash = MD5(string: email)
            //#if os(iOS)
            //            hash = email.md5()
            //#elseif os(tvOS)
            //#endif
        }
        
        let URL = TBGravatar.baseURL.appendingPathComponent(hash)
        var components = URLComponents(url: URL, resolvingAgainstBaseURL: false)!
        
        var queryItems = [defaultImage.queryItem, rating.queryItem]
        queryItems.append(URLQueryItem(name: "s", value: String(format: "%.0f",size * scale)))
        
        components.queryItems = queryItems
        
        return components.url!
    }
    
    private func MD5(string: String) -> String {
        let digest = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())
        
        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
    
    private func hasEmail(_ email: String) -> Bool {
        return "NULL" != email
    }
    
    static func gravatar(email: String, size: CGFloat) -> String {
        
        let gravatar = TBGravatar.init(emailAddress: email,
                                       defaultImage: .Wavatar,
                                       rating: .G)
        let url: URL = gravatar.URL(size: size, scale: 2)
        return url.absoluteString
    }
    
}

// MARK: - TBGravatarView

@available(iOS 17.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct TBGravatarView: View {
    
    var email: String
    var sizeOfView: CGFloat
    
    public init(email: String, sizeOfView: CGFloat) {
        self.email = email
        self.sizeOfView = sizeOfView
    }
    
#if os(tvOS) || os(iOS) || os(macOS)
    let gradient = LinearGradient(gradient: Gradient(colors: Color.benzaitenGradient),
                                  startPoint: .leading,
                                  endPoint: .trailing
    )
#elseif os(watchOS)
    let gradient = LinearGradient(gradient: Gradient(colors: [Color.blue]),
                                  startPoint: .leading,
                                  endPoint: .trailing
    )
#endif
    
    public var body: some View {
        
        TBImage(location: TBGravatar.gravatar(email: email, size: sizeOfView))
            .aspectRatio(contentMode: .fill)
            .frame(width: sizeOfView, height: sizeOfView)
            .clipShape(Circle())
            .padding(5)
            .background(Circle().stroke(gradient, lineWidth: 2))
            .clipShape(Circle())
        
    }
}

//@available(iOS 17.0, macOS 12.0, tvOS 15.0, watchOS 10.0, *)
//#Preview("Gravatar" , traits: .portrait) {
//    TBGravatarView(email: "ken@ksroom.com", sizeOfView: 65.0)
//}
