final class NRNovel: FTModelData {

    var identifer: String? = nil
    var lastChapter: String? = nil
    var chapterList: [NRNovelChapter]? = nil
    var searchString: String? = nil
    var rating: String? = nil
    var author: String? = nil
    var lastUpdated: String? = nil
    var novelURL: String? = nil
    var imageURL: String? = nil
    var keyworkds: [String]? = nil
    var contentDescription: String? = nil
    var artist: String? = nil
    var status: String? = nil
    var views: String? = nil
    var title: String? = nil
    var novelType: String? = nil

    /* Coding Keys */
    enum CodingKeys: String, CodingKey  {
        case identifer = "id"
        case lastChapter = "lastchapter"
        case chapterList
        case searchString = "nameunsigned"
        case rating
        case author
        case lastUpdated = "updatetime"
        case novelURL = "url"
        case imageURL = "image"
        case keyworkds = "genres"
        case contentDescription = "summary"
        case artist
        case status
        case views
        case title = "name"
        case novelType = "type"

    }
}
