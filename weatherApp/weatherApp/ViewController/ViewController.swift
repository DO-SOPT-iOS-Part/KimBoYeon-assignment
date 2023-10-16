//
//  ViewController.swift
//  weatherApp
//
//  Created by 김보연 on 10/15/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let nameLabel1: UILabel = {
        let label = UILabel()
        label.text = "이름이 무엇인가요!?"
        label.font = .sfPro(size: 16, weight: .bold)
        label.textColor = .blue
        label.textAlignment = .center
        return label
    }()
    
    private let nameLabel2: UILabel = {
        let label = UILabel()
        label.text = "이름이 무엇인가요!?"
        label.font = .sfPro(size: 16, weight: .regular)
        label.textColor = .blue
        label.textAlignment = .center
        return label
    }()
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "list")
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
    }
}

private extension ViewController {
    
    func setStyle() {
        
        view.backgroundColor = .white
        
    }
    
    func setLayout() {
        
        self.view.addSubViews(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        
                [nameLabel1, nameLabel2].forEach {
                    $0.translatesAutoresizingMaskIntoConstraints = false
                    view.addSubview($0)
                }
        
        NSLayoutConstraint.activate([image.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
                                     image.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50),
                                     image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
                                     image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50)]
        )
        
                NSLayoutConstraint.activate([nameLabel1.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                             nameLabel1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                             nameLabel1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
                NSLayoutConstraint.activate([nameLabel2.topAnchor.constraint(equalTo: view.topAnchor, constant: 500),
                                             nameLabel2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                             nameLabel2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
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
