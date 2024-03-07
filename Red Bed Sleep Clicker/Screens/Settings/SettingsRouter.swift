//
//  SettingsRouter.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 29.02.2024.
//

import UIKit

final class SettingsRouter: SettingsRoutingLogic {
    weak var view: UIViewController?
    
    func routeToAbout() {
        view?.navigationController?.present(AboutAssembly.build(), animated: true)
    }
    
    func routeToRooms() {
        let vc = RoomsAssembly.build()
        view?.navigationController?.pushViewController(vc, animated: false)
    }
}
