//
//  CustomTitle.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 27.02.2024.
//

import UIKit

final class CustomTitle: UIImageView {
    // MARK: Constants
    private enum Constants {
        
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Minecraft Ten", size: 60)
        return label
    }()
    
    let subtitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Minecraft Ten", size: 20)
        return label
    }()
    
    init(titleText: String) {
        super.init(frame: CGRect())
        image = UIImage(named: "nameplate")
        titleLabel.text = titleText
        addSubview(titleLabel)
        configureTitle()
    }
    
    init(titleText: String, subtitleText: String) {
        super.init(frame: CGRect())
        image = UIImage(named: "nameplate")
        titleLabel.text = titleText
        addSubview(titleLabel)
        subtitle.text = subtitleText
        addSubview(subtitle)
        configureTitleWithSubtitle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTitle() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowOpacity = 1
        titleLabel.pinCenterX(to: self)
        titleLabel.pinCenterY(to: self, 5)
    }
    
    private func configureTitleWithSubtitle() {
        titleLabel.font = UIFont(name: "Minecraft Ten", size: 25)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowOpacity = 1
        titleLabel.pinCenterX(to: self)
        titleLabel.pinTop(to: self, 10)
        subtitle.pinCenterX(to: self)
        subtitle.pinTop(to: titleLabel.bottomAnchor, 3)
    }
}
