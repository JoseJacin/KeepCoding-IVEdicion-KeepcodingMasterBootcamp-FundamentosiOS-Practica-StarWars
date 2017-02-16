//
//  UniverseTableTableViewController.swift
//  StarWars
//
//  Created by Jose Sanchez Rodriguez on 23/1/17.
//  Copyright © 2017 Jose Sanchez Rodriguez. All rights reserved.
//

import UIKit

class UniverseTableTableViewController: UITableViewController {
    
    //MARK: - Constants
    static let notificationName = Notification.Name(rawValue: "CharacterDidChange")
    static let characterKey = "CharacterKey"
    
    //MARK: - Properties
    let model: StarWarsUniverse
    weak var delegate: UniverseTableTableViewControllerDelegate? = nil
    
    //MARK: - Initialization
    init(model: StarWarsUniverse) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Descubrir la afiliación
        let aff = getAffiliation(forSection: indexPath.section)
        
        // Descubrir de qué personaje me hablas
        let char = model.character(atIndex: indexPath.row,forAffiliation: aff)
        
        // Avisar al Delegado
        delegate?.universeTableViewController(self, didSelectCharacter: char)
        
        // Se manda una notificación
        notify(characterChanged: char)
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
        
        // Averiguar quién es el personaje
        let char = model.character(atIndex: indexPath.row, forAffiliation: aff)
        
        // Crear la celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        
        if cell == nil {
            // El opcional está vacío y toca crear la celda desde cero
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        }
        
        // Configurar la celda recién creada
        cell?.imageView?.image = char.photo
        cell?.textLabel?.text = char.alias
        cell?.detailTextLabel?.text = char.name
        
        // Devolver la celda recién configurada
        return cell! // En este caso sí se puede usar el "por cojones"
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

//MARK - UniverseTableTableViewControllerDelegate
//Protocolo de Delegado de UniverseTableTableViewController
protocol UniverseTableTableViewControllerDelegate: class {
    // Métodos should (que piden permiso)
    
    // Métodos will (lo voy a hacer)
    
    // Métodos did (ya lo he hecho, que lo sepas)
    // Declaración de la función del Delegado que se ejecuta cuando se pulsa una celda en UniverseTableTableViewController
    func universeTableViewController(_ uVC: UniverseTableTableViewController, didSelectCharacter char: StarWarsCharacter)
}

//MARK: - Notifications
extension UniverseTableTableViewController {
    // Función que envía la notificación de que el personaje ha cambiado
    func notify (characterChanged char: StarWarsCharacter) {
        // Se "crea" (no se crea, ya existe una instancia por defecto, lo que se hace es pedir usar la instancia creada) una instancia del NotificationCenter
        let nc = NotificationCenter.default
        
        // Se crea un objeto Notification
        let notification = Notification(name: UniverseTableTableViewController.notificationName, object: self, userInfo: [UniverseTableTableViewController.characterKey : char])
        
        // Se configura el objeto Notification
        nc.post(notification)
        
        // Se manda el objeto Notificacion
        
    }
}




