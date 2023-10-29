//
//  ListViewController.swift
//  weatherApp
//
//  Created by 김보연 on 10/23/23.
//

import UIKit

class ListViewController: UIViewController {
    
    // 상단 editerIcon 이미지 생성
    private let editerImageView: UIImageView = {
        let editerImageView = UIImageView()
        editerImageView.image = UIImage(named: "editer")
        editerImageView.translatesAutoresizingMaskIntoConstraints = false
        return editerImageView
    }()
    
    // "날씨" 타이틀 레이블 생성
    private let titleLabel: UILabel = {
        var titleLabel = UILabel()
        titleLabel.text = "날씨"
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "SFProText-Bold", size: 36)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    // seachBar 생성
    private let searchBar: UISearchBar = {
        var searchBar = UISearchBar()
        searchBar.setImage(UIImage(named: "search"), for: .search, state: .normal)
        searchBar.placeholder = "도시 또는 공항 검색"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchBarStyle = .minimal
        searchBar.keyboardType = .default
        searchBar.searchTextField.clearButtonMode = .whileEditing
        searchBar.tintColor = UIColor.white
        searchBar.searchTextField.textColor = UIColor.white
        return searchBar
    }()
    
    // 리스트 카드뷰 생성
    private let locationListImageView: UIImageView = {
        let locationListImageView = UIImageView()
        locationListImageView.image = UIImage(named: "list-1x")
        locationListImageView.translatesAutoresizingMaskIntoConstraints = false
        return locationListImageView
    }()
    
    // 날씨 리스트
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private let myLocationLabel: UILabel = {
        var myLocationLabel = UILabel()
        myLocationLabel.text = "나의 위치"
        myLocationLabel.textColor = .white
        myLocationLabel.font = UIFont(name: "SFProText-Bold", size: 24)
        myLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        myLocationLabel.textAlignment = .center
        return myLocationLabel
    }()
    
    private let myLocationNameLabel: UILabel = {
        var myLocationNameLabel = UILabel()
        myLocationNameLabel.text = "고양시"
        myLocationNameLabel.textColor = .white
        myLocationNameLabel.font = UIFont(name: "SFProText-Medium", size: 17)
        myLocationNameLabel.translatesAutoresizingMaskIntoConstraints = false
        myLocationNameLabel.textAlignment = .center
        return myLocationNameLabel
    }()
    
    private let myLocationConditionLabel: UILabel = {
        var myLocationConditionLabel = UILabel()
        myLocationConditionLabel.text = "흐림"
        myLocationConditionLabel.textColor = .white
        myLocationConditionLabel.font = UIFont(name: "SFProText-Medium", size: 16)
        myLocationConditionLabel.translatesAutoresizingMaskIntoConstraints = false
        myLocationConditionLabel.textAlignment = .center
        return myLocationConditionLabel
    }()
    
    private let myLocationAverageTemperatureLabel: UILabel = {
        var myLocationAverageTemperatureLabel = UILabel()
        myLocationAverageTemperatureLabel.text = "21°"
        myLocationAverageTemperatureLabel.textColor = .white
        myLocationAverageTemperatureLabel.font = UIFont(name: "SFProText-Light", size: 52)
        myLocationAverageTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        myLocationAverageTemperatureLabel.textAlignment = .center
        return myLocationAverageTemperatureLabel
    }()
    
    private let myLocationMinimumTemperatureLabel: UILabel = {
        var myLocationMinimumTemperatureLabel = UILabel()
        myLocationMinimumTemperatureLabel.text = "최저:15°"
        myLocationMinimumTemperatureLabel.textColor = .white
        myLocationMinimumTemperatureLabel.font = UIFont(name: "SFProText-Medium", size: 15)
        myLocationMinimumTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        myLocationMinimumTemperatureLabel.textAlignment = .center
        return myLocationMinimumTemperatureLabel
    }()
    
    private let myLocationMaximumTemperatureLabel: UILabel = {
        var myLocationMaximumTemperatureLabel = UILabel()
        myLocationMaximumTemperatureLabel.text = "최고:29°"
        myLocationMaximumTemperatureLabel.textColor = .white
        myLocationMaximumTemperatureLabel.font = UIFont(name: "SFProText-Medium", size: 15)
        myLocationMaximumTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        myLocationMaximumTemperatureLabel.textAlignment = .center
        return myLocationMaximumTemperatureLabel
    }()
    
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
        view.addSubViews(editerImageView, titleLabel, scrollView, locationListImageView)
        scrollView.addSubview(contentView)
        scrollView.contentSize = contentView.frame.size
        view.addSubview(searchBar)
        contentView.addSubview(locationListImageView)
        locationListImageView.addSubViews(myLocationLabel, myLocationNameLabel, myLocationConditionLabel, myLocationAverageTemperatureLabel, myLocationMinimumTemperatureLabel, myLocationMaximumTemperatureLabel)
        
    }
    
    
    func setLayout() {
        
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
        let ViewController = ViewController()
        self.navigationController?.pushViewController(ViewController, animated: true)
    }
    
}
