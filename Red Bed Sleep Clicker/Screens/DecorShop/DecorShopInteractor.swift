//
//  DecorShopInteractor.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 06.03.2024.
//

final class DecorShopInteractor: DecorShopBusinessLogic {
    // MARK: - Fields
    private let presenter: DecorShopPresentationLogic
    
    // MARK: - Lifecycle
    init(presenter: DecorShopPresentationLogic) {
        self.presenter = presenter
    }
    
    // MARK: - BusinessLogic
    func loadStart(_ request: Model.Start.Request) {
        presenter.presentStart(Model.Start.Response())
    }
}
