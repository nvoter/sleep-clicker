//
//  CharacterCell.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 03.03.2024.
//

import UIKit

class CharacterCell: UICollectionViewCell {
    static let characterCellId = "characterCell"
    
    var character: PetModel?
    
    let charactersName: UILabel = {
        return UILabel()
    }()
    
    let charactersImage: UIImageView = {
        return UIImageView()
    }()
    
    let charactersPrice: UILabel = {
        return UILabel()
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
        charactersPrice.text = "Price: \(character.price)"
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
        configureCharactersName()
        configureCharactersPrice()
        configureCharactersImage()
    }
    
    private func configureCharactersName() {
        addSubview(charactersName)
        charactersName.pinCenterX(to: self)
    }
    
    private func configureCharactersPrice() {
        addSubview(charactersPrice)
        
        charactersPrice.pinCenterX(to: self)
        charactersPrice.pinTop(to: charactersName.bottomAnchor)
    }
    
    private func configureCharactersImage() {
        addSubview(charactersImage)
        charactersImage.pinCenterX(to: self)
        charactersImage.pinTop(to: self.topAnchor, 15)
        charactersImage.setWidth(140)
        charactersImage.setHeight(140)
        charactersName.pinTop(to: charactersImage.bottomAnchor, 10)
    }
}

