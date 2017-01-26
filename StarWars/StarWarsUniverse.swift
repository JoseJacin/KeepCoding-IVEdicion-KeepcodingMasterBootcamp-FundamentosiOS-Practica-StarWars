//
//  StarWarsUniverse.swift
//  StarWars
//
//  Created by Jose Sanchez Rodriguez on 23/1/17.
//  Copyright © 2017 Jose Sanchez Rodriguez. All rights reserved.
//

import Foundation
import UIKit

// Representa a un conjunto de personajes
class StarWarsUniverse {
    // MARK: - Utility types
    typealias StarWarsArray = [StarWarsCharacter]
    typealias StarWarsDictionary = [StarWarsAffiliation: StarWarsArray]
    
    // MARK: - Properties
    fileprivate var dict: StarWarsDictionary = StarWarsDictionary()
    
    // MARK: - Initialization
    init(characters chars: StarWarsArray) {
        // Asignamos afiliaciones y un StarWarsArray vacío a cada una de ellas
        dict = makeEmptyAffiliations()
        
        // Nos pateamos el array de StarWars y asignamos según afiliación
        for each in chars {
            dict[each.affiliation]?.append(each)
        }
        
        // Ordenamos los personajes dentro de cada afilicación
        for (affiliation, characters) in dict {
            dict[affiliation] = characters.sorted()
        }
    }
    
    // MARK: - Accessors
    // Propiedad computada que retorna el número de afiliaciones que hay
    var affiliationCount: Int {
        get{
            // Cuántas afiliaciones hay?
            return dict.count
        }
    }
    
    // Función que retorna el número de caracteres de que se encuentran dentro de una afiliación
    func characterCount(forAffiliation affiliation: StarWarsAffiliation) -> Int {
        guard let count = dict[affiliation]?.count else {
            return 0
        }
        
        return count
    }
    
    // Función que retorna un personaje en concreto que se encuentra dentro de una afiliación
    func character(atIndex index: Int,
                   forAffiliation affiliation: StarWarsAffiliation) -> StarWarsCharacter {
        // El personaje nº index de la afiliación affiliation
        let chars = dict[affiliation]!
        let char = chars[index]
        return char
    }
    
    // Función que retorna el nombre de la afiliación
    func affiliationName(_ affiliation: StarWarsAffiliation) -> String {
        return affiliation.rawValue
    }
    
    
    // MARK: - Utils
    // Función que asigna la afilización (clave del dictionary a un array StarWarsArray vacío
    func makeEmptyAffiliations() -> StarWarsDictionary {
        var d = StarWarsDictionary()
        
        d[.rebelAlliance] = StarWarsArray()
        d[.galacticEmpire] = StarWarsArray()
        d[.firstOrder] = StarWarsArray()
        d[.jabbaCriminalEmpire] = StarWarsArray()
        
        return d
    }
}











