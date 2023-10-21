//
//  UIView+.swift
//  weatherApp
//
//  Created by 김보연 on 10/16/23.
//

import UIKit

extension UIView {
    func addSubViews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}

extension UIStackView {
    func addArrangedSubview(_ views: UIView...) {
        views.forEach {
            self.addArrangedSubview($0)
        }
    }
}

extension UIFont {
    static func sfPro(size fontSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        for family in UIFont.familyNames {
            print(family)
            
            for sub in UIFont.fontNames(forFamilyName: family) {
                print("====> \(sub)")
            }
        }
        
        let familyName = "SFProText"
        
        var weightString: String
        switch weight {
        case .bold:
            weightString = "Bold"
        case .medium:
            weightString = "Medium"
        case .regular:
            weightString = "Regular"
        case .light:
            weightString = "Light"
        case .thin:
            weightString = "Thin"
        default:
            weightString = "Medium"
        }
        
        return UIFont(name: "\(familyName)-\(weightString)", size: fontSize)!
    }
}
