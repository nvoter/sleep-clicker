//
//  AboutAppModel.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 15.03.2024.
//

enum AboutAppModel {
    enum Start {
        struct Request { }
        struct Response { 
            var backgroundName: String
        }
        struct ViewModel { 
            var backgroundName: String
        }
    }
    
    enum Tutorial {
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
