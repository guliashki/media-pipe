// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "SwiftTasksGenAI",
    platforms: [
        .iOS(.v13),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "SwiftTasksGenAI",
            targets: ["SwiftTasksGenAI"]
        ),
        .executable(
            name: "UpdatePackage",
            targets: ["UpdatePackage"]
        )
    ],
    targets: [
        .target(
            name: "SwiftTasksGenAI",
            dependencies: ["SwiftTasksGenAICore"]
        ),
        .target(
            name: "SwiftTasksGenAICore",
            dependencies: [
                "MediaPipeGenAICLibraries",
                "MediaPipeTasksGenAIC",
                "MediaPipeTasksGenAI"
            ],
            linkerSettings: [
                .unsafeFlags(["-ObjC"])
            ]
        ),
        .binaryTarget(
            name: "MediaPipeTasksGenAI",
            url: "https://github.com/paescebu/SwiftTasksGenAI/releases/download/0.10.24/MediaPipeTasksGenAI.xcframework.zip",
            checksum: "96f53666922282c5a332a6595c53716180d09d4fbca090469a25d487bc1288aa"
        ),
        .binaryTarget(
            name: "MediaPipeGenAICLibraries",
            url: "https://github.com/paescebu/SwiftTasksGenAI/releases/download/0.10.24/MediaPipeGenAICLibraries.xcframework.zip",
            checksum: "1e7686c1552915d4e31321690f2aed0b1a11146d38d33ac5c86e8e1a8c2350df"
        ),
        .binaryTarget(
            name: "MediaPipeTasksGenAIC",
            url: "https://github.com/paescebu/SwiftTasksGenAI/releases/download/0.10.24/MediaPipeTasksGenAIC.xcframework.zip",
            checksum: "ceff55c55f68e6de67b892ec15754ba966a25e5697328399a074092c6d6cbfe9"
        ),
        .executableTarget(
            name: "UpdatePackage",
            resources: [
                .process("Resources/MediaPipeGenAI.Info.plist")
            ]
        )
    ]
)
