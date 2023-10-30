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
        
        view.addSubViews(editerImageView, titleLabel, scrollView, locationListImageView)
        scrollView.addSubview(contentView)
        scrollView.contentSize = contentView.frame.size
        view.addSubview(searchBar)
        contentView.addSubview(locationListImageView)
        locationListImageView.addSubViews(myLocationLabel, myLocationNameLabel, myLocationConditionLabel, myLocationAverageTemperatureLabel, myLocationMinimumTemperatureLabel, myLocationMaximumTemperatureLabel)
        
        
        NSLayoutConstraint.activate([
            editerImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 52),
            editerImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 97),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12)
        ])
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 204),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor)
        ])
        
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow
        contentViewHeight.isActive = true
        
        NSLayoutConstraint.activate([
            locationListImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 15),
            locationListImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            locationListImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            locationListImageView.heightAnchor.constraint(equalToConstant: 117)
        ])
        
        NSLayoutConstraint.activate([
            myLocationLabel.topAnchor.constraint(equalTo: locationListImageView.topAnchor, constant: 10),
            myLocationLabel.leadingAnchor.constraint(equalTo: locationListImageView.leadingAnchor, constant: 16),
            myLocationLabel.bottomAnchor.constraint(equalTo: locationListImageView.bottomAnchor, constant: -75)
        ])
        
        NSLayoutConstraint.activate([
            myLocationNameLabel.topAnchor.constraint(equalTo: myLocationLabel.bottomAnchor, constant: 2),
            myLocationNameLabel.leadingAnchor.constraint(equalTo: locationListImageView.leadingAnchor, constant: 16),
            myLocationNameLabel.bottomAnchor.constraint(equalTo: locationListImageView.bottomAnchor, constant: -53)
        ])
        
        NSLayoutConstraint.activate([
            myLocationConditionLabel.topAnchor.constraint(equalTo: myLocationNameLabel.bottomAnchor, constant: 23),
            myLocationConditionLabel.leadingAnchor.constraint(equalTo: locationListImageView.leadingAnchor, constant: 16),
            myLocationConditionLabel.bottomAnchor.constraint(equalTo: locationListImageView.bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            myLocationAverageTemperatureLabel.topAnchor.constraint(equalTo: locationListImageView.topAnchor, constant: 4),
            myLocationAverageTemperatureLabel.trailingAnchor.constraint(equalTo: locationListImageView.trailingAnchor, constant: -16),
            myLocationAverageTemperatureLabel.bottomAnchor.constraint(equalTo: locationListImageView.bottomAnchor, constant: -53)
        ])
        
        NSLayoutConstraint.activate([
            myLocationMinimumTemperatureLabel.topAnchor.constraint(equalTo: myLocationAverageTemperatureLabel.bottomAnchor, constant: 23),
            myLocationMinimumTemperatureLabel.trailingAnchor.constraint(equalTo: locationListImageView.trailingAnchor, constant: -16),
            myLocationMinimumTemperatureLabel.bottomAnchor.constraint(equalTo: locationListImageView.bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            myLocationMaximumTemperatureLabel.topAnchor.constraint(equalTo: myLocationAverageTemperatureLabel.bottomAnchor, constant: 23),
            myLocationMaximumTemperatureLabel.trailingAnchor.constraint(equalTo: myLocationMinimumTemperatureLabel.leadingAnchor, constant: -6),
            myLocationMaximumTemperatureLabel.bottomAnchor.constraint(equalTo: locationListImageView.bottomAnchor, constant: -10)
        ])
    }
    
    
    @objc
    func pushToViewController() {
        let DetailViewController = DetailViewController()
        self.navigationController?.pushViewController(DetailViewController, animated: true)
    }
    
}
