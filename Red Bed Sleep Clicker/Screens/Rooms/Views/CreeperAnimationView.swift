//
//  CreeperAnimationView.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 23.03.2024.
//

import UIKit

class CreeperAnimationView: UIView {
    private let creeperImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .clear
        creeperImageView.image = UIImage(named: "creeper")
        addSubview(creeperImageView)
        NSLayoutConstraint.activate([
            creeperImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            creeperImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            creeperImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            creeperImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8)
        ])
    }
    
    func startAnimation() {
        UIView.animate(withDuration: 5.0, animations: {
            self.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }) { [weak self] _ in
            self?.changeToExplosionView()
        }
    }
    
    private func changeToExplosionView() {
        Music.shared.startTNTSound()
        guard let superview = self.superview else { return }
        let explosionView = TotalLossExplosionView(frame: superview.bounds)
        superview.addSubview(explosionView)
        explosionView.explode()
        
        self.removeFromSuperview()
    }
}
