//
//  BoostsShopProtocols.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 06.03.2024.
//

protocol BoostsShopBusinessLogic {
    typealias Model = BoostsShopModel
    func loadStart(_ request: Model.Start.Request)
    func loadBoostPurchase(_ request: Model.BoostPurchase.Request)
    func loadShop(_ request: Model.Back.Request)
    // func load(_ request: Model..Request)
}

protocol BoostsShopDataSource: AnyObject {
    typealias Model = BoostsShopModel
    var boosts: [BoostModel] { get }
    // func logStart(_ info: Model.Start.Info)
    // func log(_ viewModel: Model..Info)
}

protocol BoostsShopPresentationLogic {
    typealias Model = BoostsShopModel
    func presentStart(_ response: Model.Start.Response)
    func presentBoostPurchase(_ response: Model.BoostPurchase.Response)
    func presentShop(_ response: Model.Back.Response)
    // func present(_ response: Model..Response)
}

protocol BoostsShopDisplayLogic: AnyObject {
    typealias Model = BoostsShopModel
    func displayStart(_ viewModel: Model.Start.ViewModel)
    func displayBoostPurchase(_ viewModel: Model.BoostPurchase.ViewModel)
    func displayShop(_ viewModel: Model.Back.ViewModel)
    // func display(_ viewModel: Model..ViewModel)
}

protocol BoostsShopRoutingLogic {
    func routeToShop()
}
