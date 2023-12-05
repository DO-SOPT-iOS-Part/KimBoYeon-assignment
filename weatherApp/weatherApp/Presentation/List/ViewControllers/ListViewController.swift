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
    var weatherList : [WeatherCardItemData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            await setWeatherInfo()
        }
    }
    
    override func loadView() {
        self.view = listView
    }
    
    override func setUI() {
        view.backgroundColor = .black
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
        listView.listCollectionView.reloadData()
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
        navigationController?.navigationBar.isHidden = true
    }
}

extension ListViewController: UICollectionViewDelegate {}

extension ListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func collectionView(_ listCollectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = listCollectionView.dequeueReusableCell(withReuseIdentifier: ListCardCollectionViewCell.identifier,
                                                                for: indexPath) as? ListCardCollectionViewCell else {return UICollectionViewCell()}
        item.bindData(data: weatherList[indexPath.row])
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
