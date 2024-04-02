//
//  ShopPresenter.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 02.03.2024.
//

final class ShopPresenter: ShopPresentationLogic {
    
    // MARK: - Constants
    private enum Constants {
        
    }
    
    weak var view: ShopDisplayLogic?
    
    // MARK: - PresentationLogic
    func presentStart(_ response: Model.Start.Response) {
        view?.displayStart(Model.Start.ViewModel(backgroundName: response.backgroundName))
    }
    
    func presentRooms(_ request: Model.Rooms.Response) {
        view?.displayRooms(Model.Rooms.ViewModel())
    }
    
    func presentSettings(_ request: Model.Settings.Response) {
        view?.displaySettings(Model.Settings.ViewModel())
    }
    
    func presentCharactersShop(_ request: Model.CharacterShop.Response) {
        view?.displayCharactersShop(Model.CharacterShop.ViewModel())
    }
    
    func presentDecorShop(_ request: Model.DecorShop.Response) {
        view?.displayDecorShop(Model.DecorShop.ViewModel())
    }
    
    func presentBoostsShop(_ request: Model.BoostsShop.Response) {
        view?.displayBoostsShop(Model.BoostsShop.ViewModel())
    }
}
