//
//  TutorialRouter.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 22.04.2024.
//

import UIKit

final class TutorialRouter: TutorialRoutingLogic {
    weak var view: UIViewController?
    
    func routeToRooms() {
        view?.navigationController?.pushViewController(RoomsAssembly.build(), animated: true)
    }
}
