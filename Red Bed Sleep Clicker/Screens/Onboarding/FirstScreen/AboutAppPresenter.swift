//
//  AboutAppPresenter.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 15.03.2024.
//

final class AboutAppPresenter: AboutAppPresentationLogic {
    // MARK: - Constants
    private enum Constants {
        
    }
    
    weak var view: AboutAppDisplayLogic?
    
    // MARK: - PresentationLogic
    func presentStart(_ response: Model.Start.Response) {
        view?.displayStart(Model.Start.ViewModel(backgroundName: response.backgroundName))
    }
    
    func presentTutorial(_ response: Model.Tutorial.Response) {
        view?.displayTutorial(Model.Tutorial.ViewModel())
    }
}
