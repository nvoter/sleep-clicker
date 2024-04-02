//
//  BoostCell.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 20.04.2024.
//

import UIKit

final class BoostCell: UICollectionViewCell {
    static let boostCellId = "boostCell"
    var boost: BoostModel?
    let boostImage: UIImageView = UIImageView()
    let boostPrice: CurrencyLabel = CurrencyLabel()
    let boostName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Minecraft Ten", size: 30)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    let boostDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Minecraft Ten", size: 20)
        label.textAlignment = .left
        label.numberOfLines = 0
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
    
    func configure(with model: BoostModel) {
        let boost = model
        boostName.text = boost.name
        boostDescription.text = boost.description
        boostPrice.currencyLabel.text = "\(boost.price)"
        boostImage.image = boost.shopImage
        self.boost = boost
    }
    
    func changeCharacterStatement() {
        guard let model = boost else {
            return
        }
        boostImage.image = model.shopImage
    }
    
    private func configure() {
        configureBoostImage()
        configureBoostName()
        configureBoostDescription()
        configureBoostPrice()
    }
    
    private func configureBoostImage() {
        addSubview(boostImage)
        boostImage.pinCenterY(to: self)
        boostImage.pinLeft(to: self.leadingAnchor, 5)
        boostImage.setWidth(50)
        boostImage.setHeight(50)
        boostImage.layer.shadowColor = UIColor.black.cgColor
        boostImage.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        boostImage.layer.shadowOpacity = 1
    }
    
    private func configureBoostName() {
        addSubview(boostName)
        boostName.pinTop(to: boostImage.topAnchor)
        boostName.pinLeft(to: boostImage.trailingAnchor, 5)
        boostName.setWidth(UIScreen.main.bounds.width - 120)
    }
    
    private func configureBoostDescription() {
        addSubview(boostDescription)
        boostDescription.pinTop(to: boostName.bottomAnchor, 5)
        boostDescription.pinLeft(to: boostName.leadingAnchor)
        boostDescription.pinWidth(to: boostName.widthAnchor)
    }
    
    private func configureBoostPrice() {
        addSubview(boostPrice)
        boostPrice.pinRight(to: self.trailingAnchor, 10)
        boostPrice.pinCenterY(to: boostImage.centerYAnchor)
        boostPrice.fontSize(fontSize: 18)
        boostPrice.currencyLabel.setWidth(35)
        boostPrice.setWidth(90)
        boostPrice.setHeight(30)
    }
}
