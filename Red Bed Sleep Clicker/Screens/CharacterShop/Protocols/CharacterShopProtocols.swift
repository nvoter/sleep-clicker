//
//  CharacterShopProtocols.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 26.03.2024.
//

protocol CharacterShopBusinessLogic {
    typealias Model = CharacterShopModel
    func loadStart(_ request: Model.Start.Request)
    func loadPetPurchase(_ request: Model.PetPurchase.Request)
    func loadShop(_ request: Model.Back.Request)
    // func load(_ request: Model..Request)
}

protocol CharacterShopDataSource: AnyObject {
    typealias Model = CharacterShopModel
    var characters: [PetModel] { get }
}

protocol CharacterShopPresentationLogic {
    typealias Model = CharacterShopModel
    func presentStart(_ response: Model.Start.Response)
    func presentPetPurchase(_ response: Model.PetPurchase.Response)
    func presentShop(_ response: Model.Back.Response)
    // func present(_ response: Model..Response)
}

protocol CharacterShopDisplayLogic: AnyObject {
    typealias Model = CharacterShopModel
    func displayStart(_ viewModel: Model.Start.ViewModel)
    func displayPetPurchase(_ viewModel: Model.PetPurchase.ViewModel)
    func displayShop(_ viewModel: Model.Back.ViewModel)
    // func display(_ viewModel: Model..ViewModel)
}

protocol CharacterShopRoutingLogic {
    func routeToShop()
}
