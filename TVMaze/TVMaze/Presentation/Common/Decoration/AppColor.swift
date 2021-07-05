import Foundation
import UIKit

struct AppColor {
    
    static let clear = UIColor.clear
    static let white = UIColor.white
    static let black = UIColor.black
    static let midnightBlueDark = UIColor(hex: "#22282d")
    static let lightMidnightBlue = UIColor(hex: "#344048")
    static let sand = UIColor(hex: "#E5E8EB")
    
    static let blackAlpha35 = UIColor.black.withAlphaComponent(0.35)
    static let lightMidnightBlueAlpha35 = lightMidnightBlue.withAlphaComponent(0.35)
    static let midnightBlueDark70 = midnightBlueDark.withAlphaComponent(0.70)
    static let sand30 = midnightBlueDark.withAlphaComponent(0.30)
}


extension UIColor {
    
    convenience init(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0
            
            if scanner.scanHexInt64(&hexNumber) {
                if hexColor.count == 6 {
                    r = CGFloat((hexNumber & 0xFF0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00FF00) >> 8) / 255
                    b = CGFloat(hexNumber & 0x0000FF) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: 1.0)
                    return
                    
                } else if hexColor.count == 8 {
                    r = CGFloat((hexNumber & 0xFF000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00FF0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000FF00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000FF) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        self.init(red: 0, green: 0, blue: 0, alpha: 1.0)
        
        #if DEBUG
        fatalError("cant not converter \(hex)")
        #endif
    }
}
