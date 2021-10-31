//
//  TabBarCoordinator.swift
//  Coordinator+TabBarController
//
//  Created by 박상우 on 2021/10/30.
//

import UIKit

class TabBarCoordinator: NSObject, Coordinator {
    var childCoordinator: [Coordinator] = []
    var navigationController: UINavigationController
    var tabBarController: UITabBarController
    
    init(_ navigationcontroller: UINavigationController) {
        self.navigationController = navigationcontroller
        self.tabBarController = UITabBarController()
    }
    
    func start() {
        let pages: [TabBarPage] = [.first, .second, .third]
        let controllers: [UINavigationController] = pages.map { getTabController($0) }
        
        prepareTabBarController(withTabControllers: controllers)
    }
    
    private func getTabController(_ page: TabBarPage) -> UINavigationController {
        let navController = UINavigationController()
        navController.setNavigationBarHidden(false, animated: false)

        navController.tabBarItem = UITabBarItem.init(title: page.pageTitleValue(),
                                                     image: page.getImageIcon(),
                                                        tag: page.pageOrderNumber())

        switch page {
        case .first:
            // If needed: Each tab bar flow can have it's own Coordinator.
            let firstViewModel = FirstViewModel()
            let firstVC = FirstViewController(with: firstViewModel)
            firstVC.didSendEventClosure = { [weak self] event in
                switch event {
                case .detail:
                    self?.selectPage(.first)
                    let detailVC = DetailViewController()
                    navController.pushViewController(detailVC, animated: true)
                }
            }
                            
            navController.pushViewController(firstVC, animated: true)
        case .second:
            let secondViewModel = SecondViewModel()
            let secondVC = SecondViewController(with: secondViewModel)
            
            navController.pushViewController(secondVC, animated: true)
        case .third:
            let thirdViewModel = ThirdViewModel()
            let thirdVC = ThirdViewController(with: thirdViewModel)
            
            navController.pushViewController(thirdVC, animated: true)
        }
        
        return navController
    }
    
    private func prepareTabBarController(withTabControllers tabControllers: [UIViewController]) {
        tabBarController.delegate = self
        tabBarController.setViewControllers(tabControllers, animated: true)
        tabBarController.selectedIndex = TabBarPage.first.pageOrderNumber()
        tabBarController.tabBar.barTintColor = .white
        tabBarController.tabBar.isTranslucent = false
        
        navigationController.viewControllers = [tabBarController]
    }
    
    private func selectPage(_ page: TabBarPage) {
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
    
}

extension TabBarCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("touched!!")
    }
}

enum TabBarPage {
    case first
    case second
    case third

    init?(index: Int) {
        switch index {
        case 0:
            self = .first
        case 1:
            self = .second
        case 2:
            self = .third
        default:
            return nil
        }
    }
    
    func pageTitleValue() -> String {
        switch self {
        case .first:
            return "First"
        case .second:
            return "Second"
        case .third:
            return "Third"
        }
    }

    func pageOrderNumber() -> Int {
        switch self {
        case .first:
            return 0
        case .second:
            return 1
        case .third:
            return 2
        }
    }
    
    func getImageIcon() -> UIImage? {
        switch self {
        case .first:
            return UIImage(systemName: "pencil")
        case .second:
            return UIImage(systemName: "trash")
        case .third:
            return UIImage(systemName: "folder")
        }
    }
}
