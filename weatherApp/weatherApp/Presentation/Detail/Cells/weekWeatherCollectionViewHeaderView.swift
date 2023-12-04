//
//  weekWeatherCollectionViewHeaderView.swift
//  weatherApp
//
//  Created by 김보연 on 11/7/23.
//

import UIKit

import SnapKit
import Then

final class weekWeatherCollectionViewHeaderView: UICollectionReusableView {
    
    static let identifier = "CustomCollectionHeaderView"
    
    private let headerContainerView = UIView()
    private let headerStackView = UIStackView()
    private let calendarIconImageInHeader = UIImageView()
    let weatherOfTenDaysLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupHeaderView()
        configureLayout()
    }
    
    
    func setupHeaderView() {
        
        headerContainerView.do {
            $0.backgroundColor = .clear
            $0.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.03).cgColor
        }
        
        headerStackView.do {
            $0.axis = .horizontal
            $0.spacing = 4
            $0.alignment = .center
        }
        
        calendarIconImageInHeader.do {
            $0.image = UIImage(systemName: "calendar")
            $0.tintColor = .init(red: 1, green: 1, blue: 1, alpha: 0.3)
        }
        
        weatherOfTenDaysLabel.do {
            $0.text = "10일간의 일기예보"
            $0.font = .medium(size: 15)
            $0.textColor = .init(red: 1, green: 1, blue: 1, alpha: 0.3)
            
        }
    }
    
    func configureLayout() {
        
        addSubviews(headerContainerView, headerStackView)
        
        headerStackView.addArrangedSubview(calendarIconImageInHeader, weatherOfTenDaysLabel)
        
        headerContainerView.snp.makeConstraints {
            $0.height.equalTo(38)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        headerStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(11)
            $0.leading.equalToSuperview().inset(35)
        }
        
    }
}

