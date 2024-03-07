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
        let balance = response.balance
        view?.displayStart(Model.Start.ViewModel(balanceLabel: "Balance: \(balance)"))
    }
    
    func presentPetPurchase(_ response: Model.PetPurchase.Response) {
        let balance = response.balance
        view?.displayPetPurchase(Model.PetPurchase.ViewModel(status: response.status, balanceLabel: "Balance: \(balance)"))
    }
    
    func presentShop(_ response: Model.Back.Response) {
        view?.displayShop(Model.Back.ViewModel())
    }
}
