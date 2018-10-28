//
//  SuitLog.swift
//  SuitMovies
//
//  Created by Bayu Paoh on 22/10/18.
//  Copyright © 2018 Rifat Firdaus. All rights reserved.
//

import Foundation

class SuitLog {
    static func info(message:String){
        #if DEBUG
        print("⚠️ \(message)")
        #endif
    }
    
    static func error(message:String){
        #if DEBUG
        print("🚫 \(message)")
        #endif
    }
}
