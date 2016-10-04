//
//  PokemonMove.swift
//  PokeDex
//
//  Created by Wojciech Charuza on 07.09.2016.
//  Copyright © 2016 Wojciech Charuza. All rights reserved.
//

import Foundation


class PokemonMove {
    
    private var _name: String!
    private var _attack: String!
    private var _accuracy: String!
    private var _description: String!
    
    
    var name: String {
        return _name
    }
    
    var attack: String {
        return _attack
    }
    
    var accuracy: String {
        return _accuracy
    }
    
    var description: String {
        return _description
    }
    
    init(name: String, attack: String, accuracy: String, description: String) {
        self._name = name.capitalizedString
        self._attack = attack
        self._accuracy = accuracy
        self._description = description
    }
    
}
