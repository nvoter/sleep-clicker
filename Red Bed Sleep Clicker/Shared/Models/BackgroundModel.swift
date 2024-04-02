//
//  BackgroundModel.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 08.03.2024.
//

import UIKit

public struct BackgroundModel: ModelProtocol {
    public var shopImage: UIImage
    public var name: String
    public var price: Int
    public var isBought: Bool = false
    public init(shopImage: UIImage, name: String, price: Int, isBought: Bool) {
        self.shopImage = shopImage
        self.name = name
        self.price = price
        self.isBought = isBought
    }
}
