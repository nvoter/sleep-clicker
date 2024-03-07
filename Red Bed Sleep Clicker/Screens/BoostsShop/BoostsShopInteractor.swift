//
//  BoostsShopInteractor.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 06.03.2024.
//

final class BoostsShopInteractor: BoostsShopBusinessLogic {
    // MARK: - Fields
    private let presenter: BoostsShopPresentationLogic
    
    // MARK: - Lifecycle
    init(presenter: BoostsShopPresentationLogic) {
        self.presenter = presenter
    }
    
    // MARK: - BusinessLogic
    func loadStart(_ request: Model.Start.Request) {
        presenter.presentStart(Model.Start.Response())
    }
}
