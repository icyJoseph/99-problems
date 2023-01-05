// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Swift99Problems",
    products: [
        .library(name: "Swift99Problems", targets: ["LinkedLists", "Arithmetic"]),
    ],
    targets: [
        .target(
            name: "LinkedLists",
            path: "LinkedLists"
        ),

        .target(
            name: "Arithmetic",
            path: "Arithmetic"
        ),

        .testTarget(
            name: "Swift99ProblemsTests",
            dependencies: ["LinkedLists", "Arithmetic"],
            path: "Tests"
        ),
    ]
)
