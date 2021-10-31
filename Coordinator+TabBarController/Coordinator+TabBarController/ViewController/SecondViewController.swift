//
//  SecondViewController.swift
//  Coordinator+TabBarController
//
//  Created by 박상우 on 2021/10/31.
//

import UIKit
import Combine

class SecondViewController: UIViewController {

    var viewModel: SecondViewModel?
    var cancellables = Set<AnyCancellable>()
    
    init(with viewModel: SecondViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        self.view.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.text = "SecondScene"
        
        return label
    }()
    
    private func setupLayout() {
        self.view.addSubview(secondLabel)
        self.secondLabel.translatesAutoresizingMaskIntoConstraints = false
        self.secondLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.secondLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }

}
