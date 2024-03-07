//
//  BoostsShopAssembly.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 06.03.2024.
//

import UIKit

enum BoostsShopAssembly {
    static func build() -> UIViewController {
        let router: BoostsShopRouter = BoostsShopRouter()
        let presenter: BoostsShopPresenter = BoostsShopPresenter()
        let interactor: BoostsShopInteractor = BoostsShopInteractor(presenter: presenter)
        let viewController: BoostsShopViewController = BoostsShopViewController(
            router: router,
            interactor: interactor
        )
        
        router.view = viewController
        presenter.view = viewController
        
        return viewController
    }
}
