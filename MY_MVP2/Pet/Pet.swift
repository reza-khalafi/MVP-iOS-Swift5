//
//  Pet.swift
//  MY_MVP2
//
//  Created by Reza Khalafi on 7/21/19.
//  Copyright © 2019 Reza Khalafi. All rights reserved.
//

import UIKit

class Pet: NSObject {
    
    
    
    var id:Int?
    var name:String?
    var gender:GenderEnum?
    
    
    
    internal init(id: Int?, name: String?, gender: GenderEnum?) {
        self.id = id
        self.name = name
        self.gender = gender
    }

}

enum GenderEnum:String {
    case male = "male"
    case female = "female"
}
