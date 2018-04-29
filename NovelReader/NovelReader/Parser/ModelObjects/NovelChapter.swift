final class NRNovelChapter: FTModelData {

    var shortTitle: String? = nil
    var title: String? = nil
    var url: String? = nil
    var content: String? = nil
    var releaseDate: String? = nil

    /* Coding Keys */
    enum CodingKeys: String, CodingKey  {
        case shortTitle
        case title = "name"
        case url
        case content
        case releaseDate

    }
}

