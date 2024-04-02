//
//  TutorialModel.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 22.04.2024.
//

import UIKit

enum TutorialModel {
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
    
    //    enum Other {
    //        struct Request { }
    //        struct Response { }
    //        struct ViewModel { }
    //    }
}
