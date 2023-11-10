//
//  dayWeatherCollectionViewCell.swift
//  weatherApp
//
//  Created by 김보연 on 11/6/23.
//

import UIKit

import SnapKit
import Then

class dayWeatherCollectionViewCell: UICollectionViewCell {
    
    private let todayTimeLabel = UILabel()
    private let todayWeatherImageView = UIImageView()
    let config = UIImage.SymbolConfiguration(font: .medium(size: 26))
    private let todayTemperatureLabel = UILabel()
    
    static let identifier: String = "dayWeatherCollectionViewCell"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setStyle()
        self.setLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func bindData(data: DayWeatherItemData) {
        self.todayTimeLabel.text = data.todayTimeLabel
        self.todayWeatherImageView.image = UIImage(systemName: data.todayWeatherImageView)
        self.todayTemperatureLabel.text = data.todayTemperatureLabel
    }
    
    func setStyle() {
        
        contentView.do {
            $0.backgroundColor = .clear
        }
        

        todayTimeLabel.do {
            $0.textColor = .white
            $0.font = .medium(size: 17)
            
        }
        
        todayWeatherImageView.do {
            $0.tintColor = .white
        }
        
        todayTemperatureLabel.do {
            $0.textColor = .white
            $0.font = .medium(size: 22)
        }
    }
    
    func setLayout() {
        
        contentView.addSubViews(todayTimeLabel, todayWeatherImageView, todayTemperatureLabel)
    
        
        todayTimeLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.height.equalTo(22)
            $0.centerX.equalToSuperview()
        }
        
        todayWeatherImageView.snp.makeConstraints {
            $0.top.equalTo(todayTimeLabel.snp.bottom).offset(24)
            $0.height.equalTo(20)
            $0.centerX.equalToSuperview()
        }
        
        todayTemperatureLabel.snp.makeConstraints {
            $0.top.equalTo(todayWeatherImageView.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
        }
        
    }
    
}
