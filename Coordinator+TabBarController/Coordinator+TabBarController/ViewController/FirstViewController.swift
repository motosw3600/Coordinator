//
//  FirstViewController.swift
//  Coordinator+TabBarController
//
//  Created by 박상우 on 2021/10/31.
//

import UIKit
import Combine

class FirstViewController: UIViewController {
    
    var didSendEventClosure: ((FirstViewController.Event) -> Void)?
    var viewModel: FirstViewModel?
    var cancellables = Set<AnyCancellable>()
    
    init(with viewModel: FirstViewModel) {
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
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        
        return stackView
    }()
    
    lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.text = "FirstScene"
        
        return label
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("next", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(didClickedNextButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc func didClickedNextButton() {
        self.didSendEventClosure?(.detail)
    }
    
    private func setupLayout() {
        self.view.addSubview(stackView)
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        [firstLabel, nextButton].forEach { self.stackView.addArrangedSubview($0) }
    }
    
}

extension FirstViewController {
    enum Event {
        case detail
    }
}
