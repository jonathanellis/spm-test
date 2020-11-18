// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "iProov",
    products: [
        .library(
            name: "iProov",
            targets: ["iProovWrapper"]
        ),
    ],
    dependencies: [
        socketIOPackage,
    ],
    targets: [
        .target(
            name: "iProovWrapper",
            dependencies: [
                .product(name: "SocketIO", package: "SocketIO"),
                .target(name: "iProov", condition: .when(platforms: .some([.iOS]))),
            ],
            path: "SwiftPM"
        ),
        .binaryTarget(
            name: "iProov",
            url: "https://github.com/jonathanellis/spm-test/raw/master/iProov.xcframework.zip",
            checksum: "bff20f5281b89e407efd988e5435f45c9029a49b926409ab8c7170499ef0077b"
        ),
    ]
)

let socketIOPackage = Package(
    name: "SocketIO",
    products: [
        .library(name: "SocketIO", type: .dynamic, targets: ["SocketIO"])
    ],
    dependencies: [
        .package(url: "https://github.com/daltoniam/Starscream", .upToNextMinor(from: "3.1.0")),
    ],
    targets: [
        .target(name: "SocketIO", dependencies: ["Starscream"]),
        .testTarget(name: "TestSocketIO", dependencies: ["SocketIO"]),
    ]
)