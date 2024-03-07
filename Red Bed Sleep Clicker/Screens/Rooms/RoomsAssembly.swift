//
//  RoomsAssembly.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 27.02.2024.
//

import UIKit

enum RoomsAssembly {
    static func build() -> UIViewController {
        let router: RoomsRouter = RoomsRouter()
        let presenter: RoomsPresenter = RoomsPresenter()
        let interactor: RoomsInteractor = RoomsInteractor(presenter: presenter)
        let viewController: RoomsViewController = RoomsViewController(
            router: router,
            interactor: interactor
        )
        
        router.view = viewController
        presenter.view = viewController
        
        return viewController
    }
}
