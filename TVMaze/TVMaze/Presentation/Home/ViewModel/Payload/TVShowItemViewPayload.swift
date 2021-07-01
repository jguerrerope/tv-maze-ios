import Foundation
import DeepDiff

class TVShowItemViewPayload {
    let title: String
    let image: String
    
    init(title: String, image: String) {
        self.title = title
        self.image = image
    }
}

extension TVShowItemViewPayload: Equatable {
    public static func == (lhs: TVShowItemViewPayload, rhs: TVShowItemViewPayload) -> Bool {
        return lhs.title == rhs.title
            && lhs.image == rhs.image
    }
}

extension TVShowItemViewPayload: DiffAware {
    
    public typealias DiffId = String
    public var diffId: DiffId {
        return String(describing: self)
    }
    
    public static func compareContent(_ lhs: TVShowItemViewPayload,
                                      _ rhs: TVShowItemViewPayload) -> Bool {

        return lhs == rhs
    }
}

