//
//  ButtonsDIContainer.swift
//  Coordinator
//
//  Created by 박상우 on 2021/10/27.
//

import UIKit

class ButtonsDIContainer {
    
    func makeButtonCoordinator(navigationController: UINavigationController) -> ButtonsCoordinator {
        return ButtonsCoordinator(navigationController: navigationController, dependencies: self)
    }
    
    // Private
    
    private func makeBUttonsUsecaseImpl() -> ButtonsUsecase {
        return ButtonsUsecaseImpl()
    }
    
    private func makeButtonsViewModel(actions: ButtonsViewModelActions) -> ButtonsViewModel {
        return ButtonsViewModelImpl(actions: actions, buttonUsecase: makeBUttonsUsecaseImpl())
    }
}

extension ButtonsDIContainer: ButtonsCoordinatorDependencies {
    func makeButtonViewController(actions: ButtonsViewModelActions) -> ButtonsViewController {
        return ButtonsViewController.create(with: makeButtonsViewModel(actions: actions))
    }
    
    func makeRedViewController(tapCount: Int) -> UIViewController {
        return RedViewController.create(tapCount: tapCount)
    }
    
    func makeBlueViewController(tapCount: Int) -> UIViewController {
        return BlueViewController.create(tapCount: tapCount)
    }
}
