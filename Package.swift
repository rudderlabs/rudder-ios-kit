// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "RudderKit",
    platforms: [
        .iOS(.v9), .tvOS(.v10), .macOS("10.13"), .watchOS("7.0")
    ],
    products: [
        .library(
            name: "RudderKit",
            targets: ["RudderKit"]
        )
    ],
    targets: [
        .target(
            name: "RudderKit",
            path: "Sources",
            sources: ["Classes/"]
        ),
    ]
)
