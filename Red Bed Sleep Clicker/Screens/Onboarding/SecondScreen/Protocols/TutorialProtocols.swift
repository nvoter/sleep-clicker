//
//  TutorialProtocols.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 22.04.2024.
//

protocol TutorialBusinessLogic {
    typealias Model = TutorialModel
    func loadStart(_ request: Model.Start.Request)
    func loadRooms(_ request: Model.Rooms.Request)
    // func load(_ request: Model..Request)
}

protocol TutorialDataSource: AnyObject {
    typealias Model = TutorialModel
//    func logStart(_ info: Model.Start.Info)
    // func log(_ viewModel: Model..Info)
}

protocol TutorialPresentationLogic {
    typealias Model = TutorialModel
    func presentStart(_ response: Model.Start.Response)
    func presentRooms(_ response: Model.Rooms.Response)
    // func present(_ response: Model..Response)
}

protocol TutorialDisplayLogic: AnyObject {
    typealias Model = TutorialModel
    func displayStart(_ viewModel: Model.Start.ViewModel)
    func displayRooms(_ viewModel: Model.Rooms.ViewModel)
    // func display(_ viewModel: Model..ViewModel)
}

protocol TutorialRoutingLogic {
    func routeToRooms()
}
