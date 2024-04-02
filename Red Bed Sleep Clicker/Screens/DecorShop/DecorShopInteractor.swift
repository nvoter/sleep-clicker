//
//  DecorShopInteractor.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 06.03.2024.
//

import UIKit

final class DecorShopInteractor: DecorShopBusinessLogic, DecorShopDataSource {
    // MARK: - Fields
    var backgrounds: [BackgroundModel] = []
    private let defaults = UserDefaults.standard
    private let fundsService: FundsService
    private let lootService: LootService = LootService.shared
    private let shopService: ShopService
    private let presenter: DecorShopPresentationLogic
    
    // MARK: - Lifecycle
    init(presenter: DecorShopPresentationLogic) {
        fundsService = FundsService(defaults: defaults)
        shopService = ShopService(lootService: lootService)
        self.presenter = presenter
    }
    
    // MARK: - BusinessLogic
    func loadStart(_ request: Model.Start.Request) {
        backgrounds = shopService.backgrounds
        presenter.presentStart(Model.Start.Response(backgroundName: defaults.string(forKey: "backgroundName") ?? "stone", balance: fundsService.getBalance()))
    }
    
    func loadBackgroundPurchase(_ request: Model.BackgroundPurchase.Request) {
        if (request.background.isBought) {
            defaults.string(forKey: "backgroundName")
            presenter.presentBackgroundPurchase(Model.BackgroundPurchase.Response(status: true, balance: fundsService.getBalance()))
        } else {
            let status = shopService.buyItem(item: request.background)
            if (status) {
                defaults.setValue(request.background.name, forKey: "backgroundName")
            }
            presenter.presentBackgroundPurchase(Model.BackgroundPurchase.Response(status: status, balance: fundsService.getBalance()))
        }
    }
    
    func loadShop(_ request: Model.Back.Request) {
        presenter.presentShop(Model.Back.Response())
    }
}
