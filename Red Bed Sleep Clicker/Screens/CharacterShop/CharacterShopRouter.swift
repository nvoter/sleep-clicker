//
//  CharacterShopRouter.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 03.03.2024.
//

import UIKit

final class CharacterShopRouter: CharacterShopRoutingLogic {
    weak var view: UIViewController?
    
    func routeToShop() {
        view?.navigationController?.popViewController(animated: true)
    }
}
