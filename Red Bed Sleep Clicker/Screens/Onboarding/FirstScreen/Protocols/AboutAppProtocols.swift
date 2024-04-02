//
//  AboutAppProtocols.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 15.03.2024.
//

protocol AboutAppBusinessLogic {
    typealias Model = AboutAppModel
    func loadStart(_ request: Model.Start.Request)
    func loadTutorial(_ request: Model.Tutorial.Request)
    // func load(_ request: Model..Request)
}

protocol AboutAppDataSource: AnyObject {
    typealias Model = AboutAppModel
//    func logStart(_ info: Model.Start.Info)
    // func log(_ viewModel: Model..Info)
}

protocol AboutAppPresentationLogic {
    typealias Model = AboutAppModel
    func presentStart(_ response: Model.Start.Response)
    func presentTutorial(_ response: Model.Tutorial.Response)
    // func present(_ response: Model..Response)
}

protocol AboutAppDisplayLogic: AnyObject {
    typealias Model = AboutAppModel
    func displayStart(_ viewModel: Model.Start.ViewModel)
    func displayTutorial(_ viewModel: Model.Tutorial.ViewModel)
    // func display(_ viewModel: Model..ViewModel)
}

protocol AboutAppRoutingLogic {
    func routeToTutorial()
}
