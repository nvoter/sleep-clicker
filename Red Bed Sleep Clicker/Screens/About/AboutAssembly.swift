//
//  AboutAssembly.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 07.03.2024.
//

import UIKit

enum AboutAssembly {
    static func build() -> UIViewController {
        let router: AboutRouter = AboutRouter()
        let presenter: AboutPresenter = AboutPresenter()
        let interactor: AboutInteractor = AboutInteractor(presenter: presenter)
        let viewController: AboutViewController = AboutViewController(
            router: router,
            interactor: interactor
        )
        
        router.view = viewController
        presenter.view = viewController
        
        return viewController
    }
}
