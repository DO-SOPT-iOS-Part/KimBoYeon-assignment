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
        }
        
        searchController.do {
            $0.searchBar.placeholder = "도시 또는 공항 검색"
            $0.searchBar.searchBarStyle = .minimal
            $0.obscuresBackgroundDuringPresentation = false
            $0.hidesNavigationBarDuringPresentation = false
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
        let locationData = ["gongju", "gwangju", "gumi", "gunsan", "daegu", "daejeon", "mokpo", "busan", "seosan", "seoul"]
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
    
    // 화면 전환
    @objc
    func pushToViewController() {
        let DetailViewController = DetailViewController()
        self.navigationController?.pushViewController(DetailViewController, animated: true)
    }
    
}

// 데이터 전달
extension ListViewController: UICollectionViewDelegate {}
extension ListViewController: UICollectionViewDataSource {
    
    func collectionView(_ listCollectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let selectedWeatherItem = weatherList[indexPath.row]
        let detailViewController = DetailViewController()
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func collectionView(_ listCollectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = listCollectionView.dequeueReusableCell(withReuseIdentifier: weatherListCollectionCell.identifier,
                                                                for: indexPath) as? weatherListCollectionCell else {return UICollectionViewCell()}
        item.bindData(data: weatherList[indexPath.row])
        return item
    }
}

// 전체 컬렉션뷰 레이아웃
extension ListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 40, height: 117)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(16)
    }
}
