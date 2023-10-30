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
    
    private let editerImageView = UIImageView()
    private let titleLabel = UILabel()
    private let searchBar = UISearchBar()
    private let locationListImageView = UIImageView()
    private let scrollView = UIScrollView ()
    private var contentView = UIView()
    private let myLocationLabel = UILabel()
    private let myLocationNameLabel = UILabel()
    private let myLocationConditionLabel = UILabel()
    private let myLocationAverageTemperatureLabel = UILabel()
    private let myLocationMinimumTemperatureLabel = UILabel()
    private let myLocationMaximumTemperatureLabel = UILabel()
    
    
    @objc
    func locationListTapped() {
        pushToViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(locationListTapped))
        locationListImageView.isUserInteractionEnabled = true
        locationListImageView.addGestureRecognizer(tapGesture)
        
        self.navigationController?.navigationBar.isHidden = true
        
        setStyle()
        setLayout()
    }
}

private extension ListViewController {
    func setStyle() {
        
        view.backgroundColor = .black
        
        // 상단 editerIcon 이미지 생성
        editerImageView.do {
            $0.image = UIImage(named: "editer")
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        // "날씨" 타이틀 레이블 생성
        titleLabel.do {
            $0.text = "날씨"
            $0.textColor = .white
            $0.font = .bold(size: 36)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.textAlignment = .center
        }
        
        // seachBar 생성
        searchBar.do {
            $0.setImage(UIImage(named: "search"), for: .search, state: .normal)
            $0.placeholder = "도시 또는 공항 검색"
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.searchBarStyle = .minimal
            $0.keyboardType = .default
            $0.searchTextField.clearButtonMode = .whileEditing
            $0.tintColor = UIColor.white
            $0.searchTextField.textColor = UIColor.white
        }
        
        // 리스트 카드뷰 생성
        locationListImageView.do {
            $0.image = UIImage(named: "list-1x")
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        // 날씨 리스트
        scrollView.do {
            $0.alwaysBounceVertical = true
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        contentView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        myLocationLabel.do {
            $0.text = "나의 위치"
            $0.textColor = .white
            $0.font = .bold(size: 24)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.textAlignment = .center
        }
        
        myLocationNameLabel.do {
            $0.text = "고양시"
            $0.textColor = .white
            $0.font = .medium(size: 17)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.textAlignment = .center
        }
        
        myLocationConditionLabel.do {
            $0.text = "흐림"
            $0.textColor = .white
            $0.font = .medium(size: 16)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.textAlignment = .center
        }
        
        myLocationAverageTemperatureLabel.do {
            $0.text = "21°"
            $0.textColor = .white
            $0.font = .light(size: 52)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.textAlignment = .center
        }
        
        myLocationMinimumTemperatureLabel.do {
            $0.text = "최저:15°"
            $0.textColor = .white
            $0.font = .medium(size: 15)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.textAlignment = .center
        }
        
        myLocationMaximumTemperatureLabel.do {
            $0.text = "최고:29°"
            $0.textColor = .white
            $0.font = .medium(size: 15)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.textAlignment = .center
        }
        
    }
    
    func setLayout() {
        
        view.addSubViews(editerImageView, titleLabel, searchBar, scrollView, locationListImageView)
        scrollView.addSubview(contentView)
        scrollView.contentSize = contentView.frame.size
//        view.addSubview(searchBar)
        contentView.addSubview(locationListImageView)
        locationListImageView.addSubViews(myLocationLabel, myLocationNameLabel, myLocationConditionLabel, myLocationAverageTemperatureLabel, myLocationMinimumTemperatureLabel, myLocationMaximumTemperatureLabel)
        
        
        // 상단 에디터 아이콘 레이아웃
        editerImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(52)
            $0.trailing.equalToSuperview().offset(-10)
        }
        
        // "날씨" 타이틀 레이아웃
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(97)
            $0.leading.equalToSuperview().offset(20)
        }
        
        // 서치바 레이아웃
        searchBar.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(12)
        }
        
        // 수직스크롤뷰 레이아웃
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(204)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        // 수직스크롤뷰의 컨텐츠뷰 레이아웃
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
        }
        
        contentView.snp.makeConstraints {
            $0.width.equalTo(scrollView.snp.width)
            $0.height.greaterThanOrEqualTo(view.snp.height).priority(.low)
        }
        
        // 리스트카드뷰 레이아웃
        locationListImageView.snp.makeConstraints {
            $0.top.equalTo(scrollView).offset(15)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        // "나의 위치" 레이블 레이아웃
        myLocationLabel.snp.makeConstraints {
            $0.top.equalTo(locationListImageView).offset(10)
            $0.leading.equalTo(locationListImageView).offset(16)
        }
        
        // "고양시" 레이블 레이아웃
        myLocationNameLabel.snp.makeConstraints {
            $0.top.equalTo(myLocationLabel.snp.bottom).offset(2)
            $0.leading.equalTo(locationListImageView).offset(16)
        }
        
        // 날씨 상태 레이블 레이아웃
        myLocationConditionLabel.snp.makeConstraints {
            $0.bottom.equalTo(locationListImageView).inset(10)
            $0.leading.equalTo(locationListImageView).offset(16)
        }
        
        // 평균 기온 레이블 레이아웃
        myLocationAverageTemperatureLabel.snp.makeConstraints {
            $0.top.equalTo(locationListImageView).offset(4)
            $0.trailing.equalTo(locationListImageView).inset(16)
        }

        // 최저 기온 레이블 레이아웃
        myLocationMinimumTemperatureLabel.snp.makeConstraints {
            $0.top.equalTo(myLocationAverageTemperatureLabel.snp.bottom).offset(23)
            $0.trailing.equalTo(locationListImageView).inset(16)
        }
        
        // 최고 기온 레이블 레이아웃
        myLocationMaximumTemperatureLabel.snp.makeConstraints {
            $0.top.equalTo(myLocationAverageTemperatureLabel.snp.bottom).offset(23)
            $0.trailing.equalTo(locationListImageView).inset(79)
        }
    }
    
    
    @objc
    func pushToViewController() {
        let DetailViewController = DetailViewController()
        self.navigationController?.pushViewController(DetailViewController, animated: true)
    }
    
}
