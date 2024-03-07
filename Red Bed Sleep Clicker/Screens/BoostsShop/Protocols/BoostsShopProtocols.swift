//
//  BoostsShopProtocols.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 06.03.2024.
//

protocol BoostsShopBusinessLogic {
    typealias Model = BoostsShopModel
    func loadStart(_ request: Model.Start.Request)
    // func load(_ request: Model..Request)
}

protocol BoostsShopDataSource: AnyObject {
    typealias Model = BoostsShopModel
    // func logStart(_ info: Model.Start.Info)
    // func log(_ viewModel: Model..Info)
}

protocol BoostsShopPresentationLogic {
    typealias Model = BoostsShopModel
    func presentStart(_ response: Model.Start.Response)
    // func present(_ response: Model..Response)
}

protocol BoostsShopDisplayLogic: AnyObject {
    typealias Model = BoostsShopModel
    func displayStart(_ viewModel: Model.Start.ViewModel)
    // func display(_ viewModel: Model..ViewModel)
}

protocol BoostsShopRoutingLogic {
    func routeToShop()
}
