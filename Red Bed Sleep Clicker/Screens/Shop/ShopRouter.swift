//
//  ShopRouter.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 02.03.2024.
//

import UIKit

final class ShopRouter: ShopRoutingLogic {
    weak var view: UIViewController?
    
    func routeToRooms() {
        let vc = RoomsAssembly.build()
        view?.navigationController?.pushViewController(vc, animated: false)
    }
    
    func routeToSettings() {
        let vc = SettingsAssembly.build()
        view?.navigationController?.pushViewController(vc, animated: false)
    }
    
    func routeToCharactersShop() {
        let vc = CharacterShopAssembly.build()
        view?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func routeToDecorShop() {
        let vc = DecorShopAssembly.build()
        view?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func routeToBoostsShop() {
        let vc = BoostsShopAssembly.build()
        view?.navigationController?.pushViewController(vc, animated: true)
    }
}
