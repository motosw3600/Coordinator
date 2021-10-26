//
//  BlueViewController.swift
//  Coordinator
//
//  Created by 박상우 on 2021/10/26.
//

import UIKit

class BlueViewController: UIViewController {
    
    let tapCount: Int
    
    static func create(tapCount: Int) -> BlueViewController {
        return BlueViewController(tapCount: tapCount)
    }
    
    init(tapCount: Int) {
        self.tapCount = tapCount
        super.init(nibName: nil, bundle: nil)
        
        view.backgroundColor = .blue.withAlphaComponent(0.7)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        self.addSubviews()
        self.makeConstraints()
    }
    
    lazy var cntLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        
        return label
    }()
    
    private func setupViews() {
        cntLabel.text = String(tapCount)
    }
    
    private func addSubviews() {
        self.view.addSubview(cntLabel)
    }
    
    private func makeConstraints() {
        self.cntLabel.translatesAutoresizingMaskIntoConstraints = false
        self.cntLabel.centerXAnchor.constraint(equalTo: super.view.centerXAnchor).isActive = true
        self.cntLabel.centerYAnchor.constraint(equalTo: super.view.centerYAnchor).isActive = true
    }
    
}
