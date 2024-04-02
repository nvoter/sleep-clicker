//
//  RoomCell.swift
//  Sleep Clicker
//
//  Created by Анастасия on 27.02.2024.
//

import UIKit

class RoomCell: UICollectionViewCell {
    // MARK: - Constants
    enum Constants {
        
    }
    
    // MARK: - Fields
    static let roomCellId = "roomCell"
    
    var character: PetModel?
    
    let charactersImage: UIImageView =  UIImageView()
    let charactersHP: UIImageView = UIImageView()
    let charactersCheerfulness: UILabel = {
        let label = UILabel()
        label.textColor = .systemIndigo
        return label
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    func configure(with model: PetModel) {
        let character = model
        charactersHP.image = UIImage(named: "hp\(character.hp / 20)")
        switch (character.cheerfulness / 20) {
        case 0:
            charactersCheerfulness.text = "z"
            charactersCheerfulness.textColor = .red
        case 1:
            charactersCheerfulness.text = "z"
        case 2:
            charactersCheerfulness.text = "zz"
        case 3:
            charactersCheerfulness.text = "zzz"
        case 4:
            charactersCheerfulness.text = "zzzz"
        case 5:
            charactersCheerfulness.text = "zzzzz"
        default:
            charactersCheerfulness.text = "z"
        }
        charactersImage.image = character.image
        self.character = character
    }
    
    private func configure() {
        configureCharactersImage()
        configureCharactersHP()
        configureCharactersCheerfulness()
    }
    
    private func configureCharactersImage() {
        addSubview(charactersImage)
        charactersImage.pinCenterX(to: self)
        charactersImage.pinTop(to: self.topAnchor, 10)
        charactersImage.setWidth(145)
        charactersImage.setHeight(130)
    }
    
    private func configureCharactersHP() {
        addSubview(charactersHP)
        charactersHP.pinLeft(to: self, 10)
        charactersHP.pinTop(to: charactersImage.bottomAnchor, 10)
    }
    
    private func configureCharactersCheerfulness() {
        addSubview(charactersCheerfulness)
        charactersCheerfulness.font = UIFont(name: "Minecraft Ten", size: 30)
        charactersCheerfulness.pinLeft(to: self, 10)
        charactersCheerfulness.pinTop(to: charactersHP.bottomAnchor, 5)
        charactersCheerfulness.pinWidth(to: charactersHP.widthAnchor)
    }
    
    // MARK: - Actions
    func changeCharacterStatement() {
        guard let model = character else {
            return
        }
        if (model.statement == Statement.awake) {
            model.statement = Statement.asleep
            charactersImage.image = model.sleepingImage
        } else if (model.statement == Statement.asleep) {
            model.statement = Statement.awake
            charactersImage.image = model.awakeImage
        } else { return }
    }
}
