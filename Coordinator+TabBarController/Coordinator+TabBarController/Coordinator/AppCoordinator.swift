//
//  AppCoordinator.swift
//  Coordinator+TabBarController
//
//  Created by 박상우 on 2021/10/30.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    var childCoordinator: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: true)
    }
    
    func start() {
        showMainFlow()
    }
    
    private func showMainFlow() {
        let tabBarCoordinator = TabBarCoordinator(navigationController)
        tabBarCoordinator.start()
        childCoordinator.append(tabBarCoordinator)
    }
    
}
