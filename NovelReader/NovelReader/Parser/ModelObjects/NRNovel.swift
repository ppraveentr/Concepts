final class NRNovel: FTModelData {
    var identifer: String = ""
    var lastChapter: String = ""
    var imageURL: String = ""
    var chapterList: [NovelChapter] = []
    var contentDescription: String = ""
    var views: String = ""
    var keyworkds: NovelChapter? = nil
    var searchString: String = ""
    var title: String = ""
    var author: String = ""
    var lastUpdated: String = ""
    
    
    /* Coding Keys */
    enum CodingKeys: String, CodingKey  {
        
        case identifer = "id"
        case lastChapter = "lastchapter"
        case imageURL = "image"
        case chapterList
        case contentDescription = "description"
        case views = "view"
        case keyworkds
        case searchString = "nameunsigned"
        case title = "name"
        case author
        case lastUpdated = "updatetime"
        
    }
    
    /* Decoder */
    init(from decoder: Decoder) throws {
        
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        if let value = try container?.decodeIfPresent(String.self, forKey: .identifer) {
            self.identifer = value
        }
        if let value = try container?.decodeIfPresent(String.self, forKey: .lastChapter) {
            self.lastChapter = value
        }
        if let value = try container?.decodeIfPresent(String.self, forKey: .imageURL) {
            self.imageURL = value
        }
        if let value = try container?.decodeIfPresent([NovelChapter].self, forKey: .chapterList) {
            self.chapterList = value
        }
        if let value = try container?.decodeIfPresent(String.self, forKey: .contentDescription) {
            self.contentDescription = value
        }
        if let value = try container?.decodeIfPresent(String.self, forKey: .views) {
            self.views = value
        }
        if let value = try container?.decodeIfPresent(NovelChapter.self, forKey: .keyworkds) {
            self.keyworkds = value
        }
        if let value = try container?.decodeIfPresent(String.self, forKey: .searchString) {
            self.searchString = value
        }
        if let value = try container?.decodeIfPresent(String.self, forKey: .title) {
            self.title = value
        }
        if let value = try container?.decodeIfPresent(String.self, forKey: .author) {
            self.author = value
        }
        if let value = try container?.decodeIfPresent(String.self, forKey: .lastUpdated) {
            self.lastUpdated = value
        }
        
    }
    
    /* Encoder */
    func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        if !identifer.isEmpty {
            try container.encode(identifer, forKey: .identifer)
        }
        if !lastChapter.isEmpty {
            try container.encode(lastChapter, forKey: .lastChapter)
        }
        if !imageURL.isEmpty {
            try container.encode(imageURL, forKey: .imageURL)
        }
        if !chapterList.isEmpty {
            try container.encode(chapterList, forKey: .chapterList)
        }
        if !contentDescription.isEmpty {
            try container.encode(contentDescription, forKey: .contentDescription)
        }
        if !views.isEmpty {
            try container.encode(views, forKey: .views)
        }
        if keyworkds != nil {
            try container.encode(keyworkds, forKey: .keyworkds)
        }
        if !searchString.isEmpty {
            try container.encode(searchString, forKey: .searchString)
        }
        if !title.isEmpty {
            try container.encode(title, forKey: .title)
        }
        if !author.isEmpty {
            try container.encode(author, forKey: .author)
        }
        if !lastUpdated.isEmpty {
            try container.encode(lastUpdated, forKey: .lastUpdated)
        }
        
    }
    
}
