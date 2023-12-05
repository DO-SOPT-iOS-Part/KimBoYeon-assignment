//
//  ListViewController.swift
//  weatherApp
//
//  Created by 김보연 on 10/23/23.
//

import UIKit

import SnapKit
import Then

class ListViewController: BaseViewController {
    
    private let listView = ListView()
    private let searchController = UISearchController(searchResultsController: nil)
    private let editerButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSearchController()
    }
    
    override func loadView() {
        self.view = listView
    }
    
    override func setUI() {
        view.backgroundColor = .black
        
        searchController.do {
            $0.searchBar.placeholder = "도시 또는 공항 검색"
            $0.searchBar.searchBarStyle = .minimal
            $0.obscuresBackgroundDuringPresentation = false
            $0.hidesNavigationBarDuringPresentation = false
        }
        
        editerButton.do {
            $0.setImage(UIImage(systemName: "ellipsis.circle"), for: .normal)
            $0.tintColor = .white
        }
        
    }
    
    override func setDelegates() {
        listView.listCollectionView.delegate = self
        listView.listCollectionView.dataSource = self
    }
    
    override func setRegister() {
        ListCardCollectionViewCell.register(to: listView.listCollectionView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    func setSearchController() {
        let customBarButtonItem = UIBarButtonItem(customView: editerButton)
        navigationItem.rightBarButtonItem = customBarButtonItem
        
        navigationItem.searchController = searchController
        navigationItem.title = "날씨"
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = false
        self.navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}

extension ListViewController: UICollectionViewDelegate {}

extension ListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherCardItemData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func collectionView(_ listCollectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = listCollectionView.dequeueReusableCell(withReuseIdentifier: ListCardCollectionViewCell.identifier,
                                                                for: indexPath) as? ListCardCollectionViewCell else {return UICollectionViewCell()}
        item.bindData(data: weatherCardItemData[indexPath.row])
        return item
    }
}

extension ListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 40, height: 117)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(16)
    }
}
