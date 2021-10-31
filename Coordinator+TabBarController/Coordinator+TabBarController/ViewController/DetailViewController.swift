//
//  DetailViewController.swift
//  Coordinator+TabBarController
//
//  Created by 박상우 on 2021/10/31.
//

import UIKit

class DetailViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.text = "DetailScene"
        
        return label
    }()
    
    private func setupLayout() {
        self.view.addSubview(detailLabel)
        self.detailLabel.translatesAutoresizingMaskIntoConstraints = false
        self.detailLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.detailLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
}
