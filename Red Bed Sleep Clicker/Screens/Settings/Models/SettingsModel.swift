//
//  SettingsModel.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 29.02.2024.
//

enum SettingsModel {
    enum Start {
        struct Request { }
        struct Response { 
            var backgroundName: String
            var volume: Float
        }
        struct ViewModel { 
            var backgroundName: String
            var volume: Float
        }
    }
    
    enum About {
        struct Request { }
        struct Response { }
        struct ViewModel { }
    }
    
    enum Rooms {
        struct Request { }
        struct Response { }
        struct ViewModel { }
    }
    
    enum ValueChanged {
        struct Request { 
            var value: Float
        }
        struct Response { }
        struct ViewModel { }
    }
    
    //    enum Other {
    //        struct Request { }
    //        struct Response { }
    //        struct ViewModel { }
    //    }
}
