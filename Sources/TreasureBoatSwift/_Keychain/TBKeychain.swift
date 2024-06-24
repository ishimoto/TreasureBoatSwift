//
//  TBKeychain.swift
//
//
//  Created by Ken Ishimoto on 2024/06/10.
//

import SwiftUI
import KeychainAccess

@propertyWrapper
public struct KeychainStorage<T: Codable>: DynamicProperty {
    
    public typealias Value = T

    let key: String
    @State private var value: Value

    public init(wrappedValue: Value = "", _ key: String) {
        self.key = key
        var initialValue = wrappedValue

        do {
            try Keychain().get(key) { attributes in
                if let attributes = attributes,
                   let data = attributes.data {
                    
                    do {
                        let decoded = try JSONDecoder().decode(Value.self, from: data)
                        initialValue = decoded
                        
                    } catch let error {
                        print("[KeychainStorage] Keychain().get(\(key)) - \(error.localizedDescription)")
                    }
                }
            }
        } catch let error {
            fatalError("\(error)")
        }
        
        self._value = State<Value>(initialValue: initialValue)
    }

    public var wrappedValue: Value {
        get { value }
        nonmutating set {
            value = newValue
            do {
                let encoded = try JSONEncoder().encode(value)
                try Keychain().set(encoded, key: key)
            } catch let error {
                print(error.localizedDescription)
                try? Keychain().remove(key)
            }
        }
    }
    
    public var projectedValue: Binding<Value> {
        Binding(get: { wrappedValue }, set: { wrappedValue = $0 })
    }
}

//********************************************************************
// TBKeychain
//********************************************************************

public struct TBKeychain {
    
    //********************************************************************
    // Touch ID (Face ID) integration
    //********************************************************************

#if os(iOS) || os(macOS)
    /// Any Operation that require authentication must be run in the background thread.
    /// If you run in the main thread, UI thread will lock for the system to try to display
    /// the authentication dialog.
    /// To use Face ID, add NSFaceIDUsageDescription key to your Info.plist
    
    /* Adding a Touch ID (Face ID) protected item */
    
    /// If you want to store the Touch ID protected Keychain item,
    /// specify accessibility and authenticationPolicy attributes.

    /* Updating a Touch ID (Face ID) protected item */

    /// Do not run in the main thread if there is a possibility that the item you are trying
    /// to add already exists, and protected.
    /// Because updating protected items requires authentication.
    /// Additionally, you want to show custom authentication prompt message when updating,
    /// specify an authenticationPrompt attribute. If the item not protected,
    /// the authenticationPrompt parameter just be ignored.
    public static func saveBioMetry(_ keychain : Keychain, key: String, value: String, promptMessage: String = "Authenticate to update your access token") {
        DispatchQueue.global().async {
            do {
                // Should be the secret invalidated when passcode is removed? If not then use `.WhenUnlocked`
                try keychain.accessibility(.whenPasscodeSetThisDeviceOnly,
                                           authenticationPolicy: [.biometryAny])
                .authenticationPrompt(promptMessage)
                .set(value, key: key)
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }

    /* Obtaining a Touch ID (Face ID) protected item */
    
    /// The same way as when you get a normal item.
    /// It will be displayed automatically Touch ID or passcode authentication
    /// If the item you try to get is protected.
    /// If you want to show custom authentication prompt message, specify an
    /// authenticationPrompt attribute.
    /// If the item not protected, the authenticationPrompt parameter just be ignored.
    public static func readBioMetry(_ keychain : Keychain, key: String, promptMessage: String = "Authenticate to login to server") /* -> String */ {
        DispatchQueue.global().async {
            do {
                let value = try keychain
                    .authenticationPrompt(promptMessage)
                    .get(key)

                print("BioMetry value: \(value ?? "n/a")")
                //return value FIXME

            } catch let error {
                print(error.localizedDescription)
            }
            //return "n/a"
        }
    }

    /* Removing a Touch ID (Face ID) protected item */
    
    /// The same way as when you remove a normal item.
    /// There is no way to show Touch ID or passcode authentication when removing Keychain items.
    public static func removeBioMetry(_ keychain : Keychain, key: String) {
        do {
            try keychain.remove(key)
        } catch let error {
            print(error.localizedDescription)
        }
    }

#endif

#if os(iOS)

    //********************************************************************
    // PASSWORD
    //********************************************************************

    /// Generate strong random password that is in the same format used by Safari autofill (xxx-xxx-xxx-xxx).
    public static func generateRandomPassword() -> String {
        // => Nhu-GKm-s3n-pMx
        return Keychain.generatePassword()
    }

#endif

    //********************************************************************
    // Shared Web Credentials
    //********************************************************************

    /// Shared web credentials is a programming interface that enables native iOS apps to share credentials with their website counterparts.
    /// For example, a user may log in to a website in Safari, entering a user name and password, and save those credentials using the iCloud Keychain.
    /// Later, the user may run a native app from the same developer, and instead of the app requiring the user to reenter a user name and password, 
    /// shared web credentials gives it access to the credentials that were entered earlier in Safari.
    /// The user can also create new accounts, update passwords, or delete her account from within the app. These changes are then saved and used by Safari.

    /// How to set up Shared Web Credentials
    ///
    /// 1.  Add a com.apple.developer.associated-domains entitlement to your app.
    ///     This entitlement must include all the domains with which you want to share credentials.
    ///
    /// 2.  Add an apple-app-site-association file to your website. This file must include application identifiers for all the apps 
    ///     with which the site wants to share credentials, and it must be properly signed.
    ///
    /// 3.  When the app is installed, the system downloads and verifies the site association file for each of its associated domains.
    ///     If the verification is successful, the app is associated with the domain.
    ///
    /// https://developer.apple.com/library/ios/documentation/Security/Reference/SharedWebCredentialsRef/

    
    // SEE : TestKeychainStoragePage for example
    
    //********************************************************************
    // DEBUG
    //********************************************************************
    
    /// Display all stored items if print keychain object
    public static func dump(_ keychain : Keychain) {
        print("==========")
        print(keychain)
    }
    
    /// Obtaining all stored keys
    public static func dumpAllKeys(_ keychain : Keychain) {
        dump(keychain)
        
        let keys = keychain.allKeys()
        for key in keys {
          print("key: \(key)")
        }
    }

    /// Obtaining all stored items
    public static func dumpAllItems(_ keychain : Keychain) {
        dump(keychain)

        let items = keychain.allItems()
        for item in items {
          print("item: \(item)")
        }
    }
    
}
