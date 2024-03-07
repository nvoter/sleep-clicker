//
//  CharacterShopAssembly.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 03.03.2024.
//

import UIKit

enum CharacterShopAssembly {
    static func build() -> UIViewController {
        let router: CharacterShopRouter = CharacterShopRouter()
        let presenter: CharacterShopPresenter = CharacterShopPresenter()
        let interactor: CharacterShopInteractor = CharacterShopInteractor(presenter: presenter)
        let viewController: CharacterShopViewController = CharacterShopViewController(
            router: router,
            interactor: interactor
        )
        
        router.view = viewController
        presenter.view = viewController
        
        return viewController
    }
}
