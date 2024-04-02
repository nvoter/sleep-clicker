//
//  ShopService.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 22.03.2024.
//

import Foundation
import UIKit

protocol ShoppingLogic {
    func getCharacters() -> [PetModel]
    func getBackgrounds() -> [BackgroundModel]
    func buyItem(item: ModelProtocol) -> Bool
    func sellDeadCharacter(index: Int)
}

final class ShopService: ShoppingLogic {
    private let fundsService: FundsService = FundsService(defaults: UserDefaults.standard)
    let lootService: LootService
    var characters: [PetModel] = [
        PetModel(
            name: "Steve",
            sleepingImage: UIImage(named: "sleeping Steve"),
            awakeImage: UIImage(named: "awake Steve")
        ),
        PetModel (
            name: "Alex",
            sleepingImage: UIImage(named: "sleeping Alex"),
            awakeImage: UIImage(named: "awake Alex")
        ),
        PetModel(
            name: "Villager",
            sleepingImage: UIImage(named: "sleeping Villager"),
            awakeImage: UIImage(named: "awake Villager")
        ),
        PetModel(
            name: "Panda",
            sleepingImage: UIImage(named: "sleeping Panda"),
            awakeImage: UIImage(named: "awake Panda")
    )]
    var backgrounds: [BackgroundModel] = [
        BackgroundModel(
            shopImage: UIImage(named: "stone")!,
            name: "stone",
            price: 0,
            isBought: true),
        BackgroundModel(
            shopImage: UIImage(named: "dirt")!,
            name: "dirt",
            price: 100,
            isBought: false
    )]
    
    init(lootService: LootService) {
        self.lootService = lootService
    }
    
    func getCharacters() -> [PetModel] {
        return characters
    }
    
    func getBackgrounds() -> [BackgroundModel] {
        return backgrounds
    }
    
    func buyItem(item: ModelProtocol) -> Bool {
        var balance = fundsService.getBalance()
        if (balance < item.price) {
            return false
        }
        balance -= item.price
        fundsService.updateBalance(balance: balance)
        lootService.saveItem(item: item)
        print(lootService.getCharacters())
        return true
    }
    
    func sellDeadCharacter(index: Int) {
        var balance = fundsService.getBalance()
        balance += 100
        fundsService.updateBalance(balance: balance)
        lootService.sellCharacter(index: index)
    }
}
