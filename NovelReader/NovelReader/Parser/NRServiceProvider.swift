//
//  NRServiceProvider.swift
//  NovelReader
//
//  Created by Praveen Prabhakar on 20/08/17.
//  Copyright © 2017 Praveen Prabhakar. All rights reserved.
//

import Foundation

class NRServiceProvider {

    //Get list of all Novels
    class func fetchRecentUpdateList(novel: NRNovels?, _ completionHandler: @escaping (_ novelsList: NRNovels?) -> Swift.Void) {

        FTServiceClient.make(kfetchNovelList, modelStack: novel) { (status) in

            switch (status) {
            case .success(let res, _):
                if let novelResponse = res.responseStack as? NRNovels {
                    var novel = novel
                    novel!.merge(data: novelResponse)
                    completionHandler(novel)
                }
                else if let novelList = res.responseStack as? [NRNovel] {
                    novel?.novelList?.append(contentsOf: novelList)
                    completionHandler(novel)
                }else {
                    completionHandler(res.responseStack as? NRNovels)
                }
                break
            case .failed(let res, _):
                completionHandler(res?.responseStack as? NRNovels)
                break
            }
        }
    }
    
    //Get list of all chapters from a single NRNovelObject
    class func getNovelChapters(_ novel: NRNovel, getChapters: Bool = true,
                                completionHandler: @escaping (_ novelsList: JSON) -> Swift.Void) {

//        let parse = { (html: String) in
//            let valye: JSON = [:]
//            completionHandler(valye)
//        }
//
//        FTServiceClient.getContentFromURL(self.nonvelChaptersList(novel: novel), completionHandler: { (htmlString, data, httpURLResponse) in
//            parse(htmlString)
//        })
    }
    
    //Get list of all chapters from a single NRNovelObject
    class func getNovelChapters(_ novel: inout NRNovel, details: JSON) {
        
        if let value = details["title"] as? String {
            novel.title = value
        }
        
        if let value = details["imageURL"] as? String {
            novel.imageURL = value
        }
        
        if let value = details["chapterList"] as? [NRNovelChapter] {
            novel.chapterList = value
        }
        
        if let value = details["contentDescription"] as? String {
            novel.contentDescription = value
        }
    }
    
    //Get chapter content
    class func parseNovelReader(_ url: String,
                                completionHandler: @escaping (_ chapterContent: String) -> Swift.Void) {
        
//        let parse = { (html: String) in
//            completionHandler("")
//        }
//        
//        FTServiceClient.getContentFromURL(url) { (htmlString, data, httpURLResponse) in
//            parse(htmlString)
//        }
    }
}
