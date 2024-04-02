//
//  AboutAppRouter.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 15.03.2024.
//

import UIKit

final class AboutAppRouter: AboutAppRoutingLogic {
    weak var view: UIViewController?
    
    func routeToTutorial() {
        let vc = TutorialAssembly.build(false)
        view?.navigationController?.pushViewController(vc, animated: true)
    }
}
