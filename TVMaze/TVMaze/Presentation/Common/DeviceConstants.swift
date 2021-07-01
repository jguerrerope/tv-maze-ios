import UIKit

public struct DeviceConstants {

    public static func isIpadOrIpadScreenSize() -> Bool {
        // iPad
        return UIDevice.current.userInterfaceIdiom == .pad
    }
}
