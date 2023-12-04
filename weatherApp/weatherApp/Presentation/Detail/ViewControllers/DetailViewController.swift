//
//  DetailViewController.swift
//  weatherApp
//
//  Created by 김보연 on 10/15/23.
//

import UIKit

import Then
import SnapKit


class DetailViewController: UIViewController {
    
    private let backgroundView = UIImageView()
    private let detailCollectionView: UICollectionView = {
        let mainFlowLayout = UICollectionViewFlowLayout()
        mainFlowLayout.scrollDirection = .vertical
        let detailCollectionView = UICollectionView(frame: .zero, collectionViewLayout: mainFlowLayout)
        return detailCollectionView
    }()
    private var tabBar = UIView()
    private let mapImage = UIImageView()
    private var locationIconStackView = UIStackView()
    private let nowMyLocationImage = UIImageView()
    private let otherLocationImage = UIImageView()
    private let locationListImageButton = UIButton()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        locationListImageButton.addTarget(self, action: #selector(locationListButtonTapped), for: .touchUpInside)
        
        self.setDetailCollectionViewConfig()
        self.setStyle()
        self.setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @objc
    func locationListButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tabBar.layer.addBorder([.top], color: UIColor.white.withAlphaComponent(0.3), width: 0.4)
    }
    
}

private extension DetailViewController {
    
    func setStyle() {
        
        backgroundView.do {
            $0.frame = UIScreen.main.bounds
            $0.image = UIImage(named: "Img-1x")
            $0.contentMode = .scaleAspectFit
        }
        
        detailCollectionView.do {
            $0.backgroundColor = .clear
        }
        
        // 하단 탭 바
        tabBar.do {
            $0.backgroundColor = UIColor(hexCode: "2A3040")
        }
        
        mapImage.do {
            $0.image = UIImage(named: "map")
        }
        
        locationIconStackView.do {
            $0.axis = .horizontal
            $0.alignment = .fill
            $0.distribution = .equalSpacing
            $0.spacing = 4
        }
        
        nowMyLocationImage.do {
            $0.image = UIImage(named: "my-location")
        }
        
        otherLocationImage.do {
            $0.image = UIImage(named: "dot")
        }
        
        locationListImageButton.do {
            $0.setImage(UIImage(named: "location-list"), for: .normal)
            $0.isUserInteractionEnabled = true
        }
    }
    
