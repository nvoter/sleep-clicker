//
//  CustomButton.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 27.02.2024.
//

import UIKit

final class CustomButton: UIButton {
    private enum Constants {
    }
    
    private let buttonLabel: UILabel = UILabel()
    private let buttonSubtitleLabel: UILabel = UILabel()

    
    init(title: String) {
        super.init(frame: CGRect())
        buttonLabel.text = title
        configureTitle()
        layoutOnlyTitle()
    }
    
    init(title: String, subtitle: String) {
        super.init(frame: CGRect())
        buttonLabel.text = title
        buttonSubtitleLabel.text = subtitle
        configureTitle()
        configureSubtitle()
        layoutWithSubtitle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSubtitle(subtitle: String) {
        buttonSubtitleLabel.text = subtitle
    }
    
    func setFontSize(fontSize: CGFloat) {
        buttonLabel.font = UIFont(name: "Minecraft Ten", size: fontSize)
    }
    
    private func configureTitle() {
        addSubview(buttonLabel)
        setBackgroundImage(UIImage(named: "nameplate"), for: .normal)
        buttonLabel.font = UIFont(name: "Minecraft Ten", size: 40)
    }
    
    private func configureSubtitle() {
        addSubview(buttonSubtitleLabel)
        setBackgroundImage(UIImage(named: "nameplate"), for: .normal)
        buttonSubtitleLabel.font = UIFont(name: "Minecraft Ten", size: 25)
    }
    
    private func layoutOnlyTitle() {
        buttonLabel.pinCenterX(to: self)
        buttonLabel.pinCenterY(to: self)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowOpacity = 1
    }
    
    private func layoutWithSubtitle() {
        buttonLabel.pinCenterX(to: self)
        buttonLabel.pinTop(to: self.topAnchor, 10)
        buttonSubtitleLabel.pinCenterX(to: self)
        buttonSubtitleLabel.pinTop(to: buttonLabel.bottomAnchor)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowOpacity = 1
    }
}
