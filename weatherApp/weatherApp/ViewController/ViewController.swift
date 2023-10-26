//
//  ViewController.swift
//  weatherApp
//
//  Created by 김보연 on 10/15/23.
//

import UIKit

class ViewController: UIViewController {
    
    // 배경 이미지 설정
    private let backgroundView: UIImageView = {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Img-1x")
        backgroundImage.contentMode = .scaleAspectFit
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImage
    }()
    
    // 수직 스크롤뷰 설정
    private let verticalScrollView: UIScrollView = {
        let verticalScrollView = UIScrollView()
        verticalScrollView.alwaysBounceVertical = true
        verticalScrollView.translatesAutoresizingMaskIntoConstraints = false
        verticalScrollView.contentInsetAdjustmentBehavior = .never
        return verticalScrollView
    }()
    
    // 컨텐츠뷰 설정
    private var verticalContentView: UIView = {
        let verticalContentView = UIView()
        verticalContentView.translatesAutoresizingMaskIntoConstraints = false
        return verticalContentView
    }()
    
    // 상단 스택뷰 설정
    private var topStackView: UIStackView = {
        let topStackView = UIStackView()
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        topStackView.axis = .vertical
        topStackView.alignment = .fill
        topStackView.distribution = .equalSpacing
        topStackView.spacing = 4
        return topStackView
    }()
    
    // 스택바 안에 레이블 설정
    private var locationNameLabel: UILabel = {
        let locationNameLabel = UILabel()
        locationNameLabel.text = "의정부시"
        locationNameLabel.textColor = .white
        locationNameLabel.font = UIFont(name: "SFProText-Regular", size: 36)
        locationNameLabel.textAlignment = .center
        return locationNameLabel
    }()
    
    private var temperatureLabel: UILabel = {
        let temperatureLabel = UILabel()
        temperatureLabel.text = "21°"
        temperatureLabel.textColor = .white
        temperatureLabel.font = UIFont(name: "SFProText-Thin", size: 102)
        temperatureLabel.textAlignment = .center
        return temperatureLabel
    }()
    
    private var weatherLabel: UILabel = {
        let weatherLabel = UILabel()
        weatherLabel.text = "흐림"
        weatherLabel.textColor = .white
        weatherLabel.font = UIFont(name: "SFProText-Regular", size: 24)
        weatherLabel.textAlignment = .center
        return weatherLabel
    }()
    
    private var weatherDetailLabel: UILabel = {
        let weatherDetailLabel = UILabel()
        weatherDetailLabel.text = "최고:29°  최저:15°"
        weatherDetailLabel.textColor = .white
        weatherDetailLabel.font = UIFont(name: "SFProText-Medium", size: 24)
        weatherDetailLabel.textAlignment = .center
        return weatherDetailLabel
    }()
    
