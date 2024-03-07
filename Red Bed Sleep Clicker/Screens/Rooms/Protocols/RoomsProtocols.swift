//
//  RoomsProtocols.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 27.02.2024.
//

protocol RoomsBusinessLogic {
    typealias Model = RoomsModel
    func loadStart(_ request: Model.Start.Request)
    func loadPetTap(_ request: Model.PetTap.Request)
    func loadSettings(_ request: Model.Settings.Request)
    func loadShop(_ request: Model.Shop.Request)
}

protocol RoomsDataSource: AnyObject {
    typealias Model = RoomsModel
    var characters: [PetModel] { get }
}

protocol RoomsPresentationLogic {
    typealias Model = RoomsModel
    func presentStart(_ response: Model.Start.Response)
    func presentPetTap(_ response: Model.PetTap.Response)
    func presentSettings(_ response: Model.Settings.Response)
    func presentShop(_ response: Model.Shop.Response)
}

protocol RoomsDisplayLogic: AnyObject {
    typealias Model = RoomsModel
    func displayStart(_ viewModel: Model.Start.ViewModel)
    func displayPetTap(_ viewModel: Model.PetTap.ViewModel)
    func displaySettings(_ viewModel: Model.Settings.ViewModel)
    func displayShop(_ viewModel: Model.Shop.ViewModel)
}

protocol RoomsRoutingLogic {
    func routeToSettings()
    func routeToShop()
}
