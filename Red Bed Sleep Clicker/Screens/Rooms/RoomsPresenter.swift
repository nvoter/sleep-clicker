//
//  RoomsPresenter.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 27.02.2024.
//

import Foundation

final class RoomsPresenter: RoomsPresentationLogic {
    
    // MARK: - Constants
    private enum Constants {
        
    }
    
    weak var view: RoomsDisplayLogic?
    
    // MARK: - RoomsPresentationLogic
    func presentStart(_ response: Model.Start.Response) {
        view?.displayStart(Model.Start.ViewModel(backgroundName: response.backgroundName, balanceLabel: "\(response.balance)"))
    }
    
    func presentPetTap(_ response: Model.PetTap.Response) {
        view?.displayPetTap(Model.PetTap.ViewModel(balanceLabel: "\(response.balance)"))
    }
    
    func presentSettings(_ response: Model.Settings.Response) {
        view?.displaySettings(RoomsModel.Settings.ViewModel())
    }
    
    func presentShop(_ response: Model.Shop.Response) {
        view?.displayShop(RoomsModel.Shop.ViewModel())
    }
    
    func presentTutorial(_ response: Model.Tutorial.Response) {
        view?.displayTutorial(RoomsModel.Tutorial.ViewModel())
    }
    
    func presentReload(_ response: Model.Reload.Response) {
        DispatchQueue.main.async { [weak view] in
            view?.displayReload(Model.Reload.ViewModel())
        }
    }
}
