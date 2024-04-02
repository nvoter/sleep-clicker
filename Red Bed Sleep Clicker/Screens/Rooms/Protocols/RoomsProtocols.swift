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
    func loadTutorial(_ request: Model.Tutorial.Request)
    func loadReload(_ request: Model.Reload.Request)
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
    func presentTutorial(_ response: Model.Tutorial.Response)
    func presentReload(_ response: Model.Reload.Response)
}

protocol RoomsDisplayLogic: AnyObject {
    typealias Model = RoomsModel
    func displayStart(_ viewModel: Model.Start.ViewModel)
    func displayPetTap(_ viewModel: Model.PetTap.ViewModel)
    func displaySettings(_ viewModel: Model.Settings.ViewModel)
    func displayShop(_ viewModel: Model.Shop.ViewModel)
    func displayTutorial(_ viewModel: Model.Tutorial.ViewModel)
    func displayReload(_ viewModel: Model.Reload.ViewModel)
}

protocol RoomsRoutingLogic {
    func routeToSettings()
    func routeToShop()
    func routeToTutorial()
}
