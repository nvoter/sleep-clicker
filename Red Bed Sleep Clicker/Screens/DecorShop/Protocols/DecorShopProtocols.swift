//
//  DecorShopProtocols.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 06.03.2024.
//

protocol DecorShopBusinessLogic {
    typealias Model = DecorShopModel
    func loadStart(_ request: Model.Start.Request)
    // func load(_ request: Model..Request)
}

protocol DecorShopDataSource: AnyObject {
    typealias Model = DecorShopModel
    // func logStart(_ info: Model.Start.Info)
    // func log(_ viewModel: Model..Info)
}

protocol DecorShopPresentationLogic {
    typealias Model = DecorShopModel
    func presentStart(_ response: Model.Start.Response)
    // func present(_ response: Model..Response)
}

protocol DecorShopDisplayLogic: AnyObject {
    typealias Model = DecorShopModel
    func displayStart(_ viewModel: Model.Start.ViewModel)
    // func display(_ viewModel: Model..ViewModel)
}

protocol DecorShopRoutingLogic {
    func routeToShop()
}
