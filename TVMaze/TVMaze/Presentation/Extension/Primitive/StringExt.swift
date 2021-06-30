import Foundation

extension String {
    
    func localized() -> String {
        return self.localizedByBundle(bundle: Bundle.module, tableName: "Localizable", staticTableName: "StaticLocalizable")
    }
    
    func localizedByBundle(bundle: Bundle, tableName: String, staticTableName: String?) -> String {
        var valueLocalized = NSLocalizedString(self, tableName: tableName, bundle: bundle, value: "NO_VALUE", comment: "")
        
        if "NO_VALUE" == valueLocalized {
            if let staticTableName = staticTableName {
                valueLocalized = NSLocalizedString(self, tableName: staticTableName, bundle: bundle, value: valueLocalized, comment: "")
            }
            
//            if "NO_VALUE" == valueLocalized {
//                #if DEBUG
//                fatalError("string \(self) is undefined")
//                #endif
//            }
            return valueLocalized
        }
    
        return valueLocalized
    }
}
