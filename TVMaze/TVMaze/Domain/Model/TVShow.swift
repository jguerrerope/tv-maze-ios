import Foundation

public struct TVShow {
    
    let id: String
    let name: String
    let image: String
    let type: String
    let language: String
    let genres: [String]
    let summary: String
    let rating: Float
    
    public init(id: String, name: String, image: String, type: String, language: String, genres: [String], summary: String, rating: Float) {
        self.id = id
        self.name = name
        self.image = image
        self.type = type
        self.language = language
        self.genres = genres
        self.summary = summary
        self.rating = rating
    }
}

extension TVShow: Equatable {
    
    public static func == (lhs: TVShow, rhs: TVShow) -> Bool {
        return lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.image == rhs.image &&
            lhs.type == rhs.type &&
            lhs.language == rhs.language &&
            lhs.genres == rhs.genres &&
            lhs.summary == rhs.summary &&
            lhs.rating == rhs.rating
    }
}
