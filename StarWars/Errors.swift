//
//  Errors.swift
//  StarWars
//
//  Created by Jose Sanchez Rodriguez on 19/1/17.
//  Copyright © 2017 Jose Sanchez Rodriguez. All rights reserved.
//

import Foundation

// Pera que se pueda usar como una "excepción" se tiene que usar el protocolo Error
enum StarWarsError : Error {
    case wrongURLFormatForJSONResource
    case resourcePointedByURLNotReachable
    case wrongJSONFormat
    case nilJSONObject
}
