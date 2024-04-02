//
//  TutorialAssembly.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 22.04.2024.
//

import UIKit

enum TutorialAssembly {
    static func build(_ hidesNextButton: Bool = true) -> UIViewController {
        let router: TutorialRouter = TutorialRouter()
        let presenter: TutorialPresenter = TutorialPresenter()
        let interactor: TutorialInteractor = TutorialInteractor(presenter: presenter)
        let viewController: TutorialViewController = TutorialViewController(
            router: router,
            interactor: interactor
        )
        
        if(!hidesNextButton) {
            viewController.hidesNextButton = false
        }
        
        router.view = viewController
        presenter.view = viewController
        
        return viewController
    }
}