    func setLayout() {
        
        view.addSubviews(backgroundView, detailCollectionView, tabBar)
        self.tabBar.addSubviews(mapImage, locationIconStackView, locationListImageButton)
        self.locationIconStackView.addArrangedSubviews(nowMyLocationImage, otherLocationImage)
        
        detailCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        // 하단 탭바 레이아웃
        tabBar.snp.makeConstraints {
            $0.height.equalTo(82)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        // 하단 탭 바 지도 아이콘 레이아웃
        mapImage.snp.makeConstraints {
            $0.top.equalTo(tabBar.snp.top).inset(4)
            $0.leading.equalTo(tabBar.snp.leading).inset(10)
        }
        
        // 하단 탭 바 위치 관련 아이콘 스택뷰 레이아웃
        locationIconStackView.snp.makeConstraints {
            $0.top.equalTo(tabBar).inset(14)
            $0.centerX.equalTo(tabBar)
            $0.width.equalTo(52)
        }
        
        // 하단 탭 바 위치 리스트 아이콘 레이아웃
        locationListImageButton.snp.makeConstraints {
            $0.top.equalTo(tabBar).inset(4)
            $0.trailing.equalTo(tabBar).inset(9)
        }
        
        
        
    }
    
    private func setDetailCollectionViewConfig() {
        
        self.detailCollectionView.register(topMyLocationWeatherCollectionViewCell.self,
                                           forCellWithReuseIdentifier: topMyLocationWeatherCollectionViewCell.identifier)
        
        self.detailCollectionView.register(dayWeatherCollectionViewHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: dayWeatherCollectionViewHeaderView.identifier)
        
        
        self.detailCollectionView.register(dayWeekHorizontalCollectionViewCell.self,
                                           forCellWithReuseIdentifier: dayWeekHorizontalCollectionViewCell.identifier)
        
        
        self.detailCollectionView.register(weekWeatherCollectionViewHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: weekWeatherCollectionViewHeaderView.identifier)
        
        self.detailCollectionView.register(weekWeatherCollectionViewCell.self,
                                           forCellWithReuseIdentifier: weekWeatherCollectionViewCell.identifier)
        
        self.detailCollectionView.register(weekWeatherCollectionViewFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: weekWeatherCollectionViewFooterView.identifier)
        
        self.detailCollectionView.delegate = self
        self.detailCollectionView.dataSource = self
    }
}

extension DetailViewController: UICollectionViewDelegate {}
extension DetailViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return weekWeatherItemData.count
        default:
            return 0
            
        }
    }
    
    
    func collectionView(_ listCollectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
            
        case 0:
            guard let item = detailCollectionView.dequeueReusableCell(withReuseIdentifier: topMyLocationWeatherCollectionViewCell.identifier, for: indexPath) as? topMyLocationWeatherCollectionViewCell else {return UICollectionViewCell()}
            return item
            
        case 1:
            guard let item = detailCollectionView.dequeueReusableCell(withReuseIdentifier: dayWeekHorizontalCollectionViewCell.identifier, for: indexPath) as? dayWeekHorizontalCollectionViewCell else {return UICollectionViewCell()}
            return item
            
        case 2:
            guard let item = detailCollectionView.dequeueReusableCell(withReuseIdentifier: weekWeatherCollectionViewCell.identifier, for: indexPath) as? weekWeatherCollectionViewCell else {return UICollectionViewCell()}
            
            item.bindData(data: weekWeatherItemData[indexPath.row])
            return item
            
        default:
            return UICollectionViewCell()
        }
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            let itemWidthOrHeight: CGFloat = 212
            return CGSize(width: collectionView.frame.width, height: itemWidthOrHeight)
        case 1:
            let itemWidthOrHeight: CGFloat = 146
            return CGSize(width: collectionView.frame.size.width, height: itemWidthOrHeight)
        case 2:
            let itemWidthOrHeight: CGFloat = 55
            return CGSize(width: collectionView.frame.width, height: itemWidthOrHeight)
            
        default:
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let sectionInsets = UIEdgeInsets.zero
        switch section {
        case 0:
            return UIEdgeInsets(top: 34, left: 0, bottom: 44, right: 0)
        case 1:
            return UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0)
        case 2:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        default:
            break
        }
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch indexPath.section {
        case 1:
            
            if kind == UICollectionView.elementKindSectionHeader {
                guard let secondSectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: dayWeatherCollectionViewHeaderView.identifier, for: indexPath) as? dayWeatherCollectionViewHeaderView else {
                    return UICollectionReusableView()
                }
                return secondSectionHeaderView
            }
            
        case 2:
            if kind == UICollectionView.elementKindSectionHeader {
                guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: weekWeatherCollectionViewHeaderView.identifier, for: indexPath) as? weekWeatherCollectionViewHeaderView else {
                    return UICollectionReusableView()
                }
                return headerView
            }
            
            else if kind == UICollectionView.elementKindSectionFooter {
                guard let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: weekWeatherCollectionViewFooterView.identifier, for: indexPath) as? weekWeatherCollectionViewFooterView else {
                    return UICollectionReusableView()
                }
                return footerView
            }
            
        default:
            return UICollectionReusableView()
        }
        
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 1:
            return CGSize(width: collectionView.frame.width - 40, height: 70)
        case 2:
            return CGSize(width: collectionView.frame.width - 40, height: 38)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        switch section {
        case 2:
            return CGSize(width: collectionView.frame.width - 40, height: 32)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}



