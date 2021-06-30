import Foundation

private class ModuleBundle {

    static func bundle() -> Bundle? {
       return Bundle(for: self)
    }
}

extension Bundle {

    private static let bundleID = "com.ubuomi.workly.Presentation"

    static var module: Bundle {
        return ModuleBundle.bundle() ?? .main
    }

}
