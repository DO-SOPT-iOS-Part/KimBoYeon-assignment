//
//  ListViewController.swift
//  weatherApp
//
//  Created by 김보연 on 10/23/23.
//

import UIKit

import SnapKit
import Then

class ListViewController: UIViewController {
    
    
    
    private let listCollectionView: UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let listCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return listCollectionView
    }()
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    
    
    @objc
    func locationListTapped() {
        pushToViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        title = "날씨"
        
        
        let editerButton = UIButton(type: .custom)
        editerButton.setImage(UIImage(named: "editer"), for: .normal)
        
        let customBarButtonItem = UIBarButtonItem(customView: editerButton)
        navigationItem.rightBarButtonItem = customBarButtonItem
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = false
        
        self.navigationController?.navigationBar.isHidden = false
        
        setCollectionViewConfig()
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        
        listCollectionView.do {
            $0.backgroundColor = .black
        }
        
        searchController.do {
            $0.searchBar.placeholder = "도시 또는 공항 검색"
            $0.searchBar.searchBarStyle = .minimal
            $0.obscuresBackgroundDuringPresentation = false
            $0.hidesNavigationBarDuringPresentation = false
        }
        
        
    }
    
    private func setLayout() {
        
        self.view.addSubview(listCollectionView)
        
        
        
        listCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
    private func setCollectionViewConfig() {
        self.listCollectionView.register(weatherListCollectionCell.self,
                                         forCellWithReuseIdentifier: weatherListCollectionCell.identifier)
        self.listCollectionView.delegate = self
        self.listCollectionView.dataSource = self
    }
    
    
    @objc
    func pushToViewController() {
        let DetailViewController = DetailViewController()
        self.navigationController?.pushViewController(DetailViewController, animated: true)
    }
    
}

extension ListViewController: UICollectionViewDelegate {}
extension ListViewController: UICollectionViewDataSource {
    
    func collectionView(_ listCollectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherCardItemData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedWeatherItem = weatherCardItemData[indexPath.row]
        let detailViewController = DetailViewController()
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func collectionView(_ listCollectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = listCollectionView.dequeueReusableCell(withReuseIdentifier: weatherListCollectionCell.identifier,
                                                                for: indexPath) as? weatherListCollectionCell else {return UICollectionViewCell()}
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
