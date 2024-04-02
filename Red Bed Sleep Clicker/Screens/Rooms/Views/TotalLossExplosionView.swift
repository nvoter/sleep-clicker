//
//  TotalLossExplosionView.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 23.03.2024.
//

import UIKit

class TotalLossExplosionView: UIView {
    private var isExploding = false
    private var explosionProgress: CGFloat = 0.0
    private let explosionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
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
        explosionImageView.image = UIImage(named: "explosion")
        addSubview(explosionImageView)
        explosionImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            explosionImageView.topAnchor.constraint(equalTo: self.topAnchor),
            explosionImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            explosionImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            explosionImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    func explode() {
        UIView.animate(withDuration: 10.0, animations: {
            self.explosionImageView.alpha = 0
        }) { _ in
            self.removeFromSuperview()
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard isExploding else { return }
        
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(UIColor.red.cgColor)
            let center = CGPoint(x: rect.midX, y: rect.midY)
            let radius = max(rect.width, rect.height) * explosionProgress / 2
            context.addArc(center: center, radius: radius, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
            context.fillPath()
        }
    }
}
