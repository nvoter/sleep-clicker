//
//  TutorialPresenter.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 22.04.2024.
//

final class TutorialPresenter: TutorialPresentationLogic {
    // MARK: - Constants
    private enum Constants {
        
    }
    
    weak var view: TutorialDisplayLogic?
    
    // MARK: - PresentationLogic
    func presentStart(_ response: Model.Start.Response) {
        view?.displayStart(Model.Start.ViewModel(backgroundName: response.backgroundName))
    }
    
    func presentRooms(_ response: Model.Rooms.Response) {
        view?.displayRooms(Model.Rooms.ViewModel())
    }
}
