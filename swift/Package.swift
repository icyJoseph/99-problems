// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Swift99Problems",
    products: [
        .library(name: "Swift99Problems", targets: ["LinkedLists"]),
    ],
    targets: [
        .target(
            name: "LinkedLists",
            path: "LinkedLists"
        ),
        .testTarget(
            name: "Swift99ProblemsTests",
            dependencies: ["LinkedLists"],
            path: "Tests"
        ),
    ]
)
