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
    
    // 상단 스택바 설정
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 4
        return stackView
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
    }
}

private extension ViewController {
    
    func setStyle() {
        view.addSubview(backgroundView)
        self.view.addSubview(self.stackView)
        // forEach는 단순 반복, map은 조건문으로 조건문에 성립하는 결과물을 반환해준다.
        self.stackView.addArrangedSubview(locationNameLabel, temperatureLabel, weatherLabel,weatherDetailLabel)
    }
    
    func setLayout() {
        
        // 배경 이미지 레이아웃
        NSLayoutConstraint.activate([backgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
                                     backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                                     backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                                     backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
                                    ])
        
        // 스택뷰 레이아웃
        NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 78),
                                     stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                                     stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                                     ])
        
        
    }
}

