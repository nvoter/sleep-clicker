//
//  BoostsShopModel.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 06.03.2024.
//

enum BoostsShopModel {
    enum Start {
        struct Request { }
        struct Response {
            var backgroundName: String
            var balance: Int
        }
        struct ViewModel {
            var backgroundName: String
            var balanceLabel: String
        }
    }
    
    enum BoostPurchase {
        struct Request {
            var boost: BoostModel
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
