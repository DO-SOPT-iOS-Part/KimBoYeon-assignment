//
//  topMyLocationWeatherTableViewCell.swift
//  weatherApp
//
//  Created by 김보연 on 11/6/23.
//

import UIKit

class topMyLocationWeatherCollectionViewCell: UICollectionViewCell {
    
    private var topLocationNameLabel = UILabel()
    private var topNowTemperatureLabel = UILabel()
    private var topWeatherLabel = UILabel()
    private var topMinMaxTemperatureLabel = UILabel()
    
    static let identifier: String = "topMyLocationWeatherCollectionViewCell"
    
    override init(frame: CGRect) {
            super.init(frame: frame)
        self.setStyle()
        self.setLayout()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setStyle() {
        
        
        topLocationNameLabel.do {
            $0.text = "고양시"
            $0.textColor = .white
            $0.textAlignment = .center
            $0.font = .regular(size: 36)
        }
        
        topNowTemperatureLabel.do {
            $0.text = "21°"
            $0.textColor = .white
            $0.textAlignment = .center
            $0.font = .thin(size: 102)
        }
        
        topWeatherLabel.do {
            $0.text = "흐림"
            $0.textColor = .white
            $0.textAlignment = .center
            $0.font = .regular(size: 24)
        }
        
        topMinMaxTemperatureLabel.do {
            $0.text = "최고:29°  최저:15°"
            $0.textColor = .white
            $0.textAlignment = .center
            $0.font = .medium(size: 20)
        }
    }
    
    func setLayout() {
        
        self.contentView.addSubviews(topLocationNameLabel, topNowTemperatureLabel, topWeatherLabel, topMinMaxTemperatureLabel)
        
        topLocationNameLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        topNowTemperatureLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(topLocationNameLabel.snp.bottom).inset(4)
        }
        
        topWeatherLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(topNowTemperatureLabel.snp.bottom).inset(4)
        }
        
        topMinMaxTemperatureLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
}
