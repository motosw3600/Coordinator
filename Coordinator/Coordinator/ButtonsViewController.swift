//
//  ButtonsViewController.swift
//  Coordinator
//
//  Created by 박상우 on 2021/10/27.
//

import UIKit
import Combine

class ButtonsViewController: UIViewController {
    
    private var viewModel: ButtonsViewModel!
    
    static func create(with viewModel: ButtonsViewModel) -> ButtonsViewController {
        let viewController = ButtonsViewController(viewModel: viewModel)
        
        return viewController
    }
    
    init(viewModel: ButtonsViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8.0
        
        return stackView
    }()
    
    lazy var redButton: UIButton = {
        let button = UIButton()
        button.setTitle("button", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.red.cgColor
        button.addTarget(self, action: #selector(tapRedButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var blueButton: UIButton = {
        let button = UIButton()
        button.setTitle("button", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.blue.cgColor
        button.addTarget(self, action: #selector(tapBlueButton), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        addSubviews()
        makeConstraints()
    }
    
    private func setupViews() {
        self.view.backgroundColor = .white
    }
    
    private func addSubviews() {
        self.view.addSubview(buttonStackView)
        [redButton, blueButton].forEach { buttonStackView.addArrangedSubview($0) }
    }
    
    private func makeConstraints() {
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.centerXAnchor.constraint(equalTo: super.view.centerXAnchor).isActive = true
        buttonStackView.centerYAnchor.constraint(equalTo: super.view.centerYAnchor).isActive = true
    }
    
    @objc func tapRedButton() {
        self.viewModel.didTapRedButton()
    }
    
    @objc func tapBlueButton() {
        self.viewModel.didTapBlueButton()
    }
    

}
