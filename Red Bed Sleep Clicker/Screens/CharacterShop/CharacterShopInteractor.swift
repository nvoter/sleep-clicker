//
//  CharacterShopInteractor.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 03.03.2024.
//

import UIKit

public final class CharacterShopInteractor: CharacterShopBusinessLogic, CharacterShopDataSource {
    // MARK: - Fields
    private let defaults = UserDefaults.standard
    private let fundsService: FundsService
    private let lootService: LootService = LootService.shared
    private let shopService: ShopService
    var characters: [PetModel] = []
    private let presenter: CharacterShopPresentationLogic
    
    // MARK: - Lifecycle
    init(presenter: CharacterShopPresentationLogic) {
        self.presenter = presenter
        shopService = ShopService(lootService: lootService)
        fundsService = FundsService(defaults: defaults)
    }
    
    // MARK: - RoomsBusinessLogic
    func loadStart(_ request: Model.Start.Request) {
        characters = shopService.getCharacters()
        presenter.presentStart(Model.Start.Response(backgroundName: defaults.string(forKey: "backgroundName") ?? "stone", balance: fundsService.getBalance()))
    }
    
    func loadPetPurchase(_ request: Model.PetPurchase.Request) {
        presenter.presentPetPurchase(CharacterShopModel.PetPurchase.Response(status: shopService.buyItem(item: request.character), balance: fundsService.getBalance()))
    }
    
    func loadShop(_ request: Model.Back.Request) {
        presenter.presentShop(Model.Back.Response())
    }
}
