//
//  Coordinator.swift
//  Coordinator+TabBarController
//
//  Created by 박상우 on 2021/10/30.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinator: [Coordinator] { get set }
    var navigationController: UINavigationController { get }
    
    func start()
}
