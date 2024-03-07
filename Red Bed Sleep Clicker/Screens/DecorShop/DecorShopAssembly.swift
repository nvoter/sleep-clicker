//
//  DecorShopAssembly.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 06.03.2024.
//

import UIKit

enum DecorShopAssembly {
    static func build() -> UIViewController {
        let router: DecorShopRouter = DecorShopRouter()
        let presenter: DecorShopPresenter = DecorShopPresenter()
        let interactor: DecorShopInteractor = DecorShopInteractor(presenter: presenter)
        let viewController: DecorShopViewController = DecorShopViewController(
            router: router,
            interactor: interactor
        )
        
        router.view = viewController
        presenter.view = viewController
        
        return viewController
    }
}
