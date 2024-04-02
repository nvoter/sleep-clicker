//
//  AboutAppViewController.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 15.03.2024.
//

import UIKit

final class AboutAppViewController: UIViewController,
                                    AboutAppDisplayLogic {
    // MARK: - Constants
    private enum Constants {
        static let fatalError: String = "init(coder:) has not been implemented"
    }
    
    // MARK: - Fields
    private var background: UIImageView = UIImageView(image: nil)
    private let nextButton: UIButton = UIButton()
    private let titleView: CustomTitle = CustomTitle(titleText: "About App")
    private let text: CustomTitle = CustomTitle(titleText: "")
    private let textLabel: UILabel = UILabel()
    private let router: AboutAppRoutingLogic
    private let interactor: AboutAppBusinessLogic
    
    // MARK: - LifeCycle
    init(
        router: AboutAppRoutingLogic,
        interactor: AboutAppBusinessLogic
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
        interactor.loadStart(Model.Start.Request())
    }
    
    // MARK: - Configuration
    private func configureUI() {
        configureBackground()
        configureNextButton()
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
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.backgroundColor = .clear
        nextButton.titleLabel?.font = UIFont(name: "MinecraftTenfontcyrillic", size: 20)
        nextButton.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        nextButton.pinRight(to: view.trailingAnchor, 10)
        nextButton.addTarget(self, action: #selector(wasTapped), for: .touchUpInside)
    }
    
    private func configureTitle() {
        view.addSubview(titleView)
        titleView.setWidth(Double(view.frame.width - 20))
        titleView.setHeight(70)
        titleView.pinCenterX(to: view)
        titleView.pinTop(to: nextButton.bottomAnchor, 5)
    }
    
    private func configureText() {
        view.addSubview(text)
        view.addSubview(textLabel)
        textLabel.text = "RedBed Sleep Clicker is a game in which you can control the sleep of more and more minecraft characters by tap"
        textLabel.font = UIFont(name: "Minecraft Ten", size: 25)
        textLabel.textAlignment = .left
        textLabel.numberOfLines = 0
        textLabel.clipsToBounds = true
        text.setWidth(Double(view.frame.width - 20))
        text.setHeight(150)
        text.pinCenter(to: view)
        textLabel.setWidth(Double(view.frame.width - 40))
        textLabel.setHeight(130)
        textLabel.pinCenter(to: text)
    }
    
    // MARK: - Actions
    @objc
    private func wasTapped() {
        interactor.loadTutorial(AboutAppModel.Tutorial.Request())
    }
    
    // MARK: - DisplayLogic
    func displayStart(_ viewModel: Model.Start.ViewModel) {
        background = UIImageView(image: UIImage(named: viewModel.backgroundName))
        self.navigationItem.hidesBackButton = false
        configureUI()
    }
    
    func displayTutorial(_ viewModel: Model.Tutorial.ViewModel) {
        router.routeToTutorial()
    }
}
