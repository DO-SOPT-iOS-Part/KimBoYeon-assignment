//
//  ListView.swift
//  weatherApp
//
//  Created by 김보연 on 11/27/23.
//

import UIKit

import SnapKit
import Then

class ListView: BaseView {

    let listCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        listCollectionView.do {
            $0.backgroundColor = .black
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.scrollDirection = .vertical
            $0.collectionViewLayout = flowLayout
        }
    }
    
    override func setLayout() {
        self.addSubview(listCollectionView)
        
        listCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
