//
//  ButtonsUsecase.swift
//  Coordinator
//
//  Created by 박상우 on 2021/10/27.
//

import Foundation

protocol ButtonsUsecase {
    var redButtonCnt: Int { get set }
    var blueButtonCnt: Int { get set }
}


final class ButtonsUsecaseImpl: ButtonsUsecase {
    var redButtonCnt: Int {
        get {
            return UserDefaults.standard.integer(forKey: "redButton")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "redButton")
        }
    }
    
    var blueButtonCnt: Int {
        get {
            return UserDefaults.standard.integer(forKey: "blueButton")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "blueButton")
        }
    }
    
}
