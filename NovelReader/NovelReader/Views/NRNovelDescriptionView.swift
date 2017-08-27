//
//  NRNovelDescriptionView.swift
//  NovelReader
//
//  Created by Praveen Prabhakar on 25/08/17.
//  Copyright © 2017 Praveen Prabhakar. All rights reserved.
//

import Foundation

class NRNovelDescriptionView: FTView {
    
    @IBOutlet var titleLabel: FTLabel?
    @IBOutlet var descriptionLabel: FTLabel?
    @IBOutlet var contentImageView: UIImageView?
    
    @IBOutlet var chapterLabel: FTLabel?
    @IBOutlet var lastUpdateLabel: FTLabel?
    @IBOutlet var viewsButton: FTButton?
    
    func configureContent(novel: NovelObject) {
        self.contentImageView?.downloadedFrom(link: novel.imageURL ?? "")
        self.titleLabel?.text = novel.title ?? ""
        self.descriptionLabel?.text = novel.contentDesc ?? ""

        self.chapterLabel?.text = novel.lastChapter
        self.lastUpdateLabel?.text = novel.lastUpdated
        self.viewsButton?.setTitle(novel.views, for: .normal)
    }
}
