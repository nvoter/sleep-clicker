//
//  RoomsRouter.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 27.02.2024.
//

import UIKit

final class RoomsRouter: RoomsRoutingLogic {
    
    weak var view: UIViewController?
    
    func routeToSettings() {
        let vc = SettingsAssembly.build()
        view?.navigationController?.pushViewController(vc, animated: false)
    }
    
    func routeToShop() {
        let vc = ShopAssembly.build()
        view?.navigationController?.pushViewController(vc, animated: false)
    }
}
