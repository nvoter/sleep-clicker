//
//  ModelProtocol.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 22.03.2024.
//

import UIKit

public protocol ModelProtocol {
    var name: String { get }
    var shopImage: UIImage { get }
    var price: Int { get }
}
