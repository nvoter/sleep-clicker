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
    static var balance: Int = 0
    
    private let presenter: RoomsPresentationLogic
    
    // MARK: - Lifecycle
    init(presenter: RoomsPresentationLogic) {
        self.presenter = presenter
    }
    
    // MARK: - RoomsBusinessLogic
    func loadStart(_ request: Model.Start.Request) {
        characters = [PetModel(name: "Steve", sleepingImage: UIImage(named: "sleeping Steve"), awakeImage: UIImage(named: "awake Steve")), PetModel (name: "Alex", sleepingImage: UIImage(named: "sleeping Alex"), awakeImage: UIImage(named: "awake Alex")), PetModel(name: "Villager", sleepingImage: UIImage(named: "sleeping Villager"), awakeImage: UIImage(named: "awake Villager")), PetModel(name: "Enderman", sleepingImage: UIImage(named: "sleeping Enderman"), awakeImage: UIImage(named: "awake Enderman"))]
        presenter.presentStart(Model.Start.Response(balance: RoomsInteractor.balance))
    }
    
    func loadPetTap(_ request: Model.PetTap.Request) {
        presenter.presentPetTap(Model.PetTap.Response(balance: RoomsInteractor.balance))
    }
    
    func loadSettings(_ request: Model.Settings.Request) {
        presenter.presentSettings(Model.Settings.Response())
    }
    
    func loadShop(_ request: Model.Shop.Request) {
        presenter.presentShop(Model.Shop.Response())
    }
}
