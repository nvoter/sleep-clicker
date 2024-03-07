//
//  SettingsAssembly.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 29.02.2024.
//

import UIKit

enum SettingsAssembly {
    static func build() -> UIViewController {
        let router: SettingsRouter = SettingsRouter()
        let presenter: SettingsPresenter = SettingsPresenter()
        let interactor: SettingsInteractor = SettingsInteractor(presenter: presenter)
        let viewController: SettingsViewController = SettingsViewController(
            router: router,
            interactor: interactor
        )
        
        router.view = viewController
        presenter.view = viewController
        
        return viewController
    }
}
