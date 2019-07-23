//
//  PetPresenter.swift
//  MY_MVP2
//
//  Created by Reza Khalafi on 7/21/19.
//  Copyright © 2019 Reza Khalafi. All rights reserved.
//

import UIKit



protocol PetPresenterDelegate:class {
    func updateData(pets:Array<Pet>?)
}


class PetPresenter: NSObject {
    
    weak var petPresenterDelagate:PetPresenterDelegate?
    
    func setViewDelegate(presenterDelegate:PetPresenterDelegate){
        self.petPresenterDelagate = presenterDelegate
    }
    
    func prepareData() {
        let pet0 = Pet(id:1,name:"Lion",gender:GenderEnum.male);
        let pet1 = Pet(id:2,name:"Tiger",gender:GenderEnum.female);
        let pet2 = Pet(id:3,name:"Jagvar",gender:GenderEnum.male);
        let pet3 = Pet(id:4,name:"Ant",gender:GenderEnum.male);
        let pets = [pet0,pet1,pet2,pet3];
        petPresenterDelagate?.updateData(pets: pets)
    }
    
    func add(pets:Array<Pet>?)  {
        var newPets:Array<Pet>? = pets
        let randomNumber = Int.random(in: 0...100)
        let randomNumberGender = Int.random(in: 0...1)
        var gn:GenderEnum!
        if randomNumberGender == 0 {
            gn = .male
        }else{
            gn = .female
        }
        let pet = Pet(id:randomNumber,name:"Pet \(randomNumber)" ,gender:gn);
        newPets?.append(pet)
        petPresenterDelagate?.updateData(pets: newPets)
    }
    
}
