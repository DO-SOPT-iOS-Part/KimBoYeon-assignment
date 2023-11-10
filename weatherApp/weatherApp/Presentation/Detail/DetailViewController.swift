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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        self.setDetailCollectionViewConfig()
        self.setStyle()
        self.setLayout()
        
        
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
        
    }
    func setLayout() {
        
        view.addSubViews(backgroundView, detailCollectionView)
        
        detailCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
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



