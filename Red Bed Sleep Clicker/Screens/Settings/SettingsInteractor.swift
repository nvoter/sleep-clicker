//
//  SettingsInteractor.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 29.02.2024.
//

final class SettingsInteractor: SettingsBusinessLogic {
    // MARK: - Fields
    private let presenter: SettingsPresentationLogic
    
    // MARK: - Lifecycle
    init(presenter: SettingsPresentationLogic) {
        self.presenter = presenter
    }
    
    // MARK: - BusinessLogic
    func loadStart(_ request: Model.Start.Request) {
        presenter.presentStart(Model.Start.Response())
    }
    
    func loadAbout(_ request: Model.About.Request) {
        presenter.presentAbout(Model.About.Response())
    }
    
    func loadRooms(_ request: Model.Rooms.Request) {
        presenter.presentRooms(Model.Rooms.Response())
    }
}
