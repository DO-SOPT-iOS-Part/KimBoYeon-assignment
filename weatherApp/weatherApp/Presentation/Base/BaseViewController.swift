//
//  BaseViewController.swift
//  weatherApp
//
//  Created by 김보연 on 11/27/23.
//

import UIKit

import SnapKit
import Then

class BaseViewController: UIViewController {

    private lazy var viewControllerName = self.className
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setDelegates()
        setRegister()
    }
    
    /// View 의 Style 을 set 합니다.
    func setUI() {}
    /// View 의 Layout 을 set 합니다.
    func setLayout() {}
    /// View 의 Delegate 을 set 합니다.
    func setDelegates() {}
    /// View 의 Register 를 set 합니다.
    func setRegister() {}
    
    deinit {
        print("🧶 \(viewControllerName) is deinited")
    }
}
