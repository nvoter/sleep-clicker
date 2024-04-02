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
        
        static let height: CGFloat = 70
        
        static let backButtonText: String = "BACK"
    }
    
    // MARK: - Fields
    lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width - 10, height: view.frame.height / 12)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        return collection
    }()
    
    private var background: UIImageView = UIImageView(image: nil)
    private let titleView: CustomTitle = CustomTitle(titleText: Constants.titleViewText)
    private let backButton: CustomButton = CustomButton(title: Constants.backButtonText)
    private let balanceLabel: CurrencyLabel = CurrencyLabel()
    private let router: BoostsShopRoutingLogic
    private let interactor: (BoostsShopBusinessLogic & BoostsShopDataSource)
    
    // MARK: - LifeCycle
    init(
        router: BoostsShopRoutingLogic,
        interactor: (BoostsShopBusinessLogic & BoostsShopDataSource)
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
        configureBackButton()
        configureBalanceLabel()
        configureCollection()
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
    
    private func configureBackButton() {
        view.addSubview(backButton)
        backButton.setWidth(Double(view.frame.width) - 20)
        backButton.setHeight(Constants.height)
        backButton.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        backButton.pinCenterX(to: view)
        backButton.addTarget(self, action: #selector(backWasTapped), for: .touchUpInside)
    }
    
    private func configureBalanceLabel() {
        view.addSubview(balanceLabel)
        balanceLabel.pinTop(to: titleView.bottomAnchor, 10)
        balanceLabel.pinCenterX(to: view)
    }
    
    private func configureCollection() {
        collection.dataSource = self
        collection.delegate = self
        collection.register(BoostCell.self, forCellWithReuseIdentifier: BoostCell.boostCellId)
        collection.layer.masksToBounds = true
        view.addSubview(collection)
        collection.pinCenterX(to: view)
        collection.pinTop(to: titleView.bottomAnchor, 100)
        collection.setWidth(Double(view.frame.width) - 20)
        collection.setHeight(560)
    }
    
    // MARK: - Actions
    @objc
    private func backWasTapped() {
        interactor.loadShop(BoostsShopModel.Back.Request())
    }
    
    // MARK: - DisplayLogic
    func displayStart(_ viewModel: Model.Start.ViewModel) {
        collection.reloadData()
        background = UIImageView(image: UIImage(named: viewModel.backgroundName))
        configureUI()
        balanceLabel.currencyLabel.text = viewModel.balanceLabel
    }
    
    func displayBoostPurchase(_ viewModel: Model.BoostPurchase.ViewModel) {
        if (viewModel.status == false) {
//            UIView.animate(withDuration: 0.5, animations: {
//                self.balanceLabel.textColor = .red
//                self.balanceLabel.layoutIfNeeded()
//            }, completion: { _ in
//                self.balanceLabel.textColor = .black
//                self.balanceLabel.layoutIfNeeded()
//            })
        }
        balanceLabel.currencyLabel.text = viewModel.balanceLabel
    }
    
    func displayShop(_ viewModel: Model.Back.ViewModel) {
        router.routeToShop()
    }
}

extension BoostsShopViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        interactor.boosts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BoostCell.boostCellId, for: indexPath)
        guard let boostCell = cell as? BoostCell else {
            return cell
        }
        boostCell.configure(
            with: interactor.boosts[indexPath.row]
        )
        boostCell.backgroundColor = .white
        return boostCell
    }
}

extension BoostsShopViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let boost = interactor.boosts[indexPath.row]
        interactor.loadBoostPurchase(BoostsShopModel.BoostPurchase.Request(boost: boost))
    }
}
