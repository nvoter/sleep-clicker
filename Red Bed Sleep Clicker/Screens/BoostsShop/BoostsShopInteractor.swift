//
//  BoostsShopInteractor.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 06.03.2024.
//

import UIKit

final class BoostsShopInteractor: BoostsShopBusinessLogic, BoostsShopDataSource {
    // MARK: - Fields
    var boosts: [BoostModel] = []
    private let defaults = UserDefaults.standard
    private let fundsService: FundsService
    private let lootService: LootService = LootService.shared
    private let shopService: ShopService
    private let presenter: BoostsShopPresentationLogic
    
    // MARK: - Lifecycle
    init(presenter: BoostsShopPresentationLogic) {
        fundsService = FundsService(defaults: defaults)
        shopService = ShopService(lootService: lootService)
        self.presenter = presenter
    }
    
    // MARK: - BusinessLogic
    func loadStart(_ request: Model.Start.Request) {
        boosts = [BoostModel(name: "Gold Apple", description: "+20 hp to all characters", price: 100, shopImage: UIImage(named: "goldapple")!), BoostModel(name: "Enderman", description: "all characteristics full", price: 500, shopImage: UIImage(named: "boostEnderman")!)]
        presenter.presentStart(Model.Start.Response(backgroundName: defaults.string(forKey: "backgroundName") ?? "stone", balance: fundsService.getBalance()))
    }
    
    func loadBoostPurchase(_ request: Model.BoostPurchase.Request) {
        presenter.presentBoostPurchase(Model.BoostPurchase.Response(status: shopService.buyItem(item: request.boost), balance: fundsService.getBalance()))
    }
    
    func loadShop(_ request: Model.Back.Request) {
        presenter.presentShop(BoostsShopModel.Back.Response())
    }
}
