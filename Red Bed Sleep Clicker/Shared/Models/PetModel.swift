//
//  Character.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 27.02.2024.
//

import UIKit

#warning("TODO: make it structure")

enum Statement {
    case awake
    case exhausted
    case asleep
    case overslept
    case dead
}

final class PetModel {
    var name: String
    var hp: Int
    var cheerfulness: Int
    var statement: Statement
    var sleepingImage: UIImage?
    var awakeImage: UIImage?
    var shopImage: UIImage?
    var price: Int
    var sleepingTime: TimeInterval
    
    var image: UIImage? {
        if (statement == Statement.awake || statement == Statement.exhausted) {
            return awakeImage
        } else {
            return sleepingImage
        }
    }
    
    init(
        name: String,
        hp: Int = 100,
        cheerfulness: Int = 100,
        sleepingImage: UIImage?,
        awakeImage: UIImage?
    ) {
        self.name = name
        self.hp = hp
        self.cheerfulness = cheerfulness
        statement = Statement.awake
        self.sleepingImage = sleepingImage
        self.awakeImage = awakeImage
        shopImage = awakeImage
        price = 1
        sleepingTime = 8
    }
}
