//
//  weekWeatherCollectionViewFooterView.swift
//  weatherApp
//
//  Created by 김보연 on 11/8/23.
//

import UIKit

import SnapKit
import Then

class weekWeatherCollectionViewFooterView: UICollectionReusableView {
    
    static let identifier = "CustomCollectionFooterView"
    
    private let footerContainerView = UIView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupFooterView()
        configureLayout()
    }
    
    func setupFooterView() {
        
        footerContainerView.do {
            $0.backgroundColor = .clear
            $0.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.03).cgColor
        }
    }
    
    func configureLayout() {
        
        addSubview(footerContainerView)
        
        footerContainerView.snp.makeConstraints {
            $0.height.equalTo(32)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
    }
}
