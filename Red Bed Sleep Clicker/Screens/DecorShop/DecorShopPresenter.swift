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
        view?.displayStart(Model.Start.ViewModel())
    }
}
