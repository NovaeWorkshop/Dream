import PackageDescription

let package = Package(
    name: "Dream",
    dependencies: [
        .Package(url: "https://github.com/NovaeWorkshop/Sack.git", majorVersion: 1),
   /* ],
    testDependencies: [*/
        .Package(url: "https://github.com/NovaeWorkshop/Blade.git", majorVersion: 1)
    ],
    targets: [
        Target(
            name: "Dream"
        ),
        Target(
            name: "Dream-Tests",
            dependencies: [.Target(name: "Dream")]
        )
    ]
)
