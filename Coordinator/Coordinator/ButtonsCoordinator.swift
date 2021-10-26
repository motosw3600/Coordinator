//
//  ButtonsCoordinator.swift
//  Coordinator
//
//  Created by 박상우 on 2021/10/26.
//

import UIKit


protocol ButtonsCoordinatorDependencies {
    func makeButtonViewController(actions: ButtonsViewModelActions) -> ButtonsViewController

    func makeBlueViewController(tapCount: Int) -> UIViewController
    func makeRedViewController(tapCount: Int) -> UIViewController
}

final class ButtonsCoordinator {
    private weak var navigationController: UINavigationController?
    private let dependencies: ButtonsCoordinatorDependencies

    init(navigationController: UINavigationController, dependencies: ButtonsCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }

    func start() {
        let actions = ButtonsViewModelActions(showRedButton: showRed(tapCount:),
                                              showBlueButton: showBlue(tapCount:))
        let vc = dependencies.makeButtonViewController(actions: actions)
        navigationController?.pushViewController(vc, animated: false)
    }

    // Private
    private func showRed(tapCount: Int) {
        let vc = dependencies.makeRedViewController(tapCount: tapCount)
        navigationController?.pushViewController(vc, animated: true)
    }

    private func showBlue(tapCount: Int) {
        let vc = dependencies.makeBlueViewController(tapCount: tapCount)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
