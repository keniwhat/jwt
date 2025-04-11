// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "jwt",
    platforms: [
        .macOS(.v11),
        .iOS(.v16),
        .tvOS(.v16),
        .watchOS(.v9),
    ],
    products: [
        .library(name: "JWT", targets: ["JWT"])
    ],
    dependencies: [
        .package(url: "https://github.com/keniwhat/jwt-kit.git", .branch("keniwhat-5.1.2")),
        .package(url: "https://github.com/keniwhat/vapor.git", .branch("range-eof")),
    ],
    targets: [
        .target(
            name: "JWT",
            dependencies: [
                .product(name: "JWTKit", package: "jwt-kit"),
                .product(name: "Vapor", package: "vapor"),
            ]
        ),
        .testTarget(
            name: "JWTTests",
            dependencies: [
                .target(name: "JWT"),
                .product(name: "VaporTesting", package: "vapor"),
            ]
        ),
    ]
)
