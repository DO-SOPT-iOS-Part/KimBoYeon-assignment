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
    private var detailWeatherDivider = UIView()
    private let horizontalScrollView = UIScrollView()
    private var weatherDetailHorizontalStackView = UIStackView()
    private var tabBar = UIView()
    private let mapImage = UIImageView()
    private var locationIconStackView = UIStackView()
    private let nowMyLocationImage = UIImageView()
    private let otherLocationImage = UIImageView()
    private let locationListImageButton = UIButton()
    
    let item1 = itemListView()
    let item2 = itemListView()
    let item3 = itemListView()
    let item4 = itemListView()
    let item5 = itemListView()
    let item6 = itemListView()
    let item7 = itemListView()
    let item8 = itemListView()
    
    
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
        
        detailWeatherDivider.do {
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
        self.rectangleBoxView.addSubViews(weatherDetailHorizontalStackView, detailTextLabel, detailWeatherDivider, horizontalScrollView)
        verticalScrollView.addSubview(verticalContentView)
        verticalScrollView.contentSize = verticalContentView.bounds.size
        weatherDetailHorizontalStackView.addArrangedSubview(item1, item2, item3, item4, item5, item6, item7, item8)
        horizontalScrollView.addSubview(weatherDetailHorizontalStackView)
        horizontalScrollView.contentSize = weatherDetailHorizontalStackView.bounds.size
        
        // 배경 이미지 레이아웃
        backgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        // 스택뷰 레이아웃
        topStackView.snp.makeConstraints {
            $0.top.equalTo(verticalContentView).inset(78)
            $0.leading.trailing.equalTo(verticalContentView)
        }
        
        // 날씨 상세뷰 박스 레이아웃
        rectangleBoxView.snp.makeConstraints {
            $0.top.equalTo(topStackView.snp.bottom).offset(44)
            $0.leading.trailing.equalTo(verticalContentView).inset(20)
            $0.height.equalTo(212)
        }

        // 하루 날씨 전반 디테일 박스 레이아웃
        detailTextLabel.snp.makeConstraints {
            $0.top.equalTo(rectangleBoxView).inset(10)
            $0.leading.trailing.equalTo(rectangleBoxView).inset(15)
        }

        // Divider 레이아웃
        detailWeatherDivider.snp.makeConstraints {
            $0.top.equalTo(detailTextLabel.snp.bottom).offset(14)
            $0.leading.equalTo(rectangleBoxView).inset(15)
            $0.trailing.equalTo(rectangleBoxView)
            $0.height.equalTo(1)
        }

        // 날씨 디테일 수평 스크롤 레이아웃
        horizontalScrollView.snp.makeConstraints {
            $0.top.equalTo(detailWeatherDivider).inset(14)
            $0.leading.trailing.equalTo(rectangleBoxView)
            $0.bottom.equalTo(rectangleBoxView).inset(10)
        }
        
        // 날씨 디테일 수평 스택뷰 레이아웃
        weatherDetailHorizontalStackView.snp.makeConstraints {
            $0.top.equalTo(horizontalScrollView)
            $0.leading.trailing.equalTo(horizontalScrollView).inset(12)
            $0.bottom.equalTo(horizontalScrollView)
        }
        
        // 하단 탭바 레이아웃
        tabBar.snp.makeConstraints {
            $0.height.equalTo(82)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        // 하단 탭 바 지도 아이콘 레이아웃
        mapImage.snp.makeConstraints {
            $0.top.equalTo(tabBar.snp.top).inset(4)
            $0.leading.equalTo(tabBar.snp.leading).inset(10)
        }
        
        // 수직스크롤뷰 레이아웃
        verticalScrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        // 수직스크롤뷰의 컨텐츠뷰 레이아웃
        verticalContentView.snp.makeConstraints {
            $0.edges.equalTo(verticalScrollView)
        }
        
        verticalContentView.snp.makeConstraints {
            $0.width.equalTo(verticalScrollView.snp.width)
            $0.height.greaterThanOrEqualTo(view.snp.height).priority(.low)
        }
        
        // 하단 탭 바 위치 관련 아이콘 스택뷰 레이아웃
        locationIconStackView.snp.makeConstraints {
            $0.top.equalTo(tabBar).inset(14)
            $0.centerX.equalTo(tabBar)
            $0.width.equalTo(52)
        }
        
        // 하단 탭 바 위치 리스트 아이콘 레이아웃
        locationListImageButton.snp.makeConstraints {
            $0.top.equalTo(tabBar).inset(4)
            $0.trailing.equalTo(tabBar).inset(9)
        }
    }
}

