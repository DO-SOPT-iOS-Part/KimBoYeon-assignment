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
