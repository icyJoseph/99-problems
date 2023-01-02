// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "99-problems",
    products: [
        .library(name: "99-problems", targets: ["LinkedLists"]),
    ],
    targets: [
        .target(
            name: "LinkedLists",
            path: "LinkedLists"
        ),
        .testTarget(
            name: "99-problems-tests",
            dependencies: ["LinkedLists"],
            path: "Tests"
        ),
    ]
)
