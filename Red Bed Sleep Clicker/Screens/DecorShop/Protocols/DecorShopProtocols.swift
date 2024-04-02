//
//  DecorShopProtocols.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 06.03.2024.
//

protocol DecorShopBusinessLogic {
    typealias Model = DecorShopModel
    func loadStart(_ request: Model.Start.Request)
    func loadBackgroundPurchase(_ request: Model.BackgroundPurchase.Request)
    func loadShop(_ request: Model.Back.Request)
    // func load(_ request: Model..Request)
}

protocol DecorShopDataSource: AnyObject {
    typealias Model = DecorShopModel
    var backgrounds: [BackgroundModel] { get }
    // func logStart(_ info: Model.Start.Info)
    // func log(_ viewModel: Model..Info)
}

protocol DecorShopPresentationLogic {
    typealias Model = DecorShopModel
    func presentStart(_ response: Model.Start.Response)
    func presentBackgroundPurchase(_ response: Model.BackgroundPurchase.Response)
    func presentShop(_ response: Model.Back.Response)
    // func present(_ response: Model..Response)
}

protocol DecorShopDisplayLogic: AnyObject {
    typealias Model = DecorShopModel
    func displayStart(_ viewModel: Model.Start.ViewModel)
    func displayBackgroundPurchase(_ viewModel: Model.BackgroundPurchase.ViewModel)
    func displayShop(_ viewModel: Model.Back.ViewModel)
    // func display(_ viewModel: Model..ViewModel)
}

protocol DecorShopRoutingLogic {
    func routeToShop()
}
