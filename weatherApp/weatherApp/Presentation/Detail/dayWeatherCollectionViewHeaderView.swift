//
//  dayWeatherCollectionViewHeaderView.swift
//  weatherApp
//
//  Created by 김보연 on 11/10/23.
//

import UIKit

import SnapKit
import Then

class dayWeatherCollectionViewHeaderView: UICollectionReusableView {
    
    static let identifier = "dayWeatherCollectionViewHeaderView"
    
    private let secondHeaderContainerView = UIView()
    let detailTextLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupHeaderView()
        configureLayout()
    }
    
    
    func setupHeaderView() {
        
        secondHeaderContainerView.do {
            $0.backgroundColor = .clear
            $0.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.03).cgColor
        }
        
        detailTextLabel.do {
                $0.text = "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다."
                $0.textColor = .white
                $0.numberOfLines = 0
                $0.lineBreakMode = .byCharWrapping
                $0.font = .regular(size: 18)
                $0.textAlignment = .left
            }
    }
    
    func configureLayout() {
        
        addSubViews(secondHeaderContainerView)
        secondHeaderContainerView.addSubview(detailTextLabel)
       
        secondHeaderContainerView.snp.makeConstraints {
            $0.height.equalTo(70)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        detailTextLabel.snp.makeConstraints {
            $0.top.equalTo(secondHeaderContainerView).inset(10)
            $0.leading.trailing.equalTo(secondHeaderContainerView).inset(15)
        }
        
    }
}
