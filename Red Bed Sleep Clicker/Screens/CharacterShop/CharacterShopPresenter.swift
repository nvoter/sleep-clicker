//
//  CharacterShopPresenter.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 03.03.2024.
//

final class CharacterShopPresenter: CharacterShopPresentationLogic {
    // MARK: - Constants
    private enum Constants {
        
    }
    
    weak var view: CharacterShopDisplayLogic?
    
    // MARK: - PresentationLogic
    func presentStart(_ response: Model.Start.Response) {
        view?.displayStart(Model.Start.ViewModel(backgroundName: response.backgroundName, balanceLabel: "\(response.balance)"))
    }
    
    func presentPetPurchase(_ response: Model.PetPurchase.Response) {
        view?.displayPetPurchase(Model.PetPurchase.ViewModel(status: response.status, balanceLabel: "\(response.balance)"))
    }
    
    func presentShop(_ response: Model.Back.Response) {
        view?.displayShop(Model.Back.ViewModel())
    }
}
