//
//  AboutAppInteractor.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 15.03.2024.
//

import Foundation

final class AboutAppInteractor: AboutAppBusinessLogic {
    // MARK: - Fields
    private let defaults = UserDefaults.standard
    private let presenter: AboutAppPresentationLogic
        
    // MARK: - Lifecycle
    init(presenter: AboutAppPresentationLogic) {
        self.presenter = presenter
    }
    
    // MARK: - BusinessLogic
    func loadStart(_ request: Model.Start.Request) {
        presenter.presentStart(Model.Start.Response(backgroundName: defaults.string(forKey: "backgroundName") ?? "stone"))
    }
    
    func loadTutorial(_ request: Model.Tutorial.Request) {
        presenter.presentTutorial(Model.Tutorial.Response())
    }
}
