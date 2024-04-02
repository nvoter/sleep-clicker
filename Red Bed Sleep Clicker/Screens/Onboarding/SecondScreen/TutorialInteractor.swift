//
//  TutorialInteractor.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 22.04.2024.
//

import Foundation

final class TutorialInteractor: TutorialBusinessLogic {
    // MARK: - Fields
    private let defaults = UserDefaults.standard
    private let presenter: TutorialPresentationLogic
    
    // MARK: - Lifecycle
    init(presenter: TutorialPresentationLogic) {
        self.presenter = presenter
    }
    
    // MARK: - BusinessLogic
    func loadStart(_ request: Model.Start.Request) {
        presenter.presentStart(Model.Start.Response(backgroundName: defaults.string(forKey: "backgroundName") ?? "stone"))
    }
    
    func loadRooms(_ request: Model.Rooms.Request) {
        presenter.presentRooms(Model.Rooms.Response())
    }
}
