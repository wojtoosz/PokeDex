//
//  PokemonDetailVC.swift
//  PokeDex
//
//  Created by Wojciech Charuza on 14.07.2016.
//  Copyright © 2016 Wojciech Charuza. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var pokemon: Pokemon!
    var state = 0
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var statsView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        nameLbl.text = pokemon.name.capitalizedString
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        selectSegment(0)
        
        
        pokemon.downloadPokemonDetails { () -> () in
            self.updateUI()
            self.tableView.reloadData()
        }
    }
    
    func selectSegment(segment: Int) {
        if segment == 0 {
            tableView.hidden = true
            statsView.hidden = false
        } else if segment == 1 {
            tableView.hidden = false
        }
        state = segment
    }
    
    @IBAction func segmentChanged(sender: UISegmentedControl) {
        selectSegment(sender.selectedSegmentIndex)
    }
    
    
    func updateUI() {
        descriptionLbl.text = pokemon.description
        typeLbl.text = pokemon.type
        defenseLbl.text = pokemon.defense
        heightLbl.text = "\(pokemon.height) m"
        pokedexLbl.text = "\(pokemon.pokedexId)"
        weightLbl.text = "\(pokemon.weight) kg"
        attackLbl.text = pokemon.attack
        
        
        if pokemon.nextEvolutionId == "" {
            evoLbl.text = "No Evolutions"
            nextEvoImg.hidden = true
        } else {
            nextEvoImg.hidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            var str = pokemon.nextEvolutionTxt
            
            if pokemon.nextEvolutionLvl != "" {
                str += " - LVL \(pokemon.nextEvolutionLvl)"
                evoLbl.text = str
            }
        }

    }
    
    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.moves.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("MoveCell") as? MoveCell {
            var move = PokemonMove(name: "Tackle", attack: "10", accuracy: "50", description: "Tackles an opponent")
            if pokemon.moves.count > 0 {
            move = pokemon.moves[indexPath.row]
            }
        cell.configureCell(move)
        return cell
        } else {
            return UITableViewCell()
        }
        
    }
  

}
