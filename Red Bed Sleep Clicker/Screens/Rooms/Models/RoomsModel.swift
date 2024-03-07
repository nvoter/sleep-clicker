//
//  RoomsModel.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 27.02.2024.
//

enum RoomsModel {
    enum Start {
        struct Request { }
        struct Response { 
            var balance: Int
        }
        struct ViewModel { 
            var balanceLabel: String
        }
    }
    
    enum PetTap {
        struct Request { }
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
    
//    enum Other {
//        struct Request { }
//        struct Response { }
//        struct ViewModel { }
//    }
}
