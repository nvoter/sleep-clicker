//
//  LootServiceTests.swift
//  Tests
//
//  Created by Анастасия on 23.03.2024.
//

import Red_Bed_Sleep_Clicker

import XCTest

final class LootServiceTests: XCTestCase {
    let mockCharacter1 = PetModel(name: "Mock Hero 1", hp: 100, cheerfulness: 100, sleepingImage: UIImage(), awakeImage: UIImage())
    let mockCharacter2 = PetModel(name: "Mock Hero 2", hp: 100, cheerfulness: 100, sleepingImage: UIImage(), awakeImage: UIImage())
    let mockBackground1 = BackgroundModel(shopImage: UIImage(), name: "Mock Background 1", price: 50, isBought: false)
    let mockBackground2 = BackgroundModel(shopImage: UIImage(), name: "Mock Background 2", price: 100, isBought: false)
    var lootService: LootService!
    
    override func setUp() {
        super.setUp()
        lootService = LootService.shared
        lootService.userCharacters.removeAll()
        lootService.userBackgrounds.removeAll()
        lootService.saveItem(item: mockCharacter1)
        lootService.saveItem(item: mockCharacter2)
        lootService.saveItem(item: mockBackground1)
        lootService.saveItem(item: mockBackground2)
    }
    
    override func tearDown() {
        lootService = nil
        super.tearDown()
    }
    
    func testGetCharacters() {
        let characters = lootService.getCharacters()
        XCTAssertEqual(characters.count, 2, "Должно быть 2 персонажа.")
    }
    
    func testGetBackgrounds() {
        let backgrounds = lootService.getBackgrounds()
        XCTAssertEqual(backgrounds.count, 2, "Должно быть 2 фона.")
    }
    
    func testSaveItem() {
        let newCharacter = PetModel(name: "Test Hero", hp: 100, cheerfulness: 100, sleepingImage: UIImage(), awakeImage: UIImage())
        lootService.saveItem(item: newCharacter)
        XCTAssertEqual(lootService.getCharacters().count, 3, "Теперь должно быть 3 персонажа.")
    }
    
    func testSellCharacter() {
        lootService.sellCharacter(index: 0)
        XCTAssertEqual(lootService.getCharacters().count, 1, "Должен остаться 1 персонаж после продажи.")
    }
}
