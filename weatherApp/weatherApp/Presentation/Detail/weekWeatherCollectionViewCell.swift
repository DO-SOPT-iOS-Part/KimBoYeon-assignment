//
//  weekWeatherTableViewCell.swift
//  weatherApp
//
//  Created by 김보연 on 10/31/23.
//

import UIKit

import SnapKit
import Then

class weekWeatherCollectionViewCell: UICollectionViewCell {
    
    private let dayOfTheWeekLabel = UILabel()
    private let weatherItemStackView = UIStackView()
    private let weatherIconImageView = UIImageView()
    let config = UIImage.SymbolConfiguration(font: .medium(size: 22))
    private let rainingPercentLabel = UILabel()
    private let dayOfMinimumTemperatureLabel = UILabel()
    private let graphImageView = UIImageView()
    private let dayOfMaximumTemperatureLabel = UILabel()
    private let cellDividerView = UIView()
    
    
    static let identifier: String = "weekWeatherCollectionViewCell"
    
    
    override init(frame: CGRect) {
            super.init(frame: frame)
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
        
        contentView.do {
            $0.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.03)
        }
        
        dayOfTheWeekLabel.do {
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
            $0.textAlignment = .left
        }
        
        
        dayOfMaximumTemperatureLabel.do {
            $0.textColor = .white
            $0.font = .medium(size: 22)
            $0.textAlignment = .right
        }
        
        cellDividerView.do {
            $0.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.15)
        }
    }
    
    func setLayout() {
        
        self.contentView.addSubViews(dayOfTheWeekLabel, weatherItemStackView, dayOfMinimumTemperatureLabel, graphImageView, dayOfMaximumTemperatureLabel, cellDividerView)
        self.weatherItemStackView.addArrangedSubview(weatherIconImageView, rainingPercentLabel)
        
        contentView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        
        dayOfTheWeekLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.leading.equalToSuperview().inset(16)
        }
        
        weatherItemStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.equalTo(40)
            $0.trailing.equalTo(dayOfMinimumTemperatureLabel.snp.leading).offset(-16)
        }
        
        
        dayOfMinimumTemperatureLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.width.equalTo(40)
            $0.trailing.equalTo(graphImageView.snp.leading).offset(-6)
        }
        
        graphImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(22)
            $0.bottom.equalToSuperview().inset(23)
            $0.trailing.equalTo(dayOfMaximumTemperatureLabel.snp.leading).offset(-6)
        }
        
        dayOfMaximumTemperatureLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.width.equalTo(40)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        cellDividerView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.height.equalTo(1)
            $0.leading.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview().offset(-15)
        }
    }
    
}
