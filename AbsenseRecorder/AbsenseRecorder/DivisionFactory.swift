//
//  DivisionFactory.swift
//  AbsenseRecorder
//
//  Created by Karlson, Richard (JMOB) on 07/02/2020.
//  Copyright © 2020 Karlson, Richard (JMOB). All rights reserved.
//

import Foundation

class DivisionFactory{
    static func createDivision(code: String, of size: Int) -> Division{
        let division = Division(code: code)
        
        for i in 1...size{
            let student = Student(forename: "FirstName\(i)", surname: "Surname\(i)", birthday: Date.init())
            division.students.append(student)
        }
        
        return division
    }
    
}
