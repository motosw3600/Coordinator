//
//  ThirdViewController.swift
//  Coordinator+TabBarController
//
//  Created by 박상우 on 2021/10/31.
//

import UIKit
import Combine

class ThirdViewController: UIViewController {

    var viewModel: ThirdViewModel?
    var cancellables = Set<AnyCancellable>()
    
    init(with viewModel: ThirdViewModel) {
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
    
    lazy var thirdLabel: UILabel = {
        let label = UILabel()
        label.text = "ThirdScene"
        
        return label
    }()
    
    private func setupLayout() {
        self.view.addSubview(thirdLabel)
        self.thirdLabel.translatesAutoresizingMaskIntoConstraints = false
        self.thirdLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.thirdLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }

}
