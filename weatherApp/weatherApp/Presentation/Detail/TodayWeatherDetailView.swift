//
//  TodayWeatherDetailView.swift
//  weatherApp
//
//  Created by 김보연 on 10/25/23.
//

import UIKit

import SnapKit
import Then

class itemListView: UIView {
    
    private var weatherDetailverticalStackView = UIStackView()
    let todayTimeLabel = UILabel()
    let todayWeatherImageView = UIImageView()
    let todayTemperatureLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        setStyle()
        setLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {
        
        // 세부 수직 스택뷰
        weatherDetailverticalStackView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.axis = .vertical
            $0.alignment = .center
            $0.distribution = .equalSpacing
            $0.spacing = 14
        }
        
        todayTimeLabel.do {
            $0.text = ""
            $0.font = .medium(size: 17)
            $0.textColor = .white
            $0.textAlignment = .center
        }
        
        todayWeatherImageView.do {
            $0.image = UIImage(named: "")
        }
        
        todayTemperatureLabel.do {
            $0.text = ""
            $0.font = .medium(size: 22)
            $0.textColor = .white
            $0.textAlignment = .center
        }
        
    }
    
    func setLayout() {
        
        weatherDetailverticalStackView.addArrangedSubview(todayTimeLabel, todayWeatherImageView, todayTemperatureLabel)
        
        addSubview(weatherDetailverticalStackView)
        
        weatherDetailverticalStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

