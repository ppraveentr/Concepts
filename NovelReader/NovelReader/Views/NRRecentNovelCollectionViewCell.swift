//
//  NRRecentNovelCollectionViewCell.swift
//  NovelReader
//
//  Created by Praveen Prabhakar on 28/04/18.
//  Copyright © 2018 Praveen Prabhakar. All rights reserved.
//

import UIKit

class NRRecentNovelCollectionViewCell: UICollectionViewCell, NRConfigureNovelCellProtocal {
    @IBOutlet weak var novelTitle: FTLabel?
    @IBOutlet weak var lastUpdateTimeLabel: FTLabel?

    func configureContent(novel: NRNovel) {
        self.novelTitle?.text = novel.title
        self.lastUpdateTimeLabel?.text = novel.lastUpdated
    }
}
