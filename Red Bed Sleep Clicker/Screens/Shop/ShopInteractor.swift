//
//  ShopInteractor.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 02.03.2024.
//

import Foundation

final class ShopInteractor: ShopBusinessLogic, ShopDataSource {
    // MARK: - Fields
    private let defaults = UserDefaults.standard
    private let presenter: ShopPresentationLogic
    
    // MARK: - Lifecycle
    init(presenter: ShopPresentationLogic) {
        self.presenter = presenter
    }
    
    // MARK: - BusinessLogic
    func loadStart(_ request: Model.Start.Request) {
        presenter.presentStart(Model.Start.Response(backgroundName: defaults.string(forKey: "backgroundName") ?? "stone"))
    }
    
    func loadRooms(_ request: Model.Rooms.Request) {
        presenter.presentRooms(Model.Rooms.Response())
    }
    
    func loadSettings(_ request: Model.Settings.Request) {
        presenter.presentSettings(Model.Settings.Response())
    }
    
    func loadCharactersShop(_ request: Model.CharacterShop.Request) {
        presenter.presentCharactersShop(Model.CharacterShop.Response())
    }
    
    func loadDecorShop(_ request: Model.DecorShop.Request) {
        presenter.presentDecorShop(Model.DecorShop.Response())
    }
    
    func loadBoostsShop(_ request: Model.BoostsShop.Request) {
        presenter.presentBoostsShop(ShopModel.BoostsShop.Response())
    }
}
