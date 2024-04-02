//
//  AboutInteractor.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 07.03.2024.
//

import Foundation

final class AboutInteractor: AboutBusinessLogic {
    // MARK: - Fields
    private let defaults = UserDefaults.standard
    private let presenter: AboutPresentationLogic
    
    // MARK: - Lifecycle
    init(presenter: AboutPresentationLogic) {
        self.presenter = presenter
    }
    
    // MARK: - BusinessLogic
    func loadStart(_ request: Model.Start.Request) {
        presenter.presentStart(Model.Start.Response(backgroundName: defaults.string(forKey: "backgroundName") ?? "stone"))
    }
}
