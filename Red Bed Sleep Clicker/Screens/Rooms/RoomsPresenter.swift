//
//  RoomsPresenter.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 27.02.2024.
//

final class RoomsPresenter: RoomsPresentationLogic {
    
    // MARK: - Constants
    private enum Constants {
        
    }
    
    weak var view: RoomsDisplayLogic?
    
    // MARK: - RoomsPresentationLogic
    func presentStart(_ response: Model.Start.Response) {
        let balance = response.balance
        view?.displayStart(Model.Start.ViewModel(balanceLabel: "Balance: \(balance)"))
    }
    
    func presentPetTap(_ response: Model.PetTap.Response) {
        var balance = response.balance
        balance += 1
        RoomsInteractor.balance += 1
        view?.displayPetTap(Model.PetTap.ViewModel(balanceLabel: "Balance: \(balance)"))
    }
    
    func presentSettings(_ response: Model.Settings.Response) {
        view?.displaySettings(RoomsModel.Settings.ViewModel())
    }
    
    func presentShop(_ response: Model.Shop.Response) {
        view?.displayShop(RoomsModel.Shop.ViewModel())
    }
}
