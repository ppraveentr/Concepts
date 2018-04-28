//
//  NRUtility.swift
//  NovelReader
//
//  Created by Praveen Prabhakar on 20/08/17.
//  Copyright © 2017 Praveen Prabhakar. All rights reserved.
//

import Foundation

protocol NRConfigureNovelCellProtocal {
    func configureContent(novel: NRNovel)
    func getSize(baseView: UIView) -> CGSize
}

extension NRConfigureNovelCellProtocal where Self: UIView {

    func getSize(baseView: UIView) -> CGSize {

        let compressedSize = self.systemLayoutSizeFitting(UILayoutFittingCompressedSize)

        if (compressedSize.width*2 + 15*4) < baseView.frame.width {
            return CGSize(width: compressedSize.width, height: compressedSize.height)
        }

        let size = self.systemLayoutSizeFitting( CGSize(width: baseView.frame.width - 30, height: CGFloat.greatestFiniteMagnitude),
                                                 withHorizontalFittingPriority: UILayoutPriority.fittingSizeLevel,
                                                 verticalFittingPriority: UILayoutPriority.fittingSizeLevel)

        return CGSize(width: baseView.frame.width - 30, height: size.height)

    }
}
