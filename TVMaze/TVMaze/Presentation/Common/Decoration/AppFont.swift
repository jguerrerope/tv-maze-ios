import Foundation
import UIKit

struct AppFont {
    
    static let montserratSemiBoldSmall = FontSetup.monserrat(.semiBold, .small).font
    static let montserratSemiBoldMedium = FontSetup.monserrat(.semiBold, .medium).font
    static let montserratBoldExtraLarge = FontSetup.monserrat(.bold, .extraLarge).font
    static let montserratRegularSmall = FontSetup.monserrat(.regular, .small).font
}

private enum FontSetup {
    case monserrat(FontStyle, FontSize)
    
    var font: UIFont {
        if !FontBundle.isFontsLoaded {
            FontBundle.registerFonts()
        }
        
        switch self {
            case .monserrat(let style, let size):
                switch style {
                    case .bold:
                        return UIFont(name: "Montserrat-Bold", size: size.value)!
                    case .semiBold:
                        return UIFont(name: "Montserrat-SemiBold", size: size.value)!
                    case .regular:
                        return UIFont(name: "Montserrat-Regular", size: size.value)!
            }
        }
    }
}

private class FontBundle {
    
    static var isFontsLoaded: Bool = false
    
    static func registerFonts() {
        let fonts = ["Montserrat-Bold",
                     "Montserrat-SemiBold",
                     "Montserrat-Regular"]
        
        
        fonts.forEach { fontName in
            registerFont(fontName, extension: "ttf", in: Bundle.module)
        }
        FontBundle.isFontsLoaded = true
    }
    
    static func registerFont(_ fontName: String, extension: String, in bundle: Bundle) {
        guard let fontURL = bundle.url(forResource: fontName, withExtension: `extension`) else {
            return
        }
        CTFontManagerRegisterFontsForURL(fontURL as CFURL, CTFontManagerScope.process, nil)
    }
}

public enum FontSize {
    
    /// Iphone(14.0): IPad(16.0)
    case extraSmall
    
    /// Iphone(16.0): IPad(20.0)
    case small
    
    /// Iphone(18.0): IPad(24.0)
    case medium
    
    /// Iphone(20.0.0): IPad(26.0.0)
    case large
    
    /// Iphone(24.0.0): IPad(32.0.0)
    case extraLarge
    
    var value: CGFloat {
        let isIphone = !DeviceConstants.isIpadOrIpadScreenSize()
        
        switch self {
        case .extraSmall:
            return isIphone ? 14.0 : 16.0
        case .small:
            return isIphone ? 16.0 : 20.0
        case .medium:
            return isIphone ? 18.0 : 24.0
        case .large:
            return isIphone ? 20.0 : 26.0
        case .extraLarge:
            return isIphone ? 24.0 : 32.0
        }
    }
}

public enum FontStyle: CaseIterable {
    case bold
    case semiBold
    case regular
}
