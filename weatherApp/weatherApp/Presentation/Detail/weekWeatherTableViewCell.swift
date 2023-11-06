//
//  weekWeatherTableViewCell.swift
//  weatherApp
//
//  Created by 김보연 on 10/31/23.
//

import UIKit

import SnapKit
import Then

class weekWeatherTableViewCell: UITableViewCell {
    
    private let dayOfTheWeekLabel = UILabel()
    private let weatherItemStackView = UIStackView()
    private let weatherIconImageView = UIImageView()
    let config = UIImage.SymbolConfiguration(font: .medium(size: 22))
    private let rainingPercentLabel = UILabel()
    private let dayOfMinimumTemperatureLabel = UILabel()
    private let graphImageView = UIImageView()
    private let dayOfMaximumTemperatureLabel = UILabel()
    
    
    static let identifier: String = "weekWeatherTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setStyle()
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindData(data: WeekWeatherItemData) {
        self.dayOfTheWeekLabel.text = data.dayOfTheWeekLabel
        self.weatherIconImageView.image = UIImage(systemName: data.weatherIconImageView)
        self.rainingPercentLabel.text = data.rainingPercentLabel
        self.dayOfMinimumTemperatureLabel.text = data.dayOfMinimumTemperatureLabel
        self.graphImageView.image = UIImage(named: data.graphImageView)
        self.dayOfMaximumTemperatureLabel.text = data.dayOfMaximumTemperatureLabel
    }
    
    func setStyle() {
        
        dayOfTheWeekLabel.do {
            $0.frame = CGRect(x: 0, y: 0, width: 42, height: 26)
            $0.textColor = .white
            $0.font = .medium(size: 22)
            $0.textAlignment = .left
        }
        
        weatherItemStackView.do {
            $0.axis = .vertical
            $0.alignment = .center
            $0.spacing = 1
        }
        
        weatherIconImageView.do {
            $0.tintColor = .white
        }
        
        rainingPercentLabel.do {
            $0.textColor = UIColor(hexCode: "81CFFA")
            $0.font = .medium(size: 15)
            $0.textAlignment = .center
        }
        
        dayOfMinimumTemperatureLabel.do {
            $0.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
            $0.font = .medium(size: 22)
            $0.textAlignment = .right
        }
        
        
        dayOfMaximumTemperatureLabel.do {
            $0.textColor = .white
            $0.font = .medium(size: 22)
            $0.textAlignment = .left
        }
    }
    
    func setLayout() {
        
        self.contentView.addSubViews(dayOfTheWeekLabel, weatherItemStackView, dayOfMinimumTemperatureLabel, graphImageView, dayOfMaximumTemperatureLabel)
        self.weatherItemStackView.addArrangedSubview(weatherIconImageView, rainingPercentLabel)
        
        dayOfTheWeekLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.leading.equalToSuperview()
        }
        
        weatherItemStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(84)
            $0.trailing.equalTo(dayOfMinimumTemperatureLabel.snp.leading).inset(12)
        }
        
        
        dayOfMinimumTemperatureLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.leading.equalToSuperview().inset(130)
        }
        
        graphImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(22)
            $0.bottom.equalToSuperview().inset(23)
            $0.trailing.equalToSuperview().inset(43)
        }
        
        dayOfMaximumTemperatureLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.trailing.equalToSuperview()
        }
    }
    
}