    private var rectangleBoxView: UIView = {
        let rectangleBoxView = UIView()
        rectangleBoxView.translatesAutoresizingMaskIntoConstraints = false
        rectangleBoxView.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.01).cgColor
        rectangleBoxView.layer.cornerRadius = 15
        rectangleBoxView.layer.masksToBounds = false
        rectangleBoxView.layer.borderWidth = 0.25
        rectangleBoxView.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3).cgColor
        return rectangleBoxView
    }()
    
    private var detailTextLabel: UILabel = {
        let detailTextLabel = UILabel()
        detailTextLabel.translatesAutoresizingMaskIntoConstraints = false
        detailTextLabel.text = "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다."
        detailTextLabel.textColor = .white
        detailTextLabel.numberOfLines = 0
        detailTextLabel.lineBreakMode = .byCharWrapping
        detailTextLabel.font = UIFont(name: "SFProText-Regular", size: 18)
        detailTextLabel.textAlignment = .left
        return detailTextLabel
    }()
    
    private var scollLneView: UIView = {
        let scollLneView = UIView()
        scollLneView.translatesAutoresizingMaskIntoConstraints = false
        scollLneView.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25).cgColor
        scollLneView.layer.masksToBounds = false
        return scollLneView
    }()
    
    // 수평 스크롤 뷰
    private let horizontalScrollView: UIScrollView = {
        let horizontalScrollView = UIScrollView()
        horizontalScrollView.translatesAutoresizingMaskIntoConstraints = false
        horizontalScrollView.alwaysBounceHorizontal = true
        return horizontalScrollView
    }()
    
    // 세부 수평 스택뷰
    private var weatherDetailHorizontalStackView: UIStackView = {
        let weatherDetailHorizontalStackView = UIStackView()
        weatherDetailHorizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        weatherDetailHorizontalStackView.axis = .horizontal
        weatherDetailHorizontalStackView.spacing = 22
        return weatherDetailHorizontalStackView
    }()
    
    // 하단 탭 바
    private var tabBar: UIView = {
        let tabBar = UIView()
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        tabBar.backgroundColor = UIColor(hexCode: "2A3040")
        return tabBar
    }()
    
    // 하단 탭 바 지도 아이콘
    private let mapImage: UIImageView = {
        let mapImage = UIImageView()
        mapImage.image = UIImage(named: "map")
        mapImage.translatesAutoresizingMaskIntoConstraints = false
        return mapImage
    }()
    
    // 하단 탭 바 위치 관련 아이콘 스택뷰
    private var locationIconStackView: UIStackView = {
        let locationIconStackView = UIStackView()
        locationIconStackView.translatesAutoresizingMaskIntoConstraints = false
        locationIconStackView.axis = .horizontal
        locationIconStackView.alignment = .fill
        locationIconStackView.distribution = .equalSpacing
        locationIconStackView.spacing = 4
        return locationIconStackView
    }()
    
    // 하단 탭 바 현재 위치 아이콘
    private let nowMyLocationImage: UIImageView = {
        let nowMyLocationImage = UIImageView()
        nowMyLocationImage.image = UIImage(named: "my-location")
        nowMyLocationImage.translatesAutoresizingMaskIntoConstraints = false
        return nowMyLocationImage
    }()
    
    // 하단 탭 바 다른 위치 아이콘
    private let otherLocationImage: UIImageView = {
        let otherLocationImage = UIImageView()
        otherLocationImage.image = UIImage(named: "dot")
        otherLocationImage.translatesAutoresizingMaskIntoConstraints = false
        return otherLocationImage
    }()
    
    // 하단 탭 바 위치 리스트 아이콘
    private let locationListImageButton: UIButton = {
        let locationListImageButton = UIButton()
        locationListImageButton.setImage(UIImage(named: "location-list"), for: .normal)
        locationListImageButton.translatesAutoresizingMaskIntoConstraints = false
        locationListImageButton.isUserInteractionEnabled = true
        return locationListImageButton
    }()
    
    
    let item1 = listView()
    let item2 = listView()
    let item3 = listView()
    let item4 = listView()
    let item5 = listView()
    let item6 = listView()
    let item7 = listView()
    let item8 = listView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        item1.todayTimeLabel.text = "Now"
        item1.todayWeatherImageView.image = UIImage(named: "cloud-night")
        item1.todayTemperatureLabel.text = "19°"
        
        item2.todayTimeLabel.text = "10시"
        item2.todayWeatherImageView.image = UIImage(named: "raining")
        item2.todayTemperatureLabel.text = "20°"
        
        item3.todayTimeLabel.text = "11시"
        item3.todayWeatherImageView.image = UIImage(named: "raining")
        item3.todayTemperatureLabel.text = "20°"
        
        item4.todayTimeLabel.text = "12시"
        item4.todayWeatherImageView.image = UIImage(named: "raining")
        item4.todayTemperatureLabel.text = "20°"
        
        item5.todayTimeLabel.text = "13시"
        item5.todayWeatherImageView.image = UIImage(named: "raining")
        item5.todayTemperatureLabel.text = "20°"
        
        item6.todayTimeLabel.text = "14시"
        item6.todayWeatherImageView.image = UIImage(named: "raining")
        item6.todayTemperatureLabel.text = "20°"
        
        item7.todayTimeLabel.text = "15시"
        item7.todayWeatherImageView.image = UIImage(named: "raining")
        item7.todayTemperatureLabel.text = "20°"
        
        item8.todayTimeLabel.text = "16시"
        item8.todayWeatherImageView.image = UIImage(named: "raining")
        item8.todayTemperatureLabel.text = "20°"
        
        self.navigationController?.navigationBar.isHidden = true
        locationListImageButton.addTarget(self, action: #selector(locationListButtonTapped), for: .touchUpInside)
        
        setStyle()
        setLayout()
    }
    
    @objc
    func locationListButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tabBar.layer.addBorder([.top], color: UIColor.white.withAlphaComponent(0.3), width: 0.4)
    }
}

private extension ViewController {
    
