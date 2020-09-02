// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "FizzyKit",
    products: [
        .library(name: "FizzyKit", targets: ["FizzyKit"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "FizzyKit", dependencies: [], path: "Sources")
    ]
)
