import Foundation

public struct TVShow {
    
    let id: String
    let name: String
    let type: String
    let language: String
    let genres: [String]
    let image: String
    
    public init(id: String, name: String, type: String, language: String, genres: [String], image: String) {
        self.id = id
        self.name = name
        self.type = type
        self.language = language
        self.genres = genres
        self.image = image
    }
}

extension TVShow: Equatable {
    
    public static func == (lhs: TVShow, rhs: TVShow) -> Bool {
        return lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.language == rhs.language &&
            lhs.genres == rhs.genres &&
            lhs.image == rhs.image
    }
}
