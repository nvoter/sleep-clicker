//
//  RoomsModel.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 27.02.2024.
//

import Foundation

enum RoomsModel {
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
    
    enum PetTap {
        struct Request {
            var index: Int
        }
        struct Response {
            var balance: Int
        }
        struct ViewModel {
            var balanceLabel: String
        }
    }
    
    enum Settings {
        struct Request { }
        struct Response { }
        struct ViewModel { }
    }
    
    enum Shop {
        struct Request { }
        struct Response { }
        struct ViewModel { }
    }
    
    enum Tutorial {
        struct Request { }
        struct Response { }
        struct ViewModel { }
    }
    
    enum Reload {
        struct Request { }
        struct Response { }
        struct ViewModel { }
    }
}
