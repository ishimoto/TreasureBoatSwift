// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// https://developer.apple.com/documentation/packagedescription

let package = Package(
    name: "TreasureBoatSwift",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v9),
        .watchOS(.v8)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "TreasureBoatSwift",
            targets: [
                "TreasureBoatSwift", "TBSwiftiOS"
            ]
        )
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        
        /* SFSafe Symbols */
        .package(url: "https://github.com/SFSafeSymbols/SFSafeSymbols", from: Version(3, 0, 0))
        
        /* Thanks to CheckDevice 1.0.5, becaus it does not work on macOS the source code moved in and got fixed */
        // .package(url: "https://github.com/ugurethemaydin/CheckDevice", from: Version(1, 0, 0))

    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            // The name of the target.
            name: "TreasureBoatSwift",
            // The target’s dependencies on other entities inside or outside the package.
            dependencies: [
                "SFSafeSymbols"
            ],
            // The path of the target, relative to the package root.
            path: "Sources",
            // The paths to source and resource files that you don’t want to include in the target.
            exclude: [
            ],
            // The explicit list of resource files in the target.
            resources: [
                .process("Resources/Media.xcassets"),
                .process("Images")
            ]
        ),
        .target(
            name: "TBSwiftiOS",
            dependencies: [
                "TreasureBoatSwift",
                "SFSafeSymbols"
            ],
            path: "Souces_iOS",
            resources: []
        )

    ]
)
