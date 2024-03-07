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
    let background: UIImageView = UIImageView(image: UIImage(named: "background"))
    let titleView: CustomTitle = CustomTitle(titleText: "SETTINGS")
    let roomsButton: CustomButton = CustomButton(title: "ROOMS")
    var valueChanged: ((Double) -> Void)?
    let notificationsButton: CustomButton = CustomButton(title: "NOTIFICATIONS", subtitle: "ON")
    private let soundsView: UIImageView = UIImageView(image: UIImage(named: "nameplate"))
    private let soundsLabel: UILabel = UILabel()
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
        titleView.setWidth(360)
        titleView.setHeight(70)
    }
    
    private func configureRoomsButton() {
        view.addSubview(roomsButton)
        
        roomsButton.setWidth(360)
        roomsButton.setHeight(70)
        roomsButton.pinCenterX(to: view)
        roomsButton.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        roomsButton.setFontSize(fontSize: 40)
        
        roomsButton.addTarget(self, action: #selector(roomsButtonTapped), for: .touchUpInside)
    }
    
    private func configureNotificationsButton() {
        view.addSubview(notificationsButton)
        
        notificationsButton.setWidth(360)
        notificationsButton.setHeight(70)
        notificationsButton.pinTop(to: titleView.bottomAnchor, 170)
        notificationsButton.pinCenterX(to: view)
        notificationsButton.setFontSize(fontSize: 25)
        
        notificationsButton.addTarget(self, action: #selector(notificationsButtonTapped), for: .touchUpInside)
    }
    
    private func configureSoundsView() {
        soundsSlider.maximumValue = 100.0
        soundsSlider.minimumValue = 0.0
        soundsSlider.value = 100.0
        soundsSlider.minimumTrackTintColor = .black
        soundsSlider.setThumbImage(UIImage(named: "sliderThumb"), for: .normal)
        
        view.addSubview(soundsView)
        
        soundsView.image = UIImage(named: "nameplate")
        soundsView.setWidth(360)
        soundsView.setHeight(70)
        soundsView.pinCenterX(to: view)
        soundsView.pinTop(to: notificationsButton.bottomAnchor, 10)
        
        view.addSubview(soundsLabel)
        
        soundsLabel.text = "SOUNDS"
        soundsLabel.font = UIFont.boldSystemFont(ofSize: 25)
        soundsLabel.pinCenterX(to: view)
        soundsLabel.pinTop(to: soundsView.topAnchor, 5)
        
        view.addSubview(soundsSlider)

        
        soundsSlider.setWidth(250)
        soundsSlider.pinCenterX(to: view)
        soundsSlider.pinCenterY(to: view, 35)
        soundsSlider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
    }
    
    private func configureAboutScreenButton() {
        view.addSubview(aboutScreenButton)
        
        aboutScreenButton.setWidth(360)
        aboutScreenButton.setHeight(70)
        aboutScreenButton.pinCenterX(to: view)
        aboutScreenButton.pinTop(to: soundsView.bottomAnchor, 10)
        aboutScreenButton.setFontSize(fontSize: 25)
        aboutScreenButton.addTarget(self, action: #selector(showAboutScreen), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc
    private func notificationsButtonTapped() {
        if (notificationsAllowed) {
            notificationsButton.setSubtitle(subtitle: "OFF")
            notificationsAllowed = false
        } else {
            notificationsButton.setSubtitle(subtitle: "ON")
            notificationsAllowed = true
        }
    }
    
    @objc
    private func sliderValueChanged() {
        let volume = self.soundsSlider.value / 100
        Music.player?.setVolume(volume, fadeDuration: .infinity)
    }
    
    @objc
    private func showAboutScreen() {
        interactor.loadAbout(SettingsModel.About.Request())
    }
    
    @objc
    private func roomsButtonTapped() {
        navigationController?.popViewController(animated: false)
    }
    
    // MARK: - DisplayLogic
    func displayStart(_ viewModel: Model.Start.ViewModel) {
        configureUI()
    }
    
    func displayAbout(_ viewModel: Model.About.ViewModel) {
        router.routeToAbout()
    }
    
    func displayRooms(_ viewModel: Model.Rooms.ViewModel) {
        router.routeToRooms()
    }
}
