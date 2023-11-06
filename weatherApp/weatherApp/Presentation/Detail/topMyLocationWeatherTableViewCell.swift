//
//  topMyLocationWeatherTableViewCell.swift
//  weatherApp
//
//  Created by 김보연 on 11/6/23.
//

import UIKit

class topMyLocationWeatherTableViewCell: UITableViewCell {
    
    private var topStackView = UIStackView()
    private var topLocationNameLabel = UILabel()
    private var topNowTemperatureLabel = UILabel()
    private var topWeatherLabel = UILabel()
    private var topMinMaxTemperatureLabel = UILabel()
    
    static let identifier: String = "topMyLocationWeatherTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setStyle()
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setStyle() {
        
        topStackView.do {
            $0.axis = .vertical
            $0.alignment = .center
            $0.distribution = .equalSpacing
            $0.spacing = 4
            $0.backgroundColor = .clear
        }
        
        topLocationNameLabel.do {
            $0.text = "고양시"
            $0.textColor = .white
            $0.font = .regular(size: 36)
        }
        
        topNowTemperatureLabel.do {
            $0.text = "21°"
            $0.textColor = .white
            $0.font = .thin(size: 102)
        }
        
        topWeatherLabel.do {
            $0.text = "흐림"
            $0.textColor = .white
            $0.font = .regular(size: 24)
        }
        
        topMinMaxTemperatureLabel.do {
            $0.text = "최고:29°  최저:15°"
            $0.textColor = .white
            $0.font = .medium(size: 20)
        }
    }
    
    func setLayout() {
        
        self.contentView.addSubview(topStackView)
        self.topStackView.addArrangedSubview(topLocationNameLabel, topNowTemperatureLabel, topWeatherLabel, topMinMaxTemperatureLabel)
        
        
        
        topStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).inset(34)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
}
