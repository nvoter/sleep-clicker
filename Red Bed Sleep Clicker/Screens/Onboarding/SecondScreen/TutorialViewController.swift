//
//  TutorialViewController.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 22.04.2024.
//

import UIKit

final class TutorialViewController: UIViewController,
                            TutorialDisplayLogic {
    // MARK: - Constants
    private enum Constants {
        static let fatalError: String = "init(coder:) has not been implemented"
    }
    
    // MARK: - Fields
    var hidesNextButton: Bool = true
    private let defaults = UserDefaults.standard
    private var background: UIImageView = UIImageView(image: nil)
    private let nextButton: UIButton = UIButton()
    private let titleView: CustomTitle = CustomTitle(titleText: "tutorial")
    private let text: CustomTitle = CustomTitle(titleText: "")
    private let textLabel: UILabel = UILabel()
    private let router: TutorialRoutingLogic
    private let interactor: TutorialBusinessLogic
    
    // MARK: - LifeCycle
    init(
        router: TutorialRoutingLogic,
        interactor: TutorialBusinessLogic
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
        if (!hidesNextButton) {
            configureNextButton()
        }
        configureTitle()
        configureText()
    }
    
    private func configureBackground() {
        view.addSubview(background)
        background.pinCenter(to: view)
    }
    
    private func configureNextButton() {
        view.addSubview(nextButton)
        nextButton.setTitle("Next >", for: .normal)
        nextButton.backgroundColor = .clear
        nextButton.titleLabel?.font = UIFont(name: "MinecraftTenfontcyrillic", size: 20)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        nextButton.pinRight(to: view.trailingAnchor, 10)
        nextButton.addTarget(self, action: #selector(wasTapped), for: .touchUpInside)
    }
    
    private func configureTitle() {
        view.addSubview(titleView)
        titleView.setWidth(Double(view.frame.width - 20))
        titleView.setHeight(70)
        titleView.pinCenterX(to: view)
        if (!hidesNextButton) {
            titleView.pinTop(to: nextButton.bottomAnchor, 5)
        } else {
            titleView.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        }
        
    }
    
    private func configureText() {
        view.addSubview(text)
        view.addSubview(textLabel)
        textLabel.text = "You should buy your first character in shop to start playing\n\nClick on a character to put him to sleep or wake him up and earn currency\n\nCheck characters' hp and cheerfulness to prevent them from dying"
        textLabel.font = UIFont(name: "Minecraft Ten", size: 25)
        textLabel.textAlignment = .left
        textLabel.numberOfLines = 0
        textLabel.clipsToBounds = true
        text.setWidth(Double(view.frame.width - 20))
        text.setHeight(300)
        text.pinCenter(to: view)
        textLabel.setWidth(Double(view.frame.width - 40))
        textLabel.setHeight(280)
        textLabel.pinCenter(to: text)
    }
    
    // MARK: - Actions
    @objc
    private func wasTapped() {
        interactor.loadRooms(TutorialModel.Rooms.Request())
    }
    
    // MARK: - DisplayLogic
    func displayStart(_ viewModel: Model.Start.ViewModel) {
        background = UIImageView(image: UIImage(named: viewModel.backgroundName))
        configureUI()
    }
    
    func displayRooms(_ viewModel: Model.Rooms.ViewModel) {
        router.routeToRooms()
    }
}

