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
    
    private let titleLabel: UILabel = UILabel()
    private let subtitle: UILabel = UILabel()
    
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
        titleLabel.pinCenterX(to: self)
        titleLabel.pinCenterY(to: self)
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 40)
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowOpacity = 0.5
    }
    
    private func configureTitleWithSubtitle() {
        titleLabel.pinCenterX(to: self)
        titleLabel.pinTop(to: self.topAnchor, 5)
        subtitle.pinTop(to: titleLabel.bottomAnchor, 5)
        subtitle.pinCenterX(to: self)
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowOpacity = 0.5
    }
}