    func setStyle() {
        
        self.view.addSubViews(backgroundView, verticalScrollView, tabBar)
        self.tabBar.addSubViews(mapImage, locationIconStackView, locationListImageButton)
        self.locationIconStackView.addArrangedSubview(nowMyLocationImage, otherLocationImage)
        verticalContentView.addSubViews(topStackView, rectangleBoxView)
        self.topStackView.addArrangedSubview(locationNameLabel, temperatureLabel, weatherLabel, weatherDetailLabel)
        self.rectangleBoxView.addSubViews(weatherDetailHorizontalStackView, detailTextLabel, scollLneView, horizontalScrollView)
        verticalScrollView.addSubview(verticalContentView)
        verticalScrollView.contentSize = verticalContentView.bounds.size
        weatherDetailHorizontalStackView.addArrangedSubview(item1, item2, item3, item4, item5, item6, item7, item8)
        horizontalScrollView.addSubview(weatherDetailHorizontalStackView)
        horizontalScrollView.contentSize = weatherDetailHorizontalStackView.bounds.size
        // forEach는 단순 반복, map은 조건문으로 조건문에 성립하는 결과물을 반환해준다.
    }
    func setLayout() {
        
        // 배경 이미지 레이아웃
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        // 스택뷰 레이아웃
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: verticalContentView.topAnchor, constant: 78),
            topStackView.leadingAnchor.constraint(equalTo: verticalContentView.leadingAnchor, constant: 0),
            topStackView.trailingAnchor.constraint(equalTo: verticalContentView.trailingAnchor, constant: 0)
            //topStackView.bottomAnchor.constraint(equalTo: rectangleBoxView.topAnchor, constant: -44)
        ])
        
        // 날씨 상세뷰 박스 레이아웃
        NSLayoutConstraint.activate([
            rectangleBoxView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 44),
            rectangleBoxView.leadingAnchor.constraint(equalTo: verticalContentView.leadingAnchor, constant: 20),
            rectangleBoxView.trailingAnchor.constraint(equalTo: verticalContentView.trailingAnchor, constant: -20),
            //rectangleBoxView.bottomAnchor.constraint(equalTo: verticalContentView.bottomAnchor)
            rectangleBoxView.heightAnchor.constraint(equalToConstant: 212)
        ])
        
        // 하루 날씨 전반 디테일 박스 레이아웃
        NSLayoutConstraint.activate([
            detailTextLabel.topAnchor.constraint(equalTo: rectangleBoxView.topAnchor, constant: 10),
            detailTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            detailTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35)
            //detailTextLabel.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            scollLneView.topAnchor.constraint(equalTo: detailTextLabel.bottomAnchor, constant: 14),
            scollLneView.leadingAnchor.constraint(equalTo: rectangleBoxView.leadingAnchor, constant:15),
            scollLneView.trailingAnchor.constraint(equalTo: rectangleBoxView.trailingAnchor),
            scollLneView.heightAnchor.constraint(equalToConstant: 1)
        ])
        // 날씨 디테일 수평 스크롤 레이아웃
        NSLayoutConstraint.activate([
            horizontalScrollView.topAnchor.constraint(equalTo: scollLneView.topAnchor, constant: 14),
            horizontalScrollView.leadingAnchor.constraint(equalTo: rectangleBoxView.leadingAnchor),
            horizontalScrollView.trailingAnchor.constraint(equalTo: rectangleBoxView.trailingAnchor),
            horizontalScrollView.bottomAnchor.constraint(equalTo: rectangleBoxView.bottomAnchor, constant: -10)
            // horizontalScrollView.widthAnchor.constraint(equalToConstant: 320),
            //horizontalScrollView.heightAnchor.constraint(equalToConstant: 122)
        ])
        
        // 날씨 디테일 수평 스택뷰 레이아웃
        NSLayoutConstraint.activate([
            weatherDetailHorizontalStackView.topAnchor.constraint(equalTo: horizontalScrollView.topAnchor),
            weatherDetailHorizontalStackView.leadingAnchor.constraint(equalTo: horizontalScrollView.leadingAnchor, constant: 12),
            weatherDetailHorizontalStackView.trailingAnchor.constraint(equalTo: horizontalScrollView.trailingAnchor, constant: -12),
            weatherDetailHorizontalStackView.bottomAnchor.constraint(equalTo: horizontalScrollView.bottomAnchor)
        ])
        
        
        // 하단 탭바 레이아웃
        NSLayoutConstraint.activate([
            tabBar.heightAnchor.constraint(equalToConstant: 82),
            tabBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tabBar.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        // 하단 탭 바 지도 아이콘 레이아웃
        NSLayoutConstraint.activate([
            mapImage.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: 4),
            mapImage.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            verticalScrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            verticalScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            verticalScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            verticalScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            verticalContentView.leadingAnchor.constraint(equalTo: verticalScrollView.contentLayoutGuide.leadingAnchor),
            verticalContentView.trailingAnchor.constraint(equalTo: verticalScrollView.contentLayoutGuide.trailingAnchor),
            verticalContentView.topAnchor.constraint(equalTo: verticalScrollView.contentLayoutGuide.topAnchor),
            verticalContentView.bottomAnchor.constraint(equalTo: verticalScrollView.contentLayoutGuide.bottomAnchor)
        ])
        
        //verticalContentView.heightAnchor.constraint(equalToConstant: 1000).isActive = true
        verticalContentView.widthAnchor.constraint(equalTo: verticalScrollView.widthAnchor).isActive = true
        let contentViewHeight = verticalContentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow
        contentViewHeight.isActive = true
        
        // 하단 탭 바 위치 관련 아이콘 스택뷰 레이아웃
        NSLayoutConstraint.activate([
            locationIconStackView.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: 14),
            locationIconStackView.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            
            locationIconStackView.widthAnchor.constraint(equalToConstant: 52),
            locationIconStackView.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor, constant: -44)
        ])
        
        // 하단 탭 바 위치 리스트 아이콘 레이아웃
        NSLayoutConstraint.activate([
            locationListImageButton.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: 4),
            locationListImageButton.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor, constant: -9)
        ])
    }

}

