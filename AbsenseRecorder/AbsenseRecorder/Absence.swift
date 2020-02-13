//
//  Absense.swift
//  AbsenseRecorder
//
//  Created by Karlson, Richard (JMOB) on 09/02/2020.
//  Copyright © 2020 Karlson, Richard (JMOB). All rights reserved.
//

import Foundation

class Absence{
    var takenOn: Date
    var present: [Student] = []

    
    init(date: Date){
        takenOn = date
    }
    
    init(date: Date, present: [Student]){
        takenOn = date
        self.present = present
    }
    
}
