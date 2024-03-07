//
//  ShopInteractor.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 02.03.2024.
//

final class ShopInteractor: ShopBusinessLogic, ShopDataSource {
    // MARK: - Fields
    private let presenter: ShopPresentationLogic
    
    // MARK: - Lifecycle
    init(presenter: ShopPresentationLogic) {
        self.presenter = presenter
    }
    
    // MARK: - BusinessLogic
    func loadStart(_ request: Model.Start.Request) {
        presenter.presentStart(Model.Start.Response())
    }
}
