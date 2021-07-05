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
            return .none
        case .fail:
            return .none
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
}
