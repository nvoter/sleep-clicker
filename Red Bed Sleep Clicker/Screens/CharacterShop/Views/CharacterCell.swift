//
//  CharacterCell.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 03.03.2024.
//

import UIKit

final class CharacterCell: UICollectionViewCell {
    static let characterCellId = "characterCell"
    var character: PetModel?
    let charactersImage: UIImageView = UIImageView()
    let charactersPrice: CurrencyLabel = CurrencyLabel()
    
    let charactersName: UILabel = {
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
    
    func configure(with model: PetModel) {
        let character = model
        charactersName.text = character.name
        charactersPrice.currencyLabel.text = "\(character.price)"
        charactersImage.image = character.shopImage
        self.character = character
    }
    
    func changeCharacterStatement() {
        guard let model = character else {
            return
        }
        charactersImage.image = model.shopImage
    }
    
    private func configure() {
        configureCharactersImage()
        configureCharactersName()
        configureCharactersPrice()
    }
    
    private func configureCharactersImage() {
        addSubview(charactersImage)
        charactersImage.pinCenterX(to: self)
        charactersImage.pinTop(to: self.topAnchor, 10)
        charactersImage.setWidth(140)
        charactersImage.setHeight(140)
    }
    
    private func configureCharactersName() {
        addSubview(charactersName)
        charactersName.pinCenterX(to: self)
        charactersName.pinTop(to: charactersImage.bottomAnchor, 10)
    }
    
    private func configureCharactersPrice() {
        addSubview(charactersPrice)
        charactersPrice.pinCenterX(to: self)
        charactersPrice.pinTop(to: charactersName.bottomAnchor)
        charactersPrice.fontSize(fontSize: 20)
        charactersPrice.currencyLabel.setWidth(40)
        charactersPrice.setWidth(100)
        charactersPrice.setHeight(30)
    }
}

