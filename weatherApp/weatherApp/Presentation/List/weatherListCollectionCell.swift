//
//  weatherListCollectionCell.swift
//  weatherApp
//
//  Created by 김보연 on 11/2/23.
//

import UIKit

import Then
import SnapKit

class weatherListCollectionCell: UICollectionViewCell {

    private let myLocationImageView = UIImageView()
    private let myLocationLabel = UILabel()
    private let myLocationNameLabel = UILabel()
    private let myLocationConditionLabel = UILabel()
    private let myLocationAverageTemperatureLabel = UILabel()
    private let myLocationMinimumTemperatureLabel = UILabel()
    private let myLocationMaximumTemperatureLabel = UILabel()
    
    static let identifier: String = "weekWeatherTableViewCell"
    
    override init(frame: CGRect) {
            super.init(frame: frame)
        self.setStyle()
        self.setLayout()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindData(data: WeatherCardItemData) {
        self.myLocationLabel.text = data.myLocationLabel
        self.myLocationNameLabel.text = data.myLocationNameLabel
        self.myLocationConditionLabel.text = data.myLocationConditionLabel
        self.myLocationAverageTemperatureLabel.text = data.myLocationAverageTemperatureLabel
        self.myLocationMinimumTemperatureLabel.text = data.myLocationMinimumTemperatureLabel
        self.myLocationMaximumTemperatureLabel.text = data.myLocationMaximumTemperatureLabel
    }
    
    func setStyle() {
        
        myLocationImageView.do {
            $0.image = UIImage(named: "list-1x")
        }
        
        myLocationLabel.do {
            $0.textColor = .white
            $0.font = .bold(size: 24)
            $0.textAlignment = .left
        }
        
        myLocationNameLabel.do {
            $0.textColor = .white
            $0.font = .medium(size: 17)
            $0.textAlignment = .left
        }
        
        myLocationConditionLabel.do {
            $0.textColor = .white
            $0.font = .medium(size: 16)
            $0.textAlignment = .left
        }
        
        
        myLocationAverageTemperatureLabel.do {
            $0.textColor = .white
            $0.font = .light(size: 52)
            $0.textAlignment = .right
        }
        
        myLocationMinimumTemperatureLabel.do {
            $0.textColor = .white
            $0.font = .medium(size: 15)
            $0.textAlignment = .right
        }
        
        
        myLocationMaximumTemperatureLabel.do {
            $0.textColor = .white
            $0.font = .medium(size: 15)
            $0.textAlignment = .right
        }
    }
    
    func setLayout() {
        
        self.contentView.addSubview(myLocationImageView)
        
        self.myLocationImageView.addSubViews(myLocationLabel, myLocationNameLabel, myLocationConditionLabel, myLocationAverageTemperatureLabel, myLocationMaximumTemperatureLabel, myLocationMinimumTemperatureLabel)
        
        
        myLocationImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        
        myLocationLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(16)
        }
        
        
        myLocationNameLabel.snp.makeConstraints {
            $0.top.equalTo(myLocationLabel.snp.bottom).inset(-2)
            $0.leading.equalToSuperview().inset(16)
        }
        
        myLocationConditionLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(16)
        }
        
        myLocationAverageTemperatureLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        myLocationMaximumTemperatureLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.trailing.equalTo(myLocationMinimumTemperatureLabel.snp.leading).inset(-6)
        }
        
        myLocationMinimumTemperatureLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(16)
        }
        
    }
}
