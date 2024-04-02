//
//  ShopProtocols.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 02.03.2024.
//

protocol ShopBusinessLogic {
    typealias Model = ShopModel
    func loadStart(_ request: Model.Start.Request)
    func loadRooms(_ request: Model.Rooms.Request)
    func loadSettings(_ request: Model.Settings.Request)
    func loadCharactersShop(_ request: Model.CharacterShop.Request)
    func loadDecorShop(_ request: Model.DecorShop.Request)
    func loadBoostsShop(_ request: Model.BoostsShop.Request)
    // func load(_ request: Model..Request)
}

protocol ShopDataSource: AnyObject {
    typealias Model = ShopModel
//    func logStart(_ info: Model.Start.Info)
    // func log(_ viewModel: Model..Info)
}

protocol ShopPresentationLogic {
    typealias Model = ShopModel
    func presentStart(_ response: Model.Start.Response)
    func presentRooms(_ request: Model.Rooms.Response)
    func presentSettings(_ request: Model.Settings.Response)
    func presentCharactersShop(_ request: Model.CharacterShop.Response)
    func presentDecorShop(_ request: Model.DecorShop.Response)
    func presentBoostsShop(_ request: Model.BoostsShop.Response)
    // func present(_ response: Model..Response)
}

protocol ShopDisplayLogic: AnyObject {
    typealias Model = ShopModel
    func displayStart(_ viewModel: Model.Start.ViewModel)
    func displayRooms(_ request: Model.Rooms.ViewModel)
    func displaySettings(_ request: Model.Settings.ViewModel)
    func displayCharactersShop(_ request: Model.CharacterShop.ViewModel)
    func displayDecorShop(_ request: Model.DecorShop.ViewModel)
    func displayBoostsShop(_ request: Model.BoostsShop.ViewModel)
    // func display(_ viewModel: Model..ViewModel)
}

protocol ShopRoutingLogic {
    func routeToRooms()
    func routeToSettings()
    func routeToCharactersShop()
    func routeToDecorShop()
    func routeToBoostsShop()
}
