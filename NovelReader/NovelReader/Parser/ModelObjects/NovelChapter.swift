final class NRNovelChapter: FTModelData {

    var shortTitle: String? = nil
    var title: String? = nil
    var url: String? = nil
    var releaseDate: String? = nil

    /* Coding Keys */
    enum CodingKeys: String, CodingKey  {
        case shortTitle
        case title
        case url
        case releaseDate

    }
}

