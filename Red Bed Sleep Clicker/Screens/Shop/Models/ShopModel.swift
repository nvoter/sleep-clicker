//
//  ShopModel.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 02.03.2024.
//

enum ShopModel {
    enum Start {
        struct Request { }
        struct Response { 
            var backgroundName: String
        }
        struct ViewModel { 
            var backgroundName: String
        }
    }
    
    enum Rooms {
        struct Request { }
        struct Response { }
        struct ViewModel { }
    }
    
    enum Settings {
        struct Request { }
        struct Response { }
        struct ViewModel { }
    }
    
    enum CharacterShop {
        struct Request { }
        struct Response { }
        struct ViewModel { }
    }
    
    enum DecorShop {
        struct Request { }
        struct Response { }
        struct ViewModel { }
    }
    
    enum BoostsShop {
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
