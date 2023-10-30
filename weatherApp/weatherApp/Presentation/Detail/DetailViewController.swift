//
//  DetailViewController.swift
//  weatherApp
//
//  Created by 김보연 on 10/15/23.
//

import UIKit

import Then
import SnapKit


class DetailViewController: UIViewController {
    
    private let backgroundView = UIImageView()
    private let verticalScrollView = UIScrollView()
    private var verticalContentView = UIView()
    private var topStackView = UIStackView()
    private var locationNameLabel = UILabel()
    private var temperatureLabel = UILabel()
    private var weatherLabel = UILabel()
    private var weatherDetailLabel = UILabel()
    private var rectangleBoxView = UIView()
    private var detailTextLabel = UILabel()
    private var scollLneView = UIView()
    private let horizontalScrollView = UIScrollView()
    private var weatherDetailHorizontalStackView = UIStackView()
    private var tabBar = UIView()
    private let mapImage = UIImageView()
    private var locationIconStackView = UIStackView()
    private let nowMyLocationImage = UIImageView()
    private let otherLocationImage = UIImageView()
    private let locationListImageButton = UIButton()
    
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

private extension DetailViewController {
    
    func setStyle() {
        
        // 배경 이미지 설정
        
        backgroundView.do {
            $0.frame = UIScreen.main.bounds
            $0.image = UIImage(named: "Img-1x")
            $0.contentMode = .scaleAspectFit
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        // 수직 스크롤뷰 설정
        verticalScrollView.do {
            $0.alwaysBounceVertical = true
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.contentInsetAdjustmentBehavior = .never
        }
        
        // 컨텐츠뷰 설정
        verticalContentView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        // 상단 스택뷰 설정
        topStackView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.axis = .vertical
            $0.alignment = .fill
            $0.distribution = .equalSpacing
            $0.spacing = 4
        }
        
        // 스택바 안에 레이블 설정
        locationNameLabel.do {
            $0.text = "의정부시"
            $0.textColor = .white
            $0.font = .regular(size: 36)
            $0.textAlignment = .center
        }
        
        temperatureLabel.do {
            $0.text = "21°"
            $0.textColor = .white
            $0.font = .thin(size: 102)
            $0.textAlignment = .center
        }
        
        weatherLabel.do {
            $0.text = "흐림"
            $0.textColor = .white
            $0.font = .regular(size: 24)
            $0.textAlignment = .center
        }
        
        weatherDetailLabel.do {
            $0.text = "최고:29°  최저:15°"
            $0.textColor = .white
            $0.font = .medium(size: 24)
            $0.textAlignment = .center
        }
        
        rectangleBoxView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.01).cgColor
            $0.layer.cornerRadius = 15
            $0.layer.masksToBounds = false
            $0.layer.borderWidth = 0.25
            $0.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3).cgColor
        }
        
        detailTextLabel.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.text = "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다."
            $0.textColor = .white
            $0.numberOfLines = 0
            $0.lineBreakMode = .byCharWrapping
            $0.font = .regular(size: 18)
            $0.textAlignment = .left
        }
        
        scollLneView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25).cgColor
            $0.layer.masksToBounds = false
        }
        
        // 수평 스크롤 뷰
        horizontalScrollView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.alwaysBounceHorizontal = true
        }
        
        // 세부 수평 스택뷰
        weatherDetailHorizontalStackView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.axis = .horizontal
            $0.spacing = 22
        }
        
        // 하단 탭 바
        tabBar.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = UIColor(hexCode: "2A3040")
        }
        
        // 하단 탭 바 지도 아이콘
        mapImage.do {
            $0.image = UIImage(named: "map")
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        // 하단 탭 바 위치 관련 아이콘 스택뷰
        locationIconStackView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.axis = .horizontal
            $0.alignment = .fill
            $0.distribution = .equalSpacing
            $0.spacing = 4
        }
        
        // 하단 탭 바 현재 위치 아이콘
        nowMyLocationImage.do {
            $0.image = UIImage(named: "my-location")
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        // 하단 탭 바 다른 위치 아이콘
        otherLocationImage.do {
            $0.image = UIImage(named: "dot")
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        // 하단 탭 바 위치 리스트 아이콘
        locationListImageButton.do {
            $0.setImage(UIImage(named: "location-list"), for: .normal)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.isUserInteractionEnabled = true
        }
        
    }
    
    func setLayout() {
        
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
        ])
        
        // 날씨 상세뷰 박스 레이아웃
        NSLayoutConstraint.activate([
            rectangleBoxView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 44),
            rectangleBoxView.leadingAnchor.constraint(equalTo: verticalContentView.leadingAnchor, constant: 20),
            rectangleBoxView.trailingAnchor.constraint(equalTo: verticalContentView.trailingAnchor, constant: -20),
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

