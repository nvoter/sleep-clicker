//
//  ShopAssembly.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 02.03.2024.
//

import UIKit

enum ShopAssembly {
    static func build() -> UIViewController {
        let router: ShopRouter = ShopRouter()
        let presenter: ShopPresenter = ShopPresenter()
        let interactor: ShopInteractor = ShopInteractor(presenter: presenter)
        let viewController: ShopViewController = ShopViewController(
            router: router,
            interactor: interactor
        )
        
        router.view = viewController
        presenter.view = viewController
        
        return viewController
    }
}
