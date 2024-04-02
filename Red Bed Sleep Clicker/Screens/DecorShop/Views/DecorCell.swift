//
//  DecorCell.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 03.03.2024.
//

import UIKit

final class DecorCell: UICollectionViewCell {
    static let decorCellId = "decorCell"
    var background: BackgroundModel?
    let backgroundImage: UIImageView = UIImageView()
    let backgroundPrice: CurrencyLabel = CurrencyLabel()
    let backgroundName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Minecraft Ten", size: 20)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: BackgroundModel) {
        let background = model
        backgroundName.text = background.name
        backgroundPrice.currencyLabel.text = "\(background.price)"
        backgroundImage.image = background.shopImage
        self.background = background
    }
    
    func changeCharacterStatement() {
        guard let model = background else {
            return
        }
        backgroundImage.image = model.shopImage
    }
    
    private func configure() {
        configureBackgroundImage()
        configureBackgroundName()
        if (!(background?.isBought ?? true)) {
            configureBackgroundPrice()
        }
    }
    
    private func configureBackgroundImage() {
        addSubview(backgroundImage)
        backgroundImage.pinCenterX(to: self)
        backgroundImage.pinTop(to: self.topAnchor, 5)
        backgroundImage.setWidth(140)
        backgroundImage.setHeight(140)
    }
    
    private func configureBackgroundName() {
        addSubview(backgroundName)
        backgroundName.pinCenterX(to: self)
        backgroundName.pinTop(to: backgroundImage.bottomAnchor, 10)
    }
    
    private func configureBackgroundPrice() {
        addSubview(backgroundPrice)
        backgroundPrice.pinCenterX(to: self)
        backgroundPrice.pinTop(to: backgroundName.bottomAnchor)
        backgroundPrice.fontSize(fontSize: 20)
        backgroundPrice.currencyLabel.setWidth(40)
        backgroundPrice.setWidth(100)
        backgroundPrice.setHeight(30)
    }
}

