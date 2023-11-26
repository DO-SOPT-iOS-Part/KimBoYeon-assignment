//
//  UIStackView+.swift
//  weatherApp
//
//  Created by 김보연 on 11/27/23.
//

import UIKit

extension UIStackView {
    
     func addArrangedSubviews(_ views: UIView...) {
         for view in views {
             self.addArrangedSubview(view)
         }
     }
}
