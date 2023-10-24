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
        return horizontalScrollView
    }()
    
//    // 세부 수평 스택뷰
//    private var weatherDetailHorizontalStackView: UIStackView = {
//        let weatherDetailHorizontalStackView = UIStackView()
//        weatherDetailHorizontalStackView.translatesAutoresizingMaskIntoConstraints = false
//        weatherDetailHorizontalStackView.axis = .horizontal
//        weatherDetailHorizontalStackView.alignment = .fill
//        weatherDetailHorizontalStackView.distribution = .equalSpacing
//        weatherDetailHorizontalStackView.spacing = 22
//        return weatherDetailHorizontalStackView
//    }()
    
    // 세부 수직 스택뷰
    private var weatherDetailverticalStackView: UIStackView = {
        let weatherDetailverticalStackView = UIStackView()
        weatherDetailverticalStackView.translatesAutoresizingMaskIntoConstraints = false
        weatherDetailverticalStackView.axis = .vertical
        weatherDetailverticalStackView.alignment = .fill
        weatherDetailverticalStackView.distribution = .equalSpacing
        weatherDetailverticalStackView.spacing = 14
        return weatherDetailverticalStackView
    }()
    
    // 세부 날씨 시간 레이블
    private var weatherDetailTimeLabel: UILabel = {
        let weatherDetailTimeLabel = UILabel()
        weatherDetailTimeLabel.text = "Now"
        weatherDetailTimeLabel.textColor = .white
        weatherDetailTimeLabel.font = UIFont(name: "SFProText-Medium", size: 17)
        weatherDetailTimeLabel.textAlignment = .center
        return weatherDetailTimeLabel
    }()
    
    // 세부 날씨 아이콘 이미지
    private let weatherDetailImage: UIImageView = {
        let weatherDetailImage = UIImageView()
        weatherDetailImage.image = UIImage(named: "cloud-night")
        weatherDetailImage.translatesAutoresizingMaskIntoConstraints = false
        return weatherDetailImage
    }()
    // 세부 날씨 온도 레이블
    private var weatherDetailTemperatureLabel: UILabel = {
        let weatherDetailTemperatureLabel = UILabel()
        weatherDetailTemperatureLabel.text = "19°"
        weatherDetailTemperatureLabel.textColor = .white
        weatherDetailTemperatureLabel.font = UIFont(name: "SFProText-Medium", size: 22)
        weatherDetailTemperatureLabel.textAlignment = .center
        return weatherDetailTemperatureLabel
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
    private let locationListImage: UIImageView = {
        let locationListImage = UIImageView()
        locationListImage.image = UIImage(named: "location-list")
        locationListImage.translatesAutoresizingMaskIntoConstraints = false
        return locationListImage
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tabBar.layer.addBorder([.top], color: UIColor.white.withAlphaComponent(0.3), width: 0.4)
    }
}

private extension ViewController {
    
    func setStyle() {
        self.view.addSubViews(backgroundView, topStackView, rectangleBoxView, tabBar)
        self.tabBar.addSubViews(mapImage, locationIconStackView, locationListImage)
        self.locationIconStackView.addArrangedSubview(nowMyLocationImage, otherLocationImage)
        self.rectangleBoxView.addSubViews(horizontalScrollView, detailTextLabel, scollLneView)
        self.horizontalScrollView.addSubview(weatherDetailverticalStackView)
        // forEach는 단순 반복, map은 조건문으로 조건문에 성립하는 결과물을 반환해준다.
        self.topStackView.addArrangedSubview(locationNameLabel, temperatureLabel, weatherLabel, weatherDetailLabel)
        self.weatherDetailverticalStackView.addArrangedSubview(weatherDetailTimeLabel, weatherDetailImage, weatherDetailTemperatureLabel)
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
            topStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 78),
            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            topStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -522)
        ])
        
        // 날씨 상세뷰 박스 레이아웃
        NSLayoutConstraint.activate([
            rectangleBoxView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 44),
            rectangleBoxView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            rectangleBoxView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            rectangleBoxView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -266)
        ])
        
        // 하루 날씨 전반 디테일 박스 레이아웃
        NSLayoutConstraint.activate([
            detailTextLabel.topAnchor.constraint(equalTo: rectangleBoxView.topAnchor, constant: 10),
            detailTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            detailTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            detailTextLabel.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            scollLneView.topAnchor.constraint(equalTo: detailTextLabel.bottomAnchor, constant: 11),
            scollLneView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:34),
            scollLneView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21),
            scollLneView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            horizontalScrollView.topAnchor.constraint(equalTo: scollLneView.topAnchor, constant: 14),
            horizontalScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            horizontalScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            horizontalScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -276)
        ])
        
//        // 날씨 디테일 수평 스택뷰 레이아웃
//        NSLayoutConstraint.activate([
//            weatherDetailHorizontalStackView.topAnchor.constraint(equalTo: horizontalScrollView.topAnchor, constant: 0),
//            weatherDetailHorizontalStackView.leadingAnchor.constraint(equalTo: horizontalScrollView.leadingAnchor, constant: 0),
//            weatherDetailHorizontalStackView.trailingAnchor.constraint(equalTo: horizontalScrollView.trailingAnchor, constant: 0),
//            weatherDetailHorizontalStackView.bottomAnchor.constraint(equalTo: horizontalScrollView.bottomAnchor, constant: 0)
//        ])
        
        // 날씨 디테일 수직 스택뷰 레이아웃
        NSLayoutConstraint.activate([
            weatherDetailverticalStackView.topAnchor.constraint(equalTo: horizontalScrollView.topAnchor, constant: 0),
            weatherDetailverticalStackView.widthAnchor.constraint(equalToConstant: 44),
            weatherDetailverticalStackView.bottomAnchor.constraint(equalTo: horizontalScrollView.bottomAnchor, constant: 0)
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
        
        // 하단 탭 바 위치 관련 아이콘 스택뷰 레이아웃
        NSLayoutConstraint.activate([
            locationIconStackView.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: 14),
            locationIconStackView.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),

            locationIconStackView.widthAnchor.constraint(equalToConstant: 52),
            locationIconStackView.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor, constant: -44)
        ])
        
        // 하단 탭 바 위치 리스트 아이콘 레이아웃
        NSLayoutConstraint.activate([
            locationListImage.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: 4),
            locationListImage.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor, constant: -9)
        ])
        
    }
}

