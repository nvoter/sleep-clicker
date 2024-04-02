//
//  RoomsInteractor.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 27.02.2024.
//

import UIKit

final class RoomsInteractor: RoomsBusinessLogic, RoomsDataSource {
    // MARK: - Fields
    var characters: [PetModel] = []
    private let defaults = UserDefaults.standard
    private let fundsService: FundsService
    private let lootService: LootService = LootService.shared
    private let shopService: ShopService
    private let presenter: RoomsPresentationLogic
    
    // MARK: - Lifecycle
    init(presenter: RoomsPresentationLogic) {
        self.presenter = presenter
        shopService = ShopService(lootService: lootService)
        fundsService = FundsService(defaults: defaults)
    }
    
    // MARK: - RoomsBusinessLogic
    func loadStart(_ request: Model.Start.Request) {
        characters = lootService.getCharacters()
        presenter.presentStart(Model.Start.Response(backgroundName: defaults.string(forKey: "backgroundName") ?? "stone", balance: fundsService.getBalance()))
    }
    
    func loadPetTap(_ request: Model.PetTap.Request) {
        characters = lootService.getCharacters()
        let character = characters[request.index]
        switch character.statement {
        case Statement.dead:
            shopService.sellDeadCharacter(index: request.index)
        case Statement.awake:
            if (character.cheerfulness <= 20) {
                character.hp -= 20
                if (character.hp == 0) {
                    character.statement = Statement.dead
                }
            } else if (character.cheerfulness >= 80) {
                fundsService.updateBalance(balance: fundsService.getBalance() + 5)
            } else {
                fundsService.updateBalance(balance: fundsService.getBalance() + 1)
            }
        case Statement.asleep:
            if (character.cheerfulness >= 80) {
                character.hp -= 20
                if (character.hp == 0) {
                    character.statement = Statement.dead
                }
            } else if (character.cheerfulness <= 20) {
                fundsService.updateBalance(balance: fundsService.getBalance() + 5)
            } else {
                fundsService.updateBalance(balance: fundsService.getBalance() + 1)
            }
        }
        characters = lootService.getCharacters()
        presenter.presentPetTap(Model.PetTap.Response(balance: fundsService.getBalance()))
    }
    
    func loadSettings(_ request: Model.Settings.Request) {
        presenter.presentSettings(Model.Settings.Response())
    }
    
    func loadShop(_ request: Model.Shop.Request) {
        presenter.presentShop(Model.Shop.Response())
    }
    
    func loadTutorial(_ request: Model.Tutorial.Request) {
        presenter.presentTutorial(Model.Tutorial.Response())
    }
    
    func loadReload(_ request: Model.Reload.Request) {
        characters = lootService.getCharacters()
        print(characters)
        presenter.presentReload(Model.Reload.Response())
    }
}
