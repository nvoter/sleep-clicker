//
//  CharacterShopModel.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 03.03.2024.
//

enum CharacterShopModel {
    enum Start {
        struct Request { }
        struct Response {
            var balance: Int
        }
        struct ViewModel {
            var balanceLabel: String
        }
    }
    
    enum PetPurchase {
        struct Request {
            var price: Int
            var balance: Int
        }
        struct Response {
            var status: Bool
            var balance: Int
        }
        struct ViewModel {
            var status: Bool
            var balanceLabel: String
        }
    }
    
    enum Back {
        struct Request { }
        struct Response { }
        struct ViewModel { }
    }
    
    //    enum Other {
    //        struct Request { }
    //        struct Response { }
    //        struct ViewModel { }
    //    }
}
