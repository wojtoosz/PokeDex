//
//  MoveCell.swift
//  PokeDex
//
//  Created by Wojciech Charuza on 07.09.2016.
//  Copyright © 2016 Wojciech Charuza. All rights reserved.
//

import UIKit

class MoveCell: UITableViewCell {
    
    @IBOutlet weak var moveNameLbl: UILabel!
    @IBOutlet weak var moveAttackLbl: UILabel!
    @IBOutlet weak var moveAccuracyLbl: UILabel!
    @IBOutlet weak var moveDescLbl: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureCell(move: PokemonMove) {
        moveNameLbl.text = move.name
        moveAttackLbl.text = move.attack
        moveAccuracyLbl.text = move.accuracy
        moveDescLbl.text = move.description
    }
}
