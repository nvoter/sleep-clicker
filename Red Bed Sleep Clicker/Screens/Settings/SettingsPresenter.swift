//
//  SettingsPresenter.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 29.02.2024.
//

final class SettingsPresenter: SettingsPresentationLogic {
    // MARK: - Constants
    private enum Constants {
        
    }
    
    weak var view: SettingsDisplayLogic?
    
    // MARK: - PresentationLogic
    func presentStart(_ response: Model.Start.Response) {
        view?.displayStart(Model.Start.ViewModel(backgroundName: response.backgroundName, volume: response.volume))
    }
    
    func presentAbout(_ response: Model.About.Response) {
        view?.displayAbout(Model.About.ViewModel())
    }
    
    func presentRooms(_ response: Model.Rooms.Response) {
        view?.displayRooms(Model.Rooms.ViewModel())
    }
}
