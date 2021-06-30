import Foundation

struct Empty {
    fileprivate init() {
    }
}

enum Resource<T> {
    case loading(show: Bool = true)
    case success(T)
    case fail(String)
    
    public func data() -> T? {
        switch self {
        case .loading:
            return nil
        case .fail:
            return nil
        case .success(let value):
            return value
        }
    }
    
    public static func failUnknown() -> Resource<T> {
        return Resource<T>.fail("error_something_wrong".localized())
    }
    
    public static func successEmpty() -> Resource<Empty> {
        return Resource<Empty>.success(Empty())
    }
    
    public static func failFromError(_ error: Error) -> Resource<T> {
        if let generalDomainError = error as? GeneralDomainError {
            switch generalDomainError {
            case .noFound:
                return Resource<T>.fail("error_something_wrong".localized())
                
            case .notConnection:
                return Resource<T>.fail("error_no_connection".localized())
            }
        }
        
        return Resource<T>.fail("error_something_wrong".localized())
    }
}
