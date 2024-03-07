//
//  AboutProtocols.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 07.03.2024.
//

protocol AboutBusinessLogic {
    typealias Model = AboutModel
    func loadStart(_ request: Model.Start.Request)
    // func load(_ request: Model..Request)
}

protocol AboutPresentationLogic {
    typealias Model = AboutModel
    func presentStart(_ response: Model.Start.Response)
    // func present(_ response: Model..Response)
}

protocol AboutDisplayLogic: AnyObject {
    typealias Model = AboutModel
    func displayStart(_ viewModel: Model.Start.ViewModel)
    // func display(_ viewModel: Model..ViewModel)
}

protocol AboutRoutingLogic {
    func routeTo()
}
