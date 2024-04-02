//
//  CharacterShopViewController.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 03.03.2024.
//

import UIKit

final class CharacterShopViewController: UIViewController,
                                         CharacterShopDisplayLogic {
    // MARK: - Constants
    private enum Constants {
        static let fatalError: String = "init(coder:) has not been implemented"
        static let titleViewText: String = "SHOP"
        static let height: CGFloat = 70
        static let backButtonText: String = "BACK"
        static let collectionPinConstant: CGFloat = 100
        static let collectionHeight: CGFloat = 560
    }
    
    // MARK: - Fields
    lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (view.frame.width - 30) / 2, height: (view.frame.height - 40) / 4)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        return collection
    }()
    
    private var background: UIImageView = UIImageView(image: nil)
    private let titleView: CustomTitle = CustomTitle(titleText: Constants.titleViewText)
    private let backButton: CustomButton = CustomButton(title: Constants.backButtonText)
    private var balanceLabel: CurrencyLabel = CurrencyLabel()
    private let router: CharacterShopRoutingLogic
    private let interactor: (CharacterShopBusinessLogic & CharacterShopDataSource)
    
    // MARK: - LifeCycle
    init(
        router: CharacterShopRoutingLogic,
        interactor: (CharacterShopBusinessLogic & CharacterShopDataSource)
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
        collection.register(CharacterCell.self, forCellWithReuseIdentifier: CharacterCell.characterCellId)
        collection.layer.masksToBounds = true
        view.addSubview(collection)
        collection.pinCenterX(to: view)
        collection.pinTop(to: titleView.bottomAnchor, Constants.collectionPinConstant)
        collection.setWidth(Double(view.frame.width) - 20)
        collection.setHeight(Constants.collectionHeight)
    }
    // MARK: - Actions
    @objc
    private func backWasTapped() {
        interactor.loadShop(CharacterShopModel.Back.Request())
    }
    
    // MARK: - DisplayLogic
    func displayStart(_ viewModel: Model.Start.ViewModel) {
        collection.reloadData()
        balanceLabel.currencyLabel.text = viewModel.balanceLabel
        background = UIImageView(image: UIImage(named: viewModel.backgroundName))
        configureUI()
    }
    
    func displayPetPurchase(_ viewModel: Model.PetPurchase.ViewModel) {
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

extension CharacterShopViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        interactor.characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCell.characterCellId, for: indexPath)
        guard let characterCell = cell as? CharacterCell else {
            return cell
        }
        characterCell.configure(
            with: interactor.characters[indexPath.row]
        )
        characterCell.backgroundColor = .white
        return characterCell
    }
}

extension CharacterShopViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let character = interactor.characters[indexPath.row]
        interactor.loadPetPurchase(CharacterShopModel.PetPurchase.Request(character: character))
    }
}
