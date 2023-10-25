//
//  TodayWeatherDetailView.swift
//  weatherApp
//
//  Created by 김보연 on 10/25/23.
//

import UIKit
// 네이밍
class listView: UIView {
    
    // 세부 수직 스택뷰
    private var weatherDetailverticalStackView: UIStackView = {
        let weatherDetailverticalStackView = UIStackView()
        weatherDetailverticalStackView.translatesAutoresizingMaskIntoConstraints = false
        weatherDetailverticalStackView.axis = .vertical
        weatherDetailverticalStackView.alignment = .center
        weatherDetailverticalStackView.distribution = .equalSpacing
        weatherDetailverticalStackView.spacing = 14
        
        return weatherDetailverticalStackView
    }()
    
    let todayTimeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.text = ""
        timeLabel.font = UIFont(name: "SFProText-Medium", size: 17)
        timeLabel.textColor = .white
        timeLabel.textAlignment = .center
        return timeLabel
    }()
    
    let todayWeatherImageView: UIImageView = {
        let weatherImageView = UIImageView()
        weatherImageView.image = UIImage(named: "")
        return weatherImageView
    }()
    
    let todayTemperatureLabel: UILabel = {
        let temperatureLabel = UILabel()
        temperatureLabel.text = ""
        temperatureLabel.font = UIFont(name: "SFProText-Medium", size: 22)
        temperatureLabel.textColor = .white
        temperatureLabel.textAlignment = .center
        return temperatureLabel
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        weatherDetailverticalStackView.addArrangedSubview(todayTimeLabel, todayWeatherImageView, todayTemperatureLabel)
        
        addSubview(weatherDetailverticalStackView)
        
        setLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout() {
        NSLayoutConstraint.activate([
            weatherDetailverticalStackView.topAnchor.constraint(equalTo: self.topAnchor),
                        weatherDetailverticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                        weatherDetailverticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                        weatherDetailverticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
    }
}

