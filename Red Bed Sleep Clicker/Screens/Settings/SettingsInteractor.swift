//
//  SettingsInteractor.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 29.02.2024.
//

import Foundation

final class SettingsInteractor: SettingsBusinessLogic {
    // MARK: - Fields
    private let defaults = UserDefaults.standard
    private let presenter: SettingsPresentationLogic
    
    // MARK: - Lifecycle
    init(presenter: SettingsPresentationLogic) {
        self.presenter = presenter
    }
    
    // MARK: - BusinessLogic
    func loadStart(_ request: Model.Start.Request) {
        var volume: Float = 100.0
        if defaults.object(forKey: "volume level") != nil {
            volume = defaults.float(forKey: "volume level")
        }
        presenter.presentStart(Model.Start.Response(backgroundName: defaults.string(forKey: "backgroundName") ?? "stone", volume: volume))
    }
    
    func loadAbout(_ request: Model.About.Request) {
        presenter.presentAbout(Model.About.Response())
    }
    
    func loadRooms(_ request: Model.Rooms.Request) {
        presenter.presentRooms(Model.Rooms.Response())
    }
    
    func loadValueChanged(_ request: Model.ValueChanged.Request) {
        Music.shared.changeVolume(value: request.value)
        defaults.setValue(request.value, forKey: "volume level")
    }
}
