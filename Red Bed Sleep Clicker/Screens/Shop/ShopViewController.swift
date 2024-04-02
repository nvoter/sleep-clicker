//
//  ShopViewController.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 02.03.2024.
//

import UIKit

final class ShopViewController: UIViewController,
                                ShopDisplayLogic {
    // MARK: - Constants
    private enum Constants {
        static let fatalError: String = "init(coder:) has not been implemented"
        static let titleViewText: String = "SHOP"
        static let roomsButtonText: String = "ROOMS"
        static let settingsButtonText: String = "SETTINGS"
        static let charactersShopButtonText: String = "CHARACTERS"
        static let decorShopButtonText: String = "DECOR"
        static let boostsShopButtonText: String = "BOOSTS"
        static let menuButtonWidth: CGFloat = 175
        static let height: CGFloat = 70
    }
    
    // MARK: - Fields
    private let titleView: CustomTitle = CustomTitle(titleText: Constants.titleViewText)
    private let roomsButton: CustomButton = CustomButton(title: Constants.roomsButtonText)
    private let settingsButton: CustomButton = CustomButton(title: Constants.settingsButtonText)
    private var background: UIImageView = UIImageView(image: nil)
    private let charactersShopButton: CustomButton = CustomButton(title: Constants.charactersShopButtonText)
    private let decorShopButton: CustomButton = CustomButton(title: Constants.decorShopButtonText)
    private let boostsShopButton: CustomButton = CustomButton(title: Constants.boostsShopButtonText)
    private let router: ShopRoutingLogic
    private let interactor: (ShopBusinessLogic & ShopDataSource)
    
    // MARK: - LifeCycle
    init(
        router: ShopRoutingLogic,
        interactor: (ShopBusinessLogic & ShopDataSource)
    ) {
        self.router = router
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.fatalError)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        interactor.loadStart(Model.Start.Request())
    }
    
    // MARK: - Configuration
    private func configureUI() {
        configureBackground()
        configureTitle()
        configureRoomsButton()
        configureSettingsButton()
        configureDecorShopButton()
        configureCharactersShopButton()
        configureBoostsShopButton()
    }
    
    private func configureBackground() {
        view.addSubview(background)
        background.pinCenter(to: view)
    }
    
    private func configureTitle() {
        view.addSubview(titleView)
        titleView.setWidth(Double(view.frame.width) - 20)
        titleView.setHeight(Constants.height)
        titleView.pinCenterX(to: view)
        titleView.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
    }
    
    private func configureSettingsButton() {
        view.addSubview(settingsButton)
        settingsButton.setWidth(Double(view.frame.width - 25) / 2)
        settingsButton.setHeight(Constants.height)
        settingsButton.pinLeft(to: view.centerXAnchor, 5)
        settingsButton.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        settingsButton.setFontSize(fontSize: 38)
        settingsButton.addTarget(self, action: #selector(settingsWasTapped), for: .touchUpInside)
    }
    
    private func configureRoomsButton() {
        view.addSubview(roomsButton)
        roomsButton.setWidth(Double(view.frame.width - 25) / 2)
        roomsButton.setHeight(Constants.height)
        roomsButton.pinRight(to: view.centerXAnchor, 5)
        roomsButton.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        roomsButton.setFontSize(fontSize: 40)
        roomsButton.addTarget(self, action: #selector(roomsWasTapped), for: .touchUpInside)
    }
    
    private func configureCharactersShopButton() {
        view.addSubview(charactersShopButton)
        charactersShopButton.setWidth(Double(view.frame.width) - 20)
        charactersShopButton.setHeight(Constants.height)
        charactersShopButton.pinCenterX(to: view)
        charactersShopButton.pinBottom(to: decorShopButton.topAnchor, 10)
        charactersShopButton.addTarget(self, action: #selector(charactersShopWasTapped), for: .touchUpInside)
    }
    
    private func configureDecorShopButton() {
        view.addSubview(decorShopButton)
        decorShopButton.setWidth(Double(view.frame.width) - 20)
        decorShopButton.setHeight(Constants.height)
        decorShopButton.pinCenterX(to: view)
        decorShopButton.pinCenterY(to: view)
        decorShopButton.addTarget(self, action: #selector(decorShopWasTapped), for: .touchUpInside)
    }
    
    private func configureBoostsShopButton() {
        view.addSubview(boostsShopButton)
        boostsShopButton.setWidth(Double(view.frame.width) - 20)
        boostsShopButton.setHeight(Constants.height)
        boostsShopButton.pinCenterX(to: view)
        boostsShopButton.pinTop(to: decorShopButton.bottomAnchor, 10)
        boostsShopButton.addTarget(self, action: #selector(boostsShopWasTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc
    private func roomsWasTapped() {
        interactor.loadRooms(ShopModel.Rooms.Request())
    }
    
    @objc
    private func settingsWasTapped() {
        interactor.loadSettings(ShopModel.Settings.Request())
    }
    
    @objc
    private func charactersShopWasTapped() {
        interactor.loadCharactersShop(ShopModel.CharacterShop.Request())
    }
    
    @objc
    private func decorShopWasTapped() {
        interactor.loadDecorShop(ShopModel.DecorShop.Request())
    }
    
    @objc
    private func boostsShopWasTapped() {
        interactor.loadBoostsShop(ShopModel.BoostsShop.Request())
    }
    
    // MARK: - DisplayLogic
    func displayStart(_ viewModel: Model.Start.ViewModel) {
        background = UIImageView(image: UIImage(named: viewModel.backgroundName))
        configureUI()
    }
    
    func displayRooms(_ request: Model.Rooms.ViewModel) {
        router.routeToRooms()
    }
    
    func displaySettings(_ request: Model.Settings.ViewModel) {
        router.routeToSettings()
    }
    
    func displayCharactersShop(_ request: Model.CharacterShop.ViewModel) {
        router.routeToCharactersShop()
    }
    
    func displayDecorShop(_ request: Model.DecorShop.ViewModel) {
        router.routeToDecorShop()
    }
    
    func displayBoostsShop(_ request: Model.BoostsShop.ViewModel) {
        router.routeToBoostsShop()
    }
}
