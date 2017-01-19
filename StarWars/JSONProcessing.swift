//
//  JSONProcessing.swift
//  StarWars
//
//  Created by Jose Sanchez Rodriguez on 19/1/17.
//  Copyright © 2017 Jose Sanchez Rodriguez. All rights reserved.
//

import Foundation
import UIKit

/*
 {
 "firstName"    : "Anakin",
 "lastName"     : "Skywalker",
 "alias"        : "Darth Vader",
 "soundFile"    : "vader.caf",
 "imageFile"    : "vader.jpg",
 "jedi"         : false,
 "sith"         : true,
 "affiliation"  : "Galactic Empire",
 "url"          : "https://en.wikipedia.org/wiki/Darth_Vader",
 "midichlorians": 15000
 }
*/

//MARK: - Aliases
// El protocolo AnyObject representa cualquier objeto que sea compatible con Objective C.
typealias JSONObject        = AnyObject;
typealias JSONDictionary    = [String: JSONObject]
typealias JSONArray         = [JSONDictionary]

//MARK: - Decodification
// Función que decodifica un diccionario JSON en un objeto del tipo StarWarsCharacter
func decode(starWarsCharacter json: JSONDictionary) throws -> StarWarsCharacter {
    
    // Se valida el diccionario
    guard let urlString = json["url"] as? String,
          let url = URL(string: urlString) else {
            // La pringamos
            throw StarWarsError.wrongURLFormatForJSONResource
    }
    
    guard let imageName = json["imageFile"] as? String,
          let image = UIImage(named: imageName) else {
            // La pringamos
            throw StarWarsError.resourcePointedByURLNotReachable
    }
    
    guard let soundName = json["soundFile"] as? String,
          let soundURL = Bundle.main.url(forResource: soundName),
          let sound = try? Data(contentsOf: soundURL) else {
            // La pringamos
            throw StarWarsError.resourcePointedByURLNotReachable
    }
    
    guard let alias = json["alias"] as? String else {
        throw StarWarsError.wrongJSONFormat
    }
    
    // Se ha comprobado todo lo más peligroso
    let firstName = json["firstName"] as? String
    let lastName = json["lastName"] as? String
    
    // Solo queda la affiliation
    if let affiliationName = json["affiliation"] as? String {
        // Todo ha salido bien
        
        
        // Se crea el StarWarsCharacter
        return StarWarsCharacter(firstName: firstName,
                                 lastName: lastName,
                                 alias: alias,
                                 sound: sound,
                                 photo: image,
                                 wikiURL: url,
                                 affiliation: StarWarsAffiliation.by(name: affiliationName))
    } else {
        throw StarWarsError.wrongJSONFormat
    }
}

// Función que decodifica un diccionario opcional JSON en un objeto del tipo StarWarsCharacter
func decode(starWarsCharacter json: JSONDictionary?) throws -> StarWarsCharacter {
    // Se valida que 
    guard let json = json else {
        throw StarWarsError.nilJSONObject
    }
    return try decode(starWarsCharacter: json)
}

// Función que decodifica un diccionario JSON en un objeto del tipo ForceSensitive
func decode(forceSensitive json: JSONDictionary) throws -> ForceSensitive {
    // Se valida el diccionario
    guard let urlString = json["url"] as? String,
        let url = URL(string: urlString) else {
            // La pringamos
            throw StarWarsError.wrongURLFormatForJSONResource
    }
    
    guard let imageName = json["imageFile"] as? String,
        let image = UIImage(named: imageName) else {
            // La pringamos
            throw StarWarsError.resourcePointedByURLNotReachable
    }
    
    guard let soundName = json["soundFile"] as? String,
        let soundURL = Bundle.main.url(forResource: soundName),
        let sound = try? Data(contentsOf: soundURL) else {
            // La pringamos
            throw StarWarsError.resourcePointedByURLNotReachable
    }
    
    guard let alias = json["alias"] as? String else {
        throw StarWarsError.wrongJSONFormat
    }
    
    guard let jedi = json["jedi"] as? Bool,
          let sith = json["sith"] as? Bool,
          let mid = json["midichlorians"] as? Int else {
            // La pringamos
            throw StarWarsError.wrongJSONFormat
    }
    
    guard jedi != sith else {
        throw StarWarsError.wrongJSONFormat
    }
    
    // Se ha comprobado todo lo más peligroso
    let firstName = json["firstName"] as? String
    let lastName = json["lastName"] as? String
    
    // Solo queda la affiliation
    if let affiliationName = json["affiliation"] as? String {
        // Todo ha salido bien
        
        
        // Se crea el StarWarsCharacter
        return ForceSensitive(firstName: firstName,
                              lastName: lastName,
                              alias: alias,
                              sound: sound,
                              photo: image,
                              wikiURL: url,
                              affiliation: StarWarsAffiliation.by(name: affiliationName),
                              midichlorians: mid)
    } else {
        throw StarWarsError.wrongJSONFormat
    }
}

// Función que decodifica un diccionario opcional JSON en un objeto del tipo StarWarsCharacter
func decode(forceSensitive json: JSONDictionary?) throws -> ForceSensitive {
    // Se valida que
    guard let json = json else {
        throw StarWarsError.nilJSONObject
    }
    return try decode(forceSensitive: json)
}






