//
//  Character.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 27.02.2024.
//

import UIKit

public enum Statement {
    case awake
    case asleep
    case dead
}

public final class PetModel: ModelProtocol {
    public var name: String
    public var hp: Int
    public var cheerfulness: Int
    public var statement: Statement
    public var sleepingImage: UIImage?
    public var awakeImage: UIImage?
    public var shopImage: UIImage
    public var price: Int
    public var sleepingTime: Int
    public var timer: Timer?
    
    public var image: UIImage? {
        if (statement == Statement.awake) {
            return awakeImage
        } else {
            return sleepingImage
        }
    }
    
    public init(
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
        shopImage = awakeImage!
        price = 1
        sleepingTime = 8
    }
    
    func startCheerfulnessTimer() {
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { [weak self] _ in
            self?.updateCheerfulness()
        }
    }
    
    func updateCheerfulness() {
        if statement == .awake {
            cheerfulness -= 10
            if (cheerfulness < 0) {
                cheerfulness = 0
                hp -= 20
            }
        } else {
            cheerfulness += 10
            if (cheerfulness > 100) {
                cheerfulness = 100
                hp -= 20
            }
        }
        if (hp == 0) {
            statement = .dead
        }
    }
}
