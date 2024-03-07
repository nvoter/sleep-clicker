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
        view?.displayStart(Model.Start.ViewModel())
    }
}
