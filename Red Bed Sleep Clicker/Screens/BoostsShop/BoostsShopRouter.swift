//
//  BoostsShopRouter.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 06.03.2024.
//

import UIKit

final class BoostsShopRouter: BoostsShopRoutingLogic {
    weak var view: UIViewController?
    
    func routeToShop() {
        view?.navigationController?.popViewController(animated: true)
    }
}
