//
//  CurrencyLabel.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 20.03.2024.
//

import UIKit

final class CurrencyLabel: UIImageView {
    enum Constants {
        
    }
    
    let currencyImage: UIImageView = UIImageView(image: UIImage(named: "currency"))
    var currencyLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Minecraft Ten", size: 30)
        return label
    }()
    
    init() {
        super.init(image: UIImage(named: "nameplate"))
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        configureCurrencyImage()
        configureCurrencyLabel()
        configureLayer()
        setHeight(50)
        setWidth(150)
    }
    
    private func configureCurrencyImage() {
        addSubview(currencyImage)
        currencyImage.setWidth(40)
        currencyImage.setHeight(40)
        currencyImage.pinLeft(to: self.leadingAnchor)
        currencyImage.pinCenterY(to: self)
        currencyImage.layer.shadowColor = UIColor.black.cgColor
        currencyImage.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        currencyImage.layer.shadowOpacity = 1
    }
    
    private func configureCurrencyLabel() {
        addSubview(currencyLabel)
        currencyLabel.setHeight(50)
        currencyLabel.setWidth(90)
        currencyLabel.pinCenterY(to: self, 3)
        currencyLabel.pinLeft(to: currencyImage.trailingAnchor, 5)
    }
    
    private func configureLayer() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowOpacity = 1
    }
    
    func fontSize(fontSize: CGFloat) {
        currencyLabel.font = currencyLabel.font.withSize(fontSize)
    }
}
