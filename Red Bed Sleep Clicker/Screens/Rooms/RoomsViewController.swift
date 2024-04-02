//
//  RoomsViewController.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 27.02.2024.
//

import UIKit

final class RoomsViewController: UIViewController,
                                 RoomsDisplayLogic {
    // MARK: - Constants
    private enum Constants {
        static let fatalError: String = "init(coder:) has not been implemented"
        static let height: CGFloat = 70
        static let titleViewText: String = "ROOMS"
        static let settingsButtonText: String = "SETTINGS"
        static let shopButtonText: String = "SHOP"
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
    private let titleView: CustomTitle = CustomTitle(titleText: Constants.titleViewText)
    private let settingsButton: CustomButton = CustomButton(title: Constants.settingsButtonText)
    private let shopButton: CustomButton = CustomButton(title: Constants.shopButtonText)
    private var background: UIImageView = UIImageView(image: nil)
    private let helpButton: CustomButton = CustomButton(title: "?")
    private var balanceLabel: CurrencyLabel = CurrencyLabel()
    private var changePageButton: UIButton = UIButton()
    private var currentPageIndex = 0
    private let itemsPerPage = 4
    private var creeperAnimationView: CreeperAnimationView?
    private let idleTime: TimeInterval = 30.0
    private var idleTimer: Timer?
    private let router: RoomsRoutingLogic
    private let interactor: (RoomsBusinessLogic & RoomsDataSource)
    
    // MARK: - LifeCycle
    init(
        router: RoomsRoutingLogic,
        interactor: (RoomsBusinessLogic & RoomsDataSource)
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        interactor.loadReload(RoomsModel.Reload.Request())
        startCheerfulnessTimer()
    }
    
    // MARK: - Configuration
    private func configureUI() {
        configureBackground()
        configureTitle()
        configureSettingsButton()
        configureShopButton()
        configureHelpButton()
        configureBalanceLabel()
        configureChangePageButton()
        configureCollection()
        resetIdleTimer()
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
    
    private func configureShopButton() {
        view.addSubview(shopButton)
        shopButton.setWidth(Double(view.frame.width - 25) / 2)
        shopButton.setHeight(Constants.height)
        shopButton.pinRight(to: view.centerXAnchor, 5)
        shopButton.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        shopButton.setFontSize(fontSize: 40)
        shopButton.addTarget(self, action: #selector(shopWasTapped), for: .touchUpInside)
    }
    
    private func configureHelpButton() {
        view.addSubview(helpButton)
        helpButton.pinLeft(to: titleView.leadingAnchor)
        helpButton.pinTop(to: titleView.bottomAnchor, 10)
        helpButton.setWidth(50)
        helpButton.setHeight(50)
        helpButton.addTarget(self, action: #selector(showTutorial), for: .touchUpInside)
    }
    
    private func configureBalanceLabel() {
        view.addSubview(balanceLabel)
        balanceLabel.pinLeft(to: helpButton.trailingAnchor, 5)
        balanceLabel.pinCenterY(to: helpButton)
    }
    
    private func configureChangePageButton() {
        changePageButton.setBackgroundImage(UIImage(named: "nameplate"), for: .normal)
        changePageButton.setTitle("->", for: .normal)
        changePageButton.titleLabel?.font = UIFont(name: "MinecraftTenfontcyrillic", size: 25)
        changePageButton.setTitleColor(UIColor.black, for: .normal)
        changePageButton.layer.shadowColor = UIColor.black.cgColor
        changePageButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        changePageButton.layer.shadowOpacity = 1
        view.addSubview(changePageButton)
        changePageButton.pinHeight(to: helpButton)
        changePageButton.setWidth(70)
        changePageButton.pinCenterY(to: helpButton)
        changePageButton.pinRight(to: titleView.trailingAnchor)
        changePageButton.addTarget(self, action: #selector(changePage), for: .touchUpInside)
    }
    
    private func configureCollection() {
        collection.dataSource = self
        collection.delegate = self
        collection.register(RoomCell.self, forCellWithReuseIdentifier: RoomCell.roomCellId)
        collection.layer.masksToBounds = true
        view.addSubview(collection)
        collection.setWidth(Double(view.frame.width) - 20)
        collection.setHeight(Double(view.frame.height) - 400)
        collection.pinCenterX(to: view)
        collection.pinTop(to: helpButton.bottomAnchor, 50)
    }
    
    private func resetIdleTimer() {
        idleTimer?.invalidate()
        idleTimer = Timer.scheduledTimer(timeInterval: idleTime, target: self, selector: #selector(checkIdleTime), userInfo: nil, repeats: false)
    }
    
    // MARK: - Actions
    @objc
    private func settingsWasTapped() {
        interactor.loadSettings(RoomsModel.Settings.Request())
    }
    
    @objc
    private func shopWasTapped() {
        interactor.loadShop(RoomsModel.Shop.Request())
    }
    
    @objc
    private func showTutorial() {
        interactor.loadTutorial(RoomsModel.Tutorial.Request())
    }
    
    @objc
    private func changePage() {
        if (changePageButton.titleLabel?.text == "->") {
            changePageButton.setTitle("<-", for: .normal)
        } else {
            changePageButton.setTitle("->", for: .normal)
        }
        if (interactor.characters.isEmpty) {
            currentPageIndex = 0
        } else {
            currentPageIndex = (currentPageIndex + itemsPerPage) % interactor.characters.count
        }
        collection.reloadData()
    }
    
    @objc
    private func checkIdleTime() {
        creeperAnimationView = CreeperAnimationView(frame: view.bounds)
        if let creeperView = creeperAnimationView {
            view.addSubview(creeperView)
            creeperView.startAnimation()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        resetIdleTimer()
    }
    
    func updateCheerfulness() {
        for index in 0..<interactor.characters.count {
            let character = interactor.characters[index]
            character.updateCheerfulness()
            let indexPath = IndexPath(item: index - currentPageIndex, section: 0)
            if let cell = collection.cellForItem(at: indexPath) as? RoomCell {
                cell.configure(with: interactor.characters[index])
            }
        }
    }
    
    func startCheerfulnessTimer() {
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { [weak self] _ in
            self?.updateCheerfulness()
            DispatchQueue.main.async {
                self?.collection.reloadData()
            }
        }
    }
    
    // MARK: - RoomsDisplayLogic
    func displayStart(_ viewModel: Model.Start.ViewModel) {
        collection.reloadData()
        background = UIImageView(image: UIImage(named: viewModel.backgroundName))
        balanceLabel.currencyLabel.text = viewModel.balanceLabel
        configureUI()
    }
    
    func displayPetTap(_ viewModel: Model.PetTap.ViewModel) {
        collection.reloadData()
        balanceLabel.currencyLabel.text = viewModel.balanceLabel
    }
    
    func displaySettings(_ viewModel: Model.Settings.ViewModel) {
        router.routeToSettings()
    }
    
    func displayShop(_ viewModel: Model.Shop.ViewModel) {
        router.routeToShop()
        collection.reloadData()
    }
    
    func displayTutorial(_ viewModel: Model.Tutorial.ViewModel) {
        router.routeToTutorial()
    }
    
    func displayReload(_ viewModel: Model.Reload.ViewModel) {
        collection.reloadData()
    }
}

extension RoomsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let remainingItems = interactor.characters.count - currentPageIndex
        return min(itemsPerPage, remainingItems)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RoomCell.roomCellId, for: indexPath)
        guard let roomCell = cell as? RoomCell else {
            return cell
        }
        let characterIndex = currentPageIndex + indexPath.row
        if characterIndex < interactor.characters.count {
            roomCell.configure(with: interactor.characters[characterIndex])
            roomCell.backgroundColor = .white
        }
        return roomCell
    }
}

extension RoomsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let roomCell = collectionView.cellForItem(at: indexPath) as? RoomCell else {
            return
        }
        roomCell.changeCharacterStatement()
        if (interactor.characters[indexPath.row].statement == Statement.dead) {
            collectionView.deleteItems(at: [indexPath])
        }
        resetIdleTimer()
        interactor.loadPetTap(RoomsModel.PetTap.Request(index: indexPath.row))
    }
}
