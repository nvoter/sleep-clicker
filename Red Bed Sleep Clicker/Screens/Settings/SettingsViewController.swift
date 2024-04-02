//
//  SettingsViewController.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 29.02.2024.
//

import UIKit

final class SettingsViewController: UIViewController,
                                    SettingsDisplayLogic {
    // MARK: - Constants
    private enum Constants {
        static let fatalError: String = "init(coder:) has not been implemented"
    }
    
    // MARK: - Fields
    var background: UIImageView = UIImageView(image: nil)
    let titleView: CustomTitle = CustomTitle(titleText: "SETTINGS")
    let roomsButton: CustomButton = CustomButton(title: "ROOMS")
    var valueChanged: ((Double) -> Void)?
    let notificationsButton: CustomButton = CustomButton(title: "NOTIFICATIONS", subtitle: "ON")
    let soundsView: CustomTitle = CustomTitle(titleText: "SOUNDS", subtitleText: "")
    let soundsSlider: UISlider = UISlider()
    let aboutScreenButton: CustomButton = CustomButton(title: "ABOUT")
    var notificationsAllowed: Bool = true
    
    private let router: SettingsRoutingLogic
    private let interactor: SettingsBusinessLogic
    
    // MARK: - LifeCycle
    init(
        router: SettingsRoutingLogic,
        interactor: SettingsBusinessLogic
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
        view.addSubview(background)
        background.pinCenter(to: view)
        configureTitleView()
        configureRoomsButton()
        configureNotificationsButton()
        configureSoundsView()
        configureAboutScreenButton()
    }
    
    private func configureBackground() {
        view.addSubview(background)
        background.pinCenter(to: view)
    }
    
    private func configureTitleView() {
        view.addSubview(titleView)
        titleView.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        titleView.pinCenterX(to: view)
        titleView.setWidth(Double(view.frame.width) - 20)
        titleView.setHeight(70)
    }
    
    private func configureRoomsButton() {
        view.addSubview(roomsButton)
        roomsButton.setWidth(Double(view.frame.width) - 20)
        roomsButton.setHeight(70)
        roomsButton.pinCenterX(to: view)
        roomsButton.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        roomsButton.setFontSize(fontSize: 40)
        roomsButton.addTarget(self, action: #selector(roomsButtonTapped), for: .touchUpInside)
    }
    
    private func configureNotificationsButton() {
        view.addSubview(notificationsButton)
        notificationsButton.setWidth(Double(view.frame.width) - 20)
        notificationsButton.setHeight(70)
        notificationsButton.pinTop(to: titleView.bottomAnchor, 170)
        notificationsButton.pinCenterX(to: view)
        notificationsButton.setFontSize(fontSize: 25)
        notificationsButton.addTarget(self, action: #selector(notificationsButtonTapped), for: .touchUpInside)
    }
    
    private func configureSoundsView() {
        soundsSlider.isContinuous = true
        soundsSlider.maximumValue = 100.0
        soundsSlider.minimumValue = 0.0
        soundsSlider.minimumTrackTintColor = .black
        soundsSlider.setThumbImage(UIImage(named: "sliderThumb"), for: .normal)
        view.addSubview(soundsView)
        soundsView.image = UIImage(named: "nameplate")
        soundsView.setWidth(Double(view.frame.width) - 20)
        soundsView.setHeight(70)
        soundsView.pinCenterX(to: view)
        soundsView.pinTop(to: notificationsButton.bottomAnchor, 10)
        view.addSubview(soundsSlider)
        soundsSlider.setWidth(250)
        soundsSlider.pinCenterX(to: view)
        soundsSlider.pinCenterY(to: view)
        soundsSlider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
    }
    
    private func configureAboutScreenButton() {
        view.addSubview(aboutScreenButton)
        aboutScreenButton.setWidth(Double(view.frame.width) - 20)
        aboutScreenButton.setHeight(70)
        aboutScreenButton.pinCenterX(to: view)
        aboutScreenButton.pinTop(to: soundsView.bottomAnchor, 10)
        aboutScreenButton.setFontSize(fontSize: 25)
        aboutScreenButton.addTarget(self, action: #selector(showAboutScreen), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc
    private func notificationsButtonTapped() {
        if (!NotificationService.allowed) {
            notificationsButton.setSubtitle(subtitle: "OFF")
            NotificationService.allowed = false
            NotificationService.shared.removeScheduledNotifications()
        } else {
            notificationsButton.setSubtitle(subtitle: "ON")
            NotificationService.allowed = true
            NotificationService.shared.scheduleNotification(title: "Red Bed sleep clicker", body: "Don't forget to check your characters today", time: DateComponents(timeZone: .current, hour: 8, minute: 30), identifier: "identifier")
        }
    }
    
    @objc
    private func sliderValueChanged() {
        let volume = self.soundsSlider.value / 100
        interactor.loadValueChanged(SettingsModel.ValueChanged.Request(value: volume))
    }
    
    @objc
    private func showAboutScreen() {
        interactor.loadAbout(SettingsModel.About.Request())
    }
    
    @objc
    private func roomsButtonTapped() {
        interactor.loadRooms(SettingsModel.Rooms.Request())
    }
    
    // MARK: - DisplayLogic
    func displayStart(_ viewModel: Model.Start.ViewModel) {
        background = UIImageView(image: UIImage(named: viewModel.backgroundName))
        configureUI()
        soundsSlider.value = viewModel.volume * 100
    }
    
    func displayAbout(_ viewModel: Model.About.ViewModel) {
        router.routeToAbout()
    }
    
    func displayRooms(_ viewModel: Model.Rooms.ViewModel) {
        router.routeToRooms()
    }
}
