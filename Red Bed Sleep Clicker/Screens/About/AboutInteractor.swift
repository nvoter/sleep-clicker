//
//  AboutInteractor.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 07.03.2024.
//

final class AboutInteractor: AboutBusinessLogic {
    // MARK: - Fields
    private let presenter: AboutPresentationLogic
    
    // MARK: - Lifecycle
    init(presenter: AboutPresentationLogic) {
        self.presenter = presenter
    }
    
    // MARK: - BusinessLogic
    func loadStart(_ request: Model.Start.Request) {
        presenter.presentStart(Model.Start.Response())
    }
}
