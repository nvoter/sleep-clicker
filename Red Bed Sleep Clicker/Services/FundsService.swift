//
//  FundsService.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 22.03.2024.
//

import Foundation

public protocol FundsManaging {
    func getBalance() -> Int
    func updateBalance(balance: Int)
}

public final class FundsService: FundsManaging {
    private let defaults: UserDefaults
    private let balanceKey = "balance"
    
    public init(defaults: UserDefaults) {
        self.defaults = defaults
    }
    
    public func getBalance() -> Int {
        return defaults.integer(forKey: balanceKey)
    }
    
    public func updateBalance(balance: Int) {
        defaults.setValue(balance, forKey: balanceKey)
    }
}
