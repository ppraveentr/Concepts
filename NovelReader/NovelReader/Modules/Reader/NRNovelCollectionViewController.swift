//
//  FTCollectionViewController.swift
//  NovelReader
//
//  Created by Praveen Prabhakar on 21/08/17.
//  Copyright © 2017 Praveen Prabhakar. All rights reserved.
//

import Foundation

//MARK: NRNovelCollectionHeaderView
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
        self.theme = ThemeStyle.defaultStyle

        segmentedControl = FTSegmentedControl(items: [ "Recent Update", "Top Views" ]) { (segment) in
                print(segment)
        };

        self.pin(view: segmentedControl!, withEdgeOffsets: FTEdgeOffsets(10))
    }
}

//MARK: NRNovelCollectionViewController
class NRNovelCollectionViewController: NRBaseViewController {

    enum NRNovelCollectionType: Int {
        case recentNovel = 0
        case topNovel

        var cellIdentifier: String {
            switch self {
            case .recentNovel:
                return "kRecentNovelCellIdentifier"
            case .topNovel:
                return "kNovelCellIdentifier"
            }
        }

        func registerCell(_ collectionView: UICollectionView) {
            switch self {
            case .recentNovel:
                collectionView.register(NRRecentNovelCollectionViewCell.getNIBFile(),
                                        forCellWithReuseIdentifier: self.cellIdentifier)
            case .topNovel:
                collectionView.register(NRNovelCollectionViewCell.getNIBFile(),
                                        forCellWithReuseIdentifier: self.cellIdentifier)
            }
        }

        func getNib() -> (UICollectionViewCell & NRConfigureNovelCellProtocal) {
            switch self {
            case .recentNovel:
                return NRRecentNovelCollectionViewCell.fromNib() as! NRRecentNovelCollectionViewCell
            case .topNovel:
                return NRNovelCollectionViewCell.fromNib() as! NRNovelCollectionViewCell
            }
        }
    }

    lazy var collectionView: UICollectionView = self.getCollectionView()
    //Update collectionView when contentList changes
    var currentNovelList: [NRNovel]? = [] {
        didSet {
            self.configureColletionView()
        }
    }

    lazy var novel: NRNovels? = NRNovels()
    //Collection Content Type
    var novelCollectionType: NRNovelCollectionType = .recentNovel {
        didSet {
            self.fetchNovelList()
        }
    }

    //Dummycell for collectionView cell Height calculation
    lazy var sampleTopNovelCell = NRNovelCollectionType.topNovel.getNib()
    lazy var sampleRecentNovelCell = NRNovelCollectionType.recentNovel.getNib()
    var dummyNovelCell: NRConfigureNovelCellProtocal {
        switch novelCollectionType {
        case .recentNovel:
            return self.sampleRecentNovelCell
        case .topNovel:
            return self.sampleTopNovelCell
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Novel Reader"
        self.novelCollectionType = .recentNovel

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: NRGoogleAuth.signInButton())

    }

    //Updates novelCollectionType, which interns fetchNovelList from backend
    func updateNovelSegment(segmentControl: FTSegmentedControl) {
        novelCollectionType = NRNovelCollectionType(rawValue: segmentControl.selectedSegmentIndex)!
    }

    //get-Novels from backend
    func fetchNovelList() {
        switch novelCollectionType {
        case .recentNovel:
            NRServiceProvider.fetchRecentUpdateList() { (novelList) in
                self.currentNovelList = novelList
            }
        case .topNovel:
            NRServiceProvider.fetchNovelList(novel: self.novel) { (novelList) in
                self.currentNovelList = self.novel?.novelList
            }
        }
    }
}

extension NRNovelCollectionViewController {

    func getCollectionView() -> UICollectionView {
        let flow = self.getflowLayout()
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

        //Relaod collectionView on exit
        defer {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }

        //Only re-load collectionView if already present
        guard collectionView.superview == nil else {
            return
        }

        //Setup collectionView, if not added in view.

        //Register Cell
        NRNovelCollectionType.topNovel.registerCell(collectionView)
        NRNovelCollectionType.recentNovel.registerCell(collectionView)

        //Collection Header: Segment Control
        collectionView.register(NRNovelCollectionHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
                                withReuseIdentifier: "headerCell")

        //CollectionView delegate
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear

        self.mainView?.pin(view: collectionView)
    }
}

extension NRNovelCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {

    //viewForSupplementaryElement
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerCell", for: indexPath) as! NRNovelCollectionHeaderView

        headerView.segmentedControl?.handler = { [unowned self] (sender) in
            if let segment = headerView.segmentedControl {
                self.updateNovelSegment(segmentControl: segment)
            }
        }

        return headerView
    }

    //numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentNovelList?.count ?? 0
    }

    //cellForItem
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cellIdentifier = novelCollectionType.cellIdentifier
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)

        if let cur = currentNovelList?[indexPath.row] {
            if let cell = cell as? NRConfigureNovelCellProtocal {
                cell.configureContent(novel: cur)
            }
        }
        
        return cell
    }

    //Cell sizeForItem
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let cell = self.dummyNovelCell
        
        if let cur = currentNovelList?[indexPath.row] {
            cell.configureContent(novel: cur)
        }
        
        return cell.getSize(baseView: collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cur = currentNovelList?[indexPath.row]

        if novelCollectionType == .recentNovel {
            self.performSegue(withIdentifier: "kShowNovelReaderView", sender: cur)
        }else{
            self.performSegue(withIdentifier: "kShowNovelChapterList", sender: cur)
        }
    }
}
