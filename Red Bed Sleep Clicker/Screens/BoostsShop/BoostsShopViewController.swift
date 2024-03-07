//
//  BoostsShopViewController.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 06.03.2024.
//

import UIKit

final class BoostsShopViewController: UIViewController,
                                      BoostsShopDisplayLogic {
    // MARK: - Constants
    private enum Constants {
        static let fatalError: String = "init(coder:) has not been implemented"
        
        static let backgroundImageName: String = "background"
        
        static let titleViewText: String = "SHOP"
        
        static let width: CGFloat = 360
        static let height: CGFloat = 70
        
        static let backButtonText: String = "BACK"
    }
    
    // MARK: - Fields
    private let background: UIImageView = UIImageView(image: UIImage(named: Constants.backgroundImageName))
    private let titleView: CustomTitle = CustomTitle(titleText: Constants.titleViewText)
    private let backButton: CustomButton = CustomButton(title: Constants.backButtonText)
    
    private let router: BoostsShopRoutingLogic
    private let interactor: BoostsShopBusinessLogic
    
    // MARK: - LifeCycle
    init(
        router: BoostsShopRoutingLogic,
        interactor: BoostsShopBusinessLogic
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
        configureUI()
        interactor.loadStart(Model.Start.Request())
    }
    
    // MARK: - Configuration
    private func configureUI() {
        configureBackground()
        configureTitle()
        configureBackButton()
    }
    
    private func configureBackground() {
        view.addSubview(background)
        
        background.pinCenter(to: view)
    }
    
    private func configureTitle() {
        view.addSubview(titleView)
        
        titleView.setWidth(Constants.width)
        titleView.setHeight(Constants.height)
        titleView.pinCenterX(to: view)
        titleView.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
    }
    
    private func configureBackButton() {
        view.addSubview(backButton)
        
        backButton.setWidth(Constants.width)
        backButton.setHeight(Constants.height)
        backButton.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        backButton.pinCenterX(to: view)
        
        backButton.addTarget(self, action: #selector(backWasTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc
    private func backWasTapped() {
        router.routeToShop()
    }
    
    // MARK: - DisplayLogic
    func displayStart(_ viewModel: Model.Start.ViewModel) {
        
    }
}

