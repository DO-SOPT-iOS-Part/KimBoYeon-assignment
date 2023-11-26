//
//  FontLiterals.swift
//  weatherApp
//
//  Created by 김보연 on 11/27/23.
//

import UIKit

enum AppFontName: String {
    
    case regularFont = "SFProText-Regular"
    case mediumFont = "SFProText-Medium"
    case boldFont = "SFProText-Bold"
    case thinFont = "SFProText-Thin"
    case lightFont = "SFProText-Light"
    
    var name: String {
        return self.rawValue
    }
}

extension UIFont {

    class func regular(size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.regularFont.rawValue, size: size)!
    }

    class func medium(size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.mediumFont.rawValue, size: size)!
    }

    class func bold(size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.boldFont.rawValue, size: size)!
    }
    
    class func light(size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.lightFont.rawValue, size: size)!
    }
    
    class func thin(size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.thinFont.rawValue, size: size)!
    }
}

