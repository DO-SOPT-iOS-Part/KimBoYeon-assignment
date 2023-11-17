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
    
    private let listCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())

    private let searchController = UISearchController(searchResultsController: nil)
    private var filteredWeatherList: [WeatherCardItemData] = []
    
    
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
        searchController.searchResultsUpdater = self
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = false
        
        self.navigationController?.navigationBar.isHidden = false
        
        setCollectionViewConfig()
        setStyle()
        setLayout()
        
        Task {
            await setWeatherInfo()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func setStyle() {
        listCollectionView.do {
            $0.backgroundColor = .black
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.scrollDirection = .vertical
            $0.collectionViewLayout = flowLayout
        }
        
        searchController.do {
            $0.searchBar.placeholder = "도시 또는 공항 검색"
            $0.searchBar.searchBarStyle = .minimal
            $0.obscuresBackgroundDuringPresentation = false
            $0.hidesNavigationBarDuringPresentation = false
            $0.searchBar.searchTextField.textColor = .white
        }
    }
    
    func convertTime(timezone: Int) -> String {
        let timeZone = TimeZone(secondsFromGMT: timezone)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.timeZone = timeZone
        let currentDate = Date()
        let formattedTime = dateFormatter.string(from: currentDate)
        return formattedTime
    }
    
    private func setWeatherInfo() async {
        let locationData = ["gongju", "suwon", "gumi", "iksan", "daegu", "cheongju", "mokpo", "busan", "seosan", "seoul"]
        for i in locationData {
            do {
                let status = try await GetInfoService.shared.PostRegisterData(name: i)
                let getInfo: WeatherCardItemData = WeatherCardItemData(myLocationLabel: status.name,
                                                                       myLocationNameLabel:
                                                                        convertTime(timezone: status.timezone),
                                                                       myLocationConditionLabel: status.weather[0].main,
                                                                       myLocationAverageTemperatureLabel: Int(status.main.temp),
                                                                       myLocationMinimumTemperatureLabel: Int(status.main.tempMin),
                                                                       myLocationMaximumTemperatureLabel: Int(status.main.tempMax))
                weatherList.append(getInfo)
            } catch {
                print(error)
            }
        }
        self.listCollectionView.reloadData()
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
    
    @objc func pushToViewController() {
        let DetailViewController = DetailViewController()
        self.navigationController?.pushViewController(DetailViewController, animated: true)
    }
}

extension ListViewController: UICollectionViewDelegate {}
extension ListViewController: UICollectionViewDataSource {
    
    func collectionView(_ listCollectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isSearchActive ? filteredWeatherList.count : weatherList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func collectionView(_ listCollectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = listCollectionView.dequeueReusableCell(withReuseIdentifier: weatherListCollectionCell.identifier,
                                                                for: indexPath) as? weatherListCollectionCell else {return UICollectionViewCell()}
        item.bindData(data: weatherList[indexPath.row])
        return item
    }

    private var isSearchActive: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    private var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
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

extension ListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text?.lowercased(), !text.isEmpty else {
            filteredWeatherList = weatherList
            listCollectionView.reloadData()
            return
        }
        
        filteredWeatherList = weatherList.filter {
            $0.myLocationLabel.lowercased().contains(text)
        }
        
        listCollectionView.reloadData()
    }
}
