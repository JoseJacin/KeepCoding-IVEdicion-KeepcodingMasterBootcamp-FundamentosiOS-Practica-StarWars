//
//  UniverseTableTableViewController.swift
//  StarWars
//
//  Created by Jose Sanchez Rodriguez on 23/1/17.
//  Copyright © 2017 Jose Sanchez Rodriguez. All rights reserved.
//

import UIKit

class UniverseTableTableViewController: UITableViewController {
    
    //MARK: - Properties
    let model: StarWarsUniverse
    
    //MARK: - Initialization
    init(model: StarWarsUniverse) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return model.affiliationCount
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Cuántos personajes hay en esta aff??
        return model.characterCount(forAffiliation: getAffiliation(forSection: section))
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // Qué nombre tiene esta aff??
        return model.affiliationName(getAffiliation(forSection: section))
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Definir un id para el tipo de celda
        let cellId = "StarWarsCell"
        
        // Averiguar la afilicación
        let aff = getAffiliation(forSection: indexPath.section)
        
        var cell: UITableViewCell?

        do {
            // Averiguar quién es el personaje
            //let char = try model.character(atIndex: indexPath.row, forAffiliation: aff)
            let char = try model.character(atIndex: 10, forAffiliation: aff)
            
            // Crear la celda
            cell = tableView.dequeueReusableCell(withIdentifier: cellId)
            
            if cell == nil {
                // El opcional está vacío y toca crear la celda desde cero
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
            }
            
            // Configurar la celda recién creada
            cell?.imageView?.image = char.photo
            cell?.textLabel?.text = char.alias
            cell?.detailTextLabel?.text = char.name
        }catch{
            print("Error from obtain character")
        }
        
        // Devolver la celda recién configurada
        /*
        if cell == nil {
            fatalError("Error from obtain character")
        } else {
            return cell!
        }
        */// En este caso sí se puede usar el "por cojones"
        
        guard let cell2 = cell else {
            return (cell?)!
        }
        return cell2
    }
    
    //MARK: - Utils
    func getAffiliation(forSection section: Int) -> StarWarsAffiliation {
        
        var aff: StarWarsAffiliation = .unknown
        
        switch section {
        case 0:
            aff = .galacticEmpire
        case 1:
            aff = .rebelAlliance
        case 2:
            aff = .jabbaCriminalEmpire
        case 3:
            aff = .firstOrder
        default:
            aff = .unknown
        }
        
        return aff
    }
}
