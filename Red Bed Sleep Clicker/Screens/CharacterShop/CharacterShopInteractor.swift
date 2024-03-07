//
//  CharacterShopInteractor.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 03.03.2024.
//

import UIKit

final class CharacterShopInteractor: CharacterShopBusinessLogic, CharacterShopDataSource {
    // MARK: - Fields
    var characters: [PetModel] = []
    
    private let presenter: CharacterShopPresentationLogic
    
    // MARK: - Lifecycle
    init(presenter: CharacterShopPresentationLogic) {
        self.presenter = presenter
    }
    
    // MARK: - RoomsBusinessLogic
    func loadStart(_ request: Model.Start.Request) {
        characters = [PetModel(name: "Steve", sleepingImage: UIImage(named: "sleeping Steve"), awakeImage: UIImage(named: "awake Steve")), PetModel (name: "Alex", sleepingImage: UIImage(named: "sleeping Alex"), awakeImage: UIImage(named: "awake Alex")), PetModel(name: "Villager", sleepingImage: UIImage(named: "sleeping Villager"), awakeImage: UIImage(named: "awake Villager")), PetModel(name: "Enderman", sleepingImage: UIImage(named: "sleeping Enderman"), awakeImage: UIImage(named: "awake Enderman"))]
        presenter.presentStart(Model.Start.Response(balance: RoomsInteractor.balance))
    }
    
    func loadPetPurchase(_ request: Model.PetPurchase.Request) {
        var balance = RoomsInteractor.balance
        let price = request.price
        if (balance >= price) {
            RoomsInteractor.balance -= price
            presenter.presentPetPurchase(Model.PetPurchase.Response(status: true, balance: RoomsInteractor.balance))
        }
        presenter.presentPetPurchase(Model.PetPurchase.Response(status: false, balance: RoomsInteractor.balance))
    }
    
    func loadShop(_ request: Model.Back.Request) {
        presenter.presentShop(Model.Back.Response())
    }
}
