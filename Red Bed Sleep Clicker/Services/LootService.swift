//
//  LootService.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 22.03.2024.
//

import Foundation
import UIKit

protocol LootingLogic {
    func getCharacters() -> [PetModel]
    func getBackgrounds() -> [BackgroundModel]
    func saveItem(item: ModelProtocol)
    func sellCharacter(index: Int)
}

public final class LootService: LootingLogic {
    public var userCharacters: [PetModel] = [
        PetModel(
            name: "Steve",
            sleepingImage: UIImage(named: "sleeping Steve"),
            awakeImage: UIImage(named: "awake Steve"))
    ]
    public var userBackgrounds: [BackgroundModel] = []
    
    private init() { }
    
    public static let shared = LootService()
    
    public func getCharacters() -> [PetModel] {
        return userCharacters
    }
    
    public func getBackgrounds() -> [BackgroundModel] {
        return userBackgrounds
    }
    
    public func saveItem(item: ModelProtocol) {
        if (item is PetModel) {
            userCharacters.append(item as! PetModel)
        } else {
            guard var background = item as? BackgroundModel else { return }
            background.isBought = true
            userBackgrounds.append(background)
        }
    }
    
    public func sellCharacter(index: Int) {
        userCharacters.remove(at: index)
    }
}
