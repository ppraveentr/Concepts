final class NRNovel: FTModelData {

    var identifer: String? = "sadsa"
    var lastChapter: String? = nil
    var imageURL: String? = nil
    var chapterList: [NRNovelChapter]? = [NRNovelChapter()]
    var contentDescription: String? = "sadsa"
    var views: String? = nil
    var keyworkds: [String]? = nil
    var searchString: String? = nil
    var title: String? = nil
    var author: String? = nil
    var lastUpdated: String? = nil

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
}

