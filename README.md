# TreasureBoatSwift

a Swift Framework with TB Touch.

[![License](https://img.shields.io/badge/License-MIT-green)](https://github.com/ishimoto/TreasureBoatSwift/blob/main/LICENSE)
![Xcode 13](https://img.shields.io/badge/XCode-13%2B-blue)
![SwiftUI](https://img.shields.io/badge/SwiftUI-3-blue)
![iOS](https://img.shields.io/badge/iOS-15%2B-orange)
![macOS](https://img.shields.io/badge/macOS-12%2B-orange)
![tvOS](https://img.shields.io/badge/tvOS-9%2B-orange)
![watch OS](https://img.shields.io/badge/watchOS-8%2B-orange)

### Creating a Swift Package

Following Information can be very helpful

* https://useyourloaf.com/blog/creating-swift-packages-in-xcode/

JSON 4 Swift

* https://www.json4swift.com

### Dependencies

* [SFSafeSymbols](https://github.com/SFSafeSymbols/SFSafeSymbols)


### 2022/08/22

* Add TBCheckDevice (originally CheckDevice from https://github.com/ugurethemaydin/CheckDevice) moved and fixed so it works on macOS

* Add Color+ Extension

```swift
    Color(hex: "AFC") // RGB (12-bit)
    Color(hex: "AAFFCC") // RGB (24-bit)
    Color(hex: "33AAFFCC") // ARGB (32-bit)
    
    Color.orange.rgbAsHex -> String
    Color.orange.rgbaAsHex -> String
    Color.orange.argbAsHex -> String
    Color.orange.isDark -> Bool
```

* Add UIWindow+ Extension

```swift
    public static func firstWindow() -> UIWindow?
```

* Add View+ Extension

```swift

    Text("some text")
        .centered()

```

### 2022/08/07

Add 2 Views for TB Apps

* TBSimpleFormRow
* TBSFSymbol

### 2022/07/02

Adding URL+ Extension

* storeURL(for appGroup: String, databaseName: String) -> URL
* storeURL(databaseName: String) -> URL

Added a Shape

* TBShapeRoundedCorners(corners: [.topLeft, .topRight], radius: 35)

