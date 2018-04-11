//
//  FTCollectionViewController.swift
//  NovelReader
//
//  Created by Praveen Prabhakar on 21/08/17.
//  Copyright © 2017 Praveen Prabhakar. All rights reserved.
//

import Foundation

class NRNovelCollectionHeaderView: UICollectionReusableView {

    var segmentedControl: FTSegmentedControl? = nil

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSegmentView()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.setupSegmentView()
    }
    
    func setupSegmentView() {
        
        segmentedControl = FTSegmentedControl(items: [ "Recent Update", "Top Views" ]) { (segment) in
                print(segment)
        };

        self.backgroundColor = "#df6e6e".hexColor()
        self.pin(view: segmentedControl!, withEdgeOffsets: FTEdgeOffsets(10))
    }
}

class NRNovelCollectionViewController: NRBaseViewController {

    lazy var collectionView: UICollectionView = self.getCollectionView()
    //Dummycell for collectionView Height calculation
    lazy var sampleCell: NRNovelCollectionViewCell = self.getDummyNovelCell()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchNovelList()
    }

    //get-Novels from backend
    var novel: NRNovels? = NRNovels()
    func fetchNovelList() {
        NRServiceProvider.fetchRecentUpdateList(novel: self.novel) { (novelList) in
            self.configureColletionView()
        }
    }
}

extension NRNovelCollectionViewController {

    func getDummyNovelCell() -> NRNovelCollectionViewCell {
        return NRNovelCollectionViewCell.fromNib() as! NRNovelCollectionViewCell
    }

    func getCollectionView() -> UICollectionView {
        let flow = self.getflowLayout()
        //
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collectionView.backgroundView?.backgroundColor = .clear
        return collectionView
    }

    func getflowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.headerReferenceSize = CGSize(width:0, height:45)
        layout.footerReferenceSize = .zero
        layout.sectionInset = UIEdgeInsets(top: 15, left: 20, bottom: 10, right: 20)
        layout.sectionHeadersPinToVisibleBounds = true
        return layout
    }

    func configureColletionView() {

        //Only re-load collectionView if already present
        guard collectionView.superview == nil else {
            self.collectionView.reloadData()
            return
        }

        //Setup collectionView if not added in view.

        //Register Novel Cells
        collectionView.register(NRNovelCollectionViewCell.getNIBFile(),
                                forCellWithReuseIdentifier: "kNovelCellIdentifer")
        //Collection Header: Segment Control
        collectionView.register(NRNovelCollectionHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
                                withReuseIdentifier: "headerCell")

        //CollectionView delegate
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear

        self.mainView?.pin(view: collectionView)
        self.collectionView.reloadData()
    }
}

extension NRNovelCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerCell", for: indexPath) as! NRNovelCollectionHeaderView

        headerView.segmentedControl?.handler = { [unowned self] (sender) in
            self.fetchNovelList()
        }

        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return novel?.novelList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "kNovelCellIdentifer", for: indexPath)

        if let cur = novel?.novelList?[indexPath.row],
            let cell = cell as? NRNovelCollectionViewCell {
           cell.configureContent(novel: cur)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let cur = novel?.novelList?[indexPath.row] {
            sampleCell.configureContent(novel: cur)
        }
        
        return sampleCell.getSize(baseView: collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cur = novel?.novelList?[indexPath.row]
        self.performSegue(withIdentifier: "kShowNovelChapterList", sender: cur)
    }
}

extension NRNovelCollectionViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "kShowNovelChapterList" {
            if let nextViewController = segue.destination as? NRNovelChapterViewController {
                nextViewController.novel = sender as? NRNovel
            }
        }
        else if segue.identifier == "kShowNovelReaderView" {
            if let nextViewController = segue.destination as? NRReaderViewController {
                nextViewController.novel = sender as? NRNovelChapter
            }
        }
    }
}
