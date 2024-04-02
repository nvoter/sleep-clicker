//
//  AboutPresenter.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 07.03.2024.
//

final class AboutPresenter: AboutPresentationLogic {
    // MARK: - Constants
    private enum Constants {
        
    }
    
    weak var view: AboutDisplayLogic?
    
    // MARK: - PresentationLogic
    func presentStart(_ response: Model.Start.Response) {
        view?.displayStart(Model.Start.ViewModel(backgroundName: response.backgroundName))
    }
}
