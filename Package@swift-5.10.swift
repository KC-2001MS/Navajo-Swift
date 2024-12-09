// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Navajo-Swift",
    defaultLocalization: LanguageTag(rawValue: "en"),
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .visionOS(.v1)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "Navajo-Swift",
            targets: ["Navajo-Swift"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.4.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Navajo-Swift",
            dependencies: []),
        .testTarget(
            name: "Navajo-SwiftTests",
            dependencies: ["Navajo-Swift"],
            path: "Tests"),
    ]
)
