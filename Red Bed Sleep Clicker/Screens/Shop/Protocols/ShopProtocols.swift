//
//  ShopProtocols.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 02.03.2024.
//

protocol ShopBusinessLogic {
    typealias Model = ShopModel
    func loadStart(_ request: Model.Start.Request)
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
    // func present(_ response: Model..Response)
}

protocol ShopDisplayLogic: AnyObject {
    typealias Model = ShopModel
    func displayStart(_ viewModel: Model.Start.ViewModel)
    // func display(_ viewModel: Model..ViewModel)
}

protocol ShopRoutingLogic {
    func routeToRooms()
    func routeToSettings()
    func routeToCharactersShop()
    func routeToDecorShop()
    func routeToBoostsShop()
}
