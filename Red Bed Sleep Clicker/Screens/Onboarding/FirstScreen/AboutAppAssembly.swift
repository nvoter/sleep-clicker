//
//  AboutAppAssembly.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 15.03.2024.
//

import UIKit

enum AboutAppAssembly {
    static func build() -> UIViewController {
        let router: AboutAppRouter = AboutAppRouter()
        let presenter: AboutAppPresenter = AboutAppPresenter()
        let interactor: AboutAppInteractor = AboutAppInteractor(presenter: presenter)
        let viewController: AboutAppViewController = AboutAppViewController(
            router: router,
            interactor: interactor
        )
        
        router.view = viewController
        presenter.view = viewController
        
        return viewController
    }
}
