//
//  dayWeekHorizontalCollectionViewCell.swift
//  weatherApp
//
//  Created by 김보연 on 11/9/23.
//

import UIKit

class dayWeekHorizontalCollectionViewCell: UICollectionViewCell {
    
    let horizontalCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let horizontalCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return horizontalCollectionView
    }()
    
    private let secondCellDividerView = UIView()
    
    static let identifier: String = "dayWeekHorizontalCollectionViewCell"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setStyle()
        self.setLayout()
        self.setCollectionViewConfig()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {
        
        horizontalCollectionView.do {
            $0.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.03)
        }
        
        secondCellDividerView.do {
            $0.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.15)
        }
    }
    
    func setLayout() {
        
        self.contentView.addSubViews(horizontalCollectionView, secondCellDividerView)
        
        
        horizontalCollectionView.dataSource = self
        
        horizontalCollectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.bottom.equalToSuperview()
        }
        
        secondCellDividerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.height.equalTo(1)
            $0.leading.equalToSuperview().inset(34)
            $0.trailing.equalTo(horizontalCollectionView.snp.trailing)
        }
    }
    
    private func setCollectionViewConfig() {
        self.horizontalCollectionView.register(dayWeatherCollectionViewCell.self,
                                               forCellWithReuseIdentifier: dayWeatherCollectionViewCell.identifier)
        self.horizontalCollectionView.delegate = self
        self.horizontalCollectionView.dataSource = self
    }
}

extension dayWeekHorizontalCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dayWeatherItemData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: dayWeatherCollectionViewCell.identifier,
                                                            for: indexPath) as? dayWeatherCollectionViewCell else {
            return UICollectionViewCell()
        }
        item.bindData(data: dayWeatherItemData[indexPath.item])
        return item
    }
}
extension dayWeekHorizontalCollectionViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout flowLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 44, height: 122)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout flowLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(22)
    }
}
