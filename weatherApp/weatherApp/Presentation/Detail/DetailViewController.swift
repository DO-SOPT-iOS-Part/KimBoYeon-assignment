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
    private let totalTableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        self.setStyle()
        self.setLayout()
        self.setTableViewConfig()
        
    }
    
    private func setTableViewConfig() {
        self.totalTableView.register(topMyLocationWeatherTableViewCell.self,
                                     forCellReuseIdentifier: topMyLocationWeatherTableViewCell.identifier)
        self.totalTableView.delegate = self
        self.totalTableView.dataSource = self
    }
    
}

private extension DetailViewController {
    
    func setStyle() {
        
        backgroundView.do {
            $0.frame = UIScreen.main.bounds
            $0.image = UIImage(named: "Img-1x")
            $0.contentMode = .scaleAspectFit
        }
        
        totalTableView.do {
            $0.allowsSelection = true
            $0.isScrollEnabled = true
            $0.backgroundColor = .clear
        }
    }
    func setLayout() {
        
        view.addSubViews(backgroundView, totalTableView)
        
        totalTableView.snp.makeConstraints() {
            $0.edges.equalToSuperview()
        }
        
    }
    
}

extension DetailViewController: UITableViewDelegate {}
extension DetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = totalTableView.dequeueReusableCell(withIdentifier: topMyLocationWeatherTableViewCell.identifier, for: indexPath) as? topMyLocationWeatherTableViewCell else {return UITableViewCell()}
            cell.backgroundColor = .clear
            return cell
            
        default:
            return UITableViewCell()
            
        }
    }
    
}
