import Foundation

class TVShowItemViewPayload: BaseViewPayload {
    let id: String
    let title: String
    let image: String
    
    init(id: String, title: String, image: String) {
        self.id = id
        self.title = title
        self.image = image
    }
}

extension TVShowItemViewPayload: Equatable {
    public static func == (lhs: TVShowItemViewPayload, rhs: TVShowItemViewPayload) -> Bool {
        return lhs.id == rhs.id &&
            lhs.title == rhs.title
            && lhs.image == rhs.image
    }
}



