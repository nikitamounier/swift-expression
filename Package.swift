// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "swift-expression",
    products: [
        .library(
            name: "Expression",
            targets: ["Expression"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Expression",
            dependencies: []),
        .testTarget(
            name: "ExpressionTests",
            dependencies: ["Expression"]),
    ]
)
