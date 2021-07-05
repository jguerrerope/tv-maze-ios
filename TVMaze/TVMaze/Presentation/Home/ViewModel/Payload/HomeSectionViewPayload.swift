import Foundation
import DeepDiff

enum HomeSectionViewPayload {
    case show(TVShowItemViewPayload)
    case nextPage(String)
}

extension HomeSectionViewPayload: Equatable {
    
    public static func == (lhs: HomeSectionViewPayload, rhs: HomeSectionViewPayload) -> Bool {
        if case .show(let lhsValue) = lhs, case .show(let rhsValue) = rhs {
            return lhsValue == rhsValue
        }
        
        if case .nextPage(let lhsValue) = lhs, case .nextPage(let rhsValue) = rhs {
            return lhsValue == rhsValue
        }
        return true
    }
}

extension HomeSectionViewPayload: DiffAware {
    public typealias DiffId = String
    public var diffId: DiffId {
        return String(describing: self)
    }
    
    public static func compareContent(_ lhs: HomeSectionViewPayload, _ rhs: HomeSectionViewPayload) -> Bool {
        return lhs == rhs
    }
}
