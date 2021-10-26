//
//  ButtonsViewModel.swift
//  Coordinator
//
//  Created by 박상우 on 2021/10/27.
//

import Foundation

struct ButtonsViewModelActions {
    let showRedButton: (Int) -> Void
    let showBlueButton: (Int) -> Void
}

protocol ButtonsViewModelInput {
    func didTapRedButton()
    func didTapBlueButton()
}

protocol ButtonsViewModelOutput {
    
}

protocol ButtonsViewModel: ButtonsViewModelInput, ButtonsViewModelOutput {}

final class ButtonsViewModelImpl: ButtonsViewModel {
    
    private let actions: ButtonsViewModelActions
    private var buttonsUsecase: ButtonsUsecase
    
    init(actions: ButtonsViewModelActions, buttonUsecase: ButtonsUsecase) {
        self.actions = actions
        self.buttonsUsecase = buttonUsecase
    }
    
    func didTapRedButton() {
        buttonsUsecase.redButtonCnt += 1
        actions.showRedButton(buttonsUsecase.redButtonCnt)
    }
    
    func didTapBlueButton() {
        buttonsUsecase.blueButtonCnt += 1
        actions.showBlueButton(buttonsUsecase.blueButtonCnt)
    }
    
}
