//
//  BoostsShopPresenter.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 06.03.2024.
//

final class BoostsShopPresenter: BoostsShopPresentationLogic {
    // MARK: - Constants
    private enum Constants {
        
    }
    
    weak var view: BoostsShopDisplayLogic?
    
    // MARK: - PresentationLogic
    func presentStart(_ response: Model.Start.Response) {
        view?.displayStart(Model.Start.ViewModel())
    }
}
