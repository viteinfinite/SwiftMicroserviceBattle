import PackageDescription

let package = Package(
    name: "XebiaBattle",
    dependencies: [
       //.Package(url: "https://github.com/IBM-Swift/Kitura-router.git", versions: Version(0,3,0)..<Version(0,4,0)),
       //.Package(url: "https://github.com/necolt/Swifton.git", versions: Version(0,0,4)..<Version(0,0,5)),
		.Package(url: "https://github.com/kylef/Curassow.git", majorVersion: 0, minor: 4),
	]
)