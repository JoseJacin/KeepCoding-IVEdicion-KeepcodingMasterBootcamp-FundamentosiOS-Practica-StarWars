//
//  StarWarsCharacters.swift
//  StarWars
//
//  Created by Jose Sanchez Rodriguez on 17/1/17.
//  Copyright © 2017 Jose Sanchez Rodriguez. All rights reserved.
//

import Foundation
import UIKit

class StarWarsCharacter {
    //MARK: - Stored properties (propiedades de instancia)
    // Stored properties (propiedades de instancia) - Propiedades que tienen instancia
    let firstName   : String?
    let lastName    : String?
    let alias       : String
    let soundData   : Data
    let photo       : UIImage
    let url         : URL
    let affiliation : StarWarsAffiliation
    
    //MARK: - Computed properties (propiedades computadas)
    // Computed properties (propiedades computadas) - Propiedades que tienen instancia
    var name : String? {
        get {
            // guard va creando un entorno en el que no hay opcionales vacíos. Ejecuta el contenido cuando la variable analizada es vacío
            // Las constantes son visibles dentro del guard pero también dentro del get
            /*
            guard let firstName = firstName else {
                return lastName
            }
            
            guard let lastName = lastName else {
                return firstName
            }
            
            return "\(firstName) \(lastName)"
            */
            
            //Para comprobar si el primer nombre y el segundo nombre es nil se retorna nil, sino, retorna los valores del primer y segundo apellido
            let first = firstName
            let last = lastName
            let noName = ""
            
            let characterName = first ?? last ?? noName
            
            return "\(characterName)"
        }
        
        /*
 guard let first = firstName else {
 guard let last = lastName else {
 return first
 }
 
 return lastName
 }
 
 return "\(first) \(last)"
 */
    }
 
    //MARK: - Initialization
    // Inicializador designado (Si no se indica que es el de conveniencia, es el designado)
    init(firstName: String?,
         lastName: String?,
         alias: String,
         sound: Data,
         photo: UIImage,
         wikiURL: URL,
         affiliation: StarWarsAffiliation) {
        
        //Siempre que la variable de instancia se llame igual que el parámetro del Init, se tiene que usar self para diferenciarlos
        self.firstName = firstName
        self.lastName = lastName
        self.alias = alias
        soundData = sound
        self.photo = photo
        url = wikiURL
        self.affiliation = affiliation
    }
    
    // Inicializador de conveniencia
    convenience init(alias: String,
                     soundData: Data,
                     photo: UIImage,
                     url: URL,
                     affiliation: StarWarsAffiliation) {
        
        // Se revisa al inicializador designado
        self.init(firstName: nil,
                  lastName: nil,
                  alias: alias,
                  sound: soundData,
                  photo: photo,
                  wikiURL: url,
                  affiliation: affiliation)
    }
    
    //MARK: - Proxies
    // Proxy para igualdad
    func proxyForEquiality() -> String {
        return "\(firstName)\(lastName)\(alias)\(url)\(affiliation)\(photo.hashValue)\(soundData.hashValue)"
    }
    
    // Proxy para comparación
    func proxyForComparision() -> String {
        return proxyForEquiality()
    }
}

//MARK: - Protocols
// Protocolo de igualdad
extension StarWarsCharacter: Equatable {
    
    public static func ==(lhs: StarWarsCharacter, rhs: StarWarsCharacter) -> Bool {
        return (lhs.proxyForEquiality() == rhs.proxyForEquiality())
    }
}

// Protocolo de comparación
extension StarWarsCharacter: Comparable {
    
    public static func <(lhs: StarWarsCharacter, rhs: StarWarsCharacter) -> Bool {
        return (lhs.proxyForComparision() < rhs.proxyForComparision())
    }
}

// Protocolo de representación textual de la instancia
extension StarWarsCharacter: CustomStringConvertible {
    public var description: String {
        get {
            return "<\(type(of:self)): \(name) -- \(alias)>"
        }
    }
}












