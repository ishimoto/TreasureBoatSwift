// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// https://developer.apple.com/documentation/packagedescription

let package = Package(
    name: "TreasureBoatSwift",
    
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
        .tvOS(.v16),
        .watchOS(.v9)
    ],
    
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    products: [
        .library(
            name: "TreasureBoatSwift",
            targets: [
                "TreasureBoatSwift",
                "TBSwiftiOS"
            ]
        ),
        .library(
            name: "TreasureBoatSwiftMacOS",
            targets: [
                "TreasureBoatSwift",
                "TBSwiftmacOS"
            ]
        )
    ],
    
    dependencies: [
        /* SFSafe Symbols */
        .package(url: "https://github.com/SFSafeSymbols/SFSafeSymbols", from: Version(4, 0, 0)),

        /* Async-plus */
        .package(url: "https://github.com/async-plus/async-plus", from: Version(1, 0, 0)),
        
        /* BetterCodable */
        .package(url: "https://github.com/marksands/BetterCodable", from: Version(0, 4, 0)),

        /* swift-collections */
        .package(url: "https://github.com/apple/swift-collections.git", from: Version(1, 0, 0)),

        /* SwiftDate */
        .package(url: "https://github.com/malcommac/SwiftDate", from: Version(7, 0, 0)),
        
        /*
            SwiftJWT
                * Cryptor
                * CryptorECC
                * CryptorRSA
                * KituraContracts
                * LoggerAPI
                * swift-log
         */
        .package(url: "https://github.com/IBM-Swift/Swift-JWT.git", from: Version(4, 0, 0)),
        
        /* DeviceKit */
        .package(url: "https://github.com/devicekit/DeviceKit", from: Version(5, 0, 0)),
        
        /* SwiftUILogger */
        .package(url: "https://github.com/0xLeif/SwiftUILogger", from: Version(0, 1, 0)),

        /* MagicUI (Deprecated) */
        .package(url: "https://github.com/ishimoto/MagicUI.git", from: Version(0, 0, 1)),

        /* OneDot */
        .package(url: "https://github.com/rebeloper/OneDot.git", from: Version(0, 0, 1)),

        /*
            CocoaLumberjack
                * swift-log

            Note that you may need to add both products, CocoaLumberjack and CocoaLumberjackSwift to your target since SPM sometimes fails to detect that
                CocoaLumerjackSwift depends on CocoaLumberjack.
         */
        .package(url: "https://github.com/CocoaLumberjack/CocoaLumberjack.git", from: Version(3, 8, 0))

    ],
    
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    targets: [
        .target(
            // The name of the target.
            name: "TreasureBoatSwift",
            // The target’s dependencies on other entities inside or outside the package.
            dependencies: [
                .product(name: "SFSafeSymbols", package: "SFSafeSymbols"),
                .product(name: "BetterCodable", package: "BetterCodable"),
                .product(name: "SwiftDate", package: "SwiftDate"),
                .product(name: "MagicUI", package: "MagicUI"),
                .product(name: "OneDot", package: "OneDot"),
                //                .product(name: "Swift-JWT", package: "SwiftJWT"),
                .product(name: "CocoaLumberjack", package: "CocoaLumberjack"),
                .product(name: "CocoaLumberjackSwift", package: "CocoaLumberjack")
            ],
            // The path of the target, relative to the package root.
            path: "Sources",
            // The paths to source and resource files that you don’t want to include in the target.
            exclude: [
            ],
            // The explicit list of resource files in the target.
            resources: [
                .process("Resources/Media.xcassets"),
                .process("Images"),
                .process("Sound")
            ]
        ),
        
        .target(
            name: "TBSwiftiOS",
            dependencies: [
                .product(name: "SwiftUILogger", package: "SwiftUILogger", condition: .when(platforms: [.iOS])),
                .product(name: "DeviceKit", package: "DeviceKit", condition: .when(platforms: [.iOS]))
            ],
            path: "TBSwiftiOS",
            resources: []
        ),

        .target(
            name: "TBSwiftmacOS",
            dependencies: [
                // ...
            ],
            path: "TBSwiftmacOS",
            resources: []
        )
    ]
)
