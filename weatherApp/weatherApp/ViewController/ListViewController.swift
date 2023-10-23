//
//  ListViewController.swift
//  weatherApp
//
//  Created by 김보연 on 10/23/23.
//

import UIKit

class ListViewController: UIViewController {
    
    private let editerImage: UIImageView = {
        let editerImage = UIImageView()
        editerImage.image = UIImage(named: "editer")
        editerImage.translatesAutoresizingMaskIntoConstraints = false
        return editerImage
    }()
    
    private let titleLabel: UILabel = {
        var titleLabel = UILabel()
        titleLabel.text = "날씨"
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "SFProText-Bold", size: 36)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    private let locationListImage: UIImageView = {
        let locationListImage = UIImageView()
        locationListImage.image = UIImage(named: "list-1x")
        locationListImage.translatesAutoresizingMaskIntoConstraints = false
        return locationListImage
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
    }
}

private extension ListViewController {
    func setStyle() {
        
        view.backgroundColor = .black
        view.addSubViews(editerImage, titleLabel, locationListImage)
        view.addSubview(searchBar)
        locationListImage.addSubViews(myLocationLabel, myLocationNameLabel, myLocationConditionLabel, myLocationAverageTemperatureLabel, myLocationMinimumTemperatureLabel, myLocationMaximumTemperatureLabel)
    }
    
    func setLayout() {
        
        NSLayoutConstraint.activate([
            editerImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 52),
            editerImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 321)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 97),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -288),
            titleLabel.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12)
        ])
        
        NSLayoutConstraint.activate([
            locationListImage.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 8),
            locationListImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            locationListImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            locationListImage.heightAnchor.constraint(equalToConstant: 117)
        ])
        
        NSLayoutConstraint.activate([
            myLocationLabel.topAnchor.constraint(equalTo: locationListImage.topAnchor, constant: 10),
            myLocationLabel.leadingAnchor.constraint(equalTo: locationListImage.leadingAnchor, constant: 16),
            myLocationLabel.bottomAnchor.constraint(equalTo: locationListImage.bottomAnchor, constant: -75)
        ])
        
        NSLayoutConstraint.activate([
            myLocationNameLabel.topAnchor.constraint(equalTo: myLocationLabel.bottomAnchor, constant: 2),
            myLocationNameLabel.leadingAnchor.constraint(equalTo: locationListImage.leadingAnchor, constant: 16),
            myLocationNameLabel.bottomAnchor.constraint(equalTo: locationListImage.bottomAnchor, constant: -53)
        ])
        
        NSLayoutConstraint.activate([
            myLocationConditionLabel.topAnchor.constraint(equalTo: myLocationNameLabel.bottomAnchor, constant: 23),
            myLocationConditionLabel.leadingAnchor.constraint(equalTo: locationListImage.leadingAnchor, constant: 16),
            myLocationConditionLabel.bottomAnchor.constraint(equalTo: locationListImage.bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            myLocationAverageTemperatureLabel.topAnchor.constraint(equalTo: locationListImage.topAnchor, constant: 4),
            myLocationAverageTemperatureLabel.trailingAnchor.constraint(equalTo: locationListImage.trailingAnchor, constant: -16),
            myLocationAverageTemperatureLabel.bottomAnchor.constraint(equalTo: locationListImage.bottomAnchor, constant: -53)
        ])
        
        NSLayoutConstraint.activate([
            myLocationMinimumTemperatureLabel.topAnchor.constraint(equalTo: myLocationAverageTemperatureLabel.bottomAnchor, constant: 23),
            myLocationMinimumTemperatureLabel.trailingAnchor.constraint(equalTo: locationListImage.trailingAnchor, constant: -16),
            myLocationMinimumTemperatureLabel.bottomAnchor.constraint(equalTo: locationListImage.bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            myLocationMaximumTemperatureLabel.topAnchor.constraint(equalTo: myLocationAverageTemperatureLabel.bottomAnchor, constant: 23),
            myLocationMaximumTemperatureLabel.trailingAnchor.constraint(equalTo: myLocationMinimumTemperatureLabel.leadingAnchor, constant: -6),
            myLocationMaximumTemperatureLabel.bottomAnchor.constraint(equalTo: locationListImage.bottomAnchor, constant: -10)
        ])
    }
}
