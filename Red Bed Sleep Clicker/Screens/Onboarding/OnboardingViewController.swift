//
//  OnboardingViewController.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 07.03.2024.
//

import UIKit

final class OnboardingViewController: UIViewController {
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }

    private func setupViews() {
        view.addSubview(textLabel)
        view.addSubview(subLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            subLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 5),
            subLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
    }

    func configure(with text: String, subtitle: String, backgroundColor: UIColor) {
        textLabel.text = text
        subLabel.text = subtitle
        view.backgroundColor = backgroundColor
    }
}
