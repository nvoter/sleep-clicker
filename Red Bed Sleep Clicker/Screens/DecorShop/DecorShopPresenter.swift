//
//  DecorShopPresenter.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 06.03.2024.
//

final class DecorShopPresenter: DecorShopPresentationLogic {
    // MARK: - Constants
    private enum Constants {
        
    }
    
    weak var view: DecorShopDisplayLogic?
    
    // MARK: - PresentationLogic
    func presentStart(_ response: Model.Start.Response) {
        view?.displayStart(Model.Start.ViewModel(backgroundName: response.backgroundName, balanceLabel: "\(response.balance)"))
    }
    
    func presentBackgroundPurchase(_ response: Model.BackgroundPurchase.Response) {
        view?.displayBackgroundPurchase(Model.BackgroundPurchase.ViewModel(status: response.status, balanceLabel: "\(response.balance)"))
    }
    
    func presentShop(_ response: Model.Back.Response) {
        view?.displayShop(Model.Back.ViewModel())
    }
}
