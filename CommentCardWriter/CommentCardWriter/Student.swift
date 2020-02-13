//
//  Student.swift
//  CommentCardWriter
//
//  Created by Karlson, Richard (JMOB) on 11/02/2020.
//  Copyright © 2020 Karlson, Richard (JMOB). All rights reserved.
//

import Foundation

class Student {
    
    let forename: String
    let surname: String
    let block: String
    let numOfSubs: Int
    var studentComments: [Comment] = []


    init(forename: String, surname: String, block: String, numOfSubs: Int){
    
        self.forename = forename
        self.surname = surname
        self.block = block
        self.numOfSubs = numOfSubs
        
        
    }
    
    
}
    
    
    
    
    

