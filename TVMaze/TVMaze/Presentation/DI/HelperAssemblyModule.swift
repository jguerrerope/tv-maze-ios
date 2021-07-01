import Foundation

public class HelperAssemblyModule {
    
    public static let dispacherHelperProvider = FactoryProvider {
        DispacherHelperImpl()
    }
}
