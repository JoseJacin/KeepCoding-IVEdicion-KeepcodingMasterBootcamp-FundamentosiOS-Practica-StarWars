//
//  ForceSensitives.swift
//  StarWars
//
//  Created by Jose Sanchez Rodriguez on 17/1/17.
//  Copyright © 2017 Jose Sanchez Rodriguez. All rights reserved.
//

import Foundation
import UIKit


class ForceSensitive: StarWarsCharacter {
    //MARK: - Stored Properties
    let midichlorians   : Int
    
    //MARK: - Initialization
    init(firstName: String?,
         lastName: String?,
         alias: String?,
         sound: Data,
         photo: UIImage,
         wikiURL: URL,
         affiliation: StarWarsAffiliation,
         midichlorians: Int) {
        
        // Lo primero que se tiene que hacer es dar valores a las propiedades que se han creado
        self.midichlorians = midichlorians
        
        // Después se llama al inicializador designado de la superclase
        super.init(firstName: firstName, lastName: lastName,
                   alias: alias, sound: sound,
                   photo: photo, wikiURL: wikiURL,
                   affiliation: affiliation)
        
    }
    
    // Inicializador de conveniencia
    // Inicializador de Jedi
    convenience init(jediWithFirstName: String?,
                     lastName: String?,
                     alias: String?,
                     soundData: Data,
                     photo: UIImage,
                     url: URL,
                     midichlorians: Int) {
        
        self.init(firstName: jediWithFirstName, lastName: lastName,
                  alias: alias, sound: soundData,
                  photo: photo, wikiURL: url,
                  affiliation: .rebelAlliance,
                  midichlorians: midichlorians)
    }
    
    // Inicializador de Sith
    convenience init(sithWithFirstName: String?,
                     lastName: String?,
                     alias: String,
                     soundData: Data,
                     photo: UIImage,
                     url: URL,
                     midichlorians: Int) {
        
        self.init(firstName: sithWithFirstName, lastName: lastName,
                  alias: alias, sound: soundData,
                  photo: photo, wikiURL: url,
                  affiliation: .galacticEmpire,
                  midichlorians: midichlorians)
    }
    
    //MARK: - Proxies
    override func proxyForEquiality() -> String {
        return "\(super.proxyForEquiality())\(midichlorians)"
    }
    
    override func proxyForComparision() -> String {
        return proxyForEquiality()
    }
}
