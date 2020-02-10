//
//  Division.swift
//  AbsenseRecorder
//
//  Created by Karlson, Richard (JMOB) on 07/02/2020.
//  Copyright © 2020 Karlson, Richard (JMOB). All rights reserved.
//

import Foundation

class Division{
    let code: String
    var students: [Student] = []
    var absences: [Absence] = []
    
    init(code: String){
        
        self.code = code
    }
    
    func hasAbsence(for date: Date) -> Bool{
        for absence in absences {
            if absence.takenOn == date {
                   return true
            }
        }
        return false
    }
    
    func getAbsence(for date: Date) -> Absence? {
        return absences.first(where: {
            
            $0.takenOn == date
        })
    }
}
