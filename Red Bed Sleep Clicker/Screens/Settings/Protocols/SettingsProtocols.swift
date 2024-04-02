//
//  SettingsProtocols.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 29.02.2024.
//

protocol SettingsBusinessLogic {
    typealias Model = SettingsModel
    func loadStart(_ request: Model.Start.Request)
    func loadAbout(_ request: Model.About.Request)
    func loadRooms(_ request: Model.Rooms.Request)
    func loadValueChanged(_ request: Model.ValueChanged.Request)
    // func load(_ request: Model..Request)
}

protocol SettingsPresentationLogic {
    typealias Model = SettingsModel
    func presentStart(_ response: Model.Start.Response)
    func presentAbout(_ response: Model.About.Response)
    func presentRooms(_ response: Model.Rooms.Response)
    // func present(_ response: Model..Response)
}

protocol SettingsDisplayLogic: AnyObject {
    typealias Model = SettingsModel
    func displayStart(_ viewModel: Model.Start.ViewModel)
    func displayAbout(_ viewModel: Model.About.ViewModel)
    func displayRooms(_ viewModel: Model.Rooms.ViewModel)
    // func display(_ viewModel: Model..ViewModel)
}

protocol SettingsRoutingLogic {
    func routeToAbout()
    func routeToRooms()
}
