//
//  StarWarsAffiliation.swift
//  StarWars
//
//  Created by Jose Sanchez Rodriguez on 17/1/17.
//  Copyright © 2017 Jose Sanchez Rodriguez. All rights reserved.
//

import Foundation

enum StarWarsAffiliation: String {
    
    case galacticEmpire = "Galactic Empire"
    case rebelAlliance  = "Rebel Alliance"
    case firstOrder     = "First Order"
    case jabbaCriminalEmpire    = "Jabba's Criminal Empire"
    case unknown        = "Unknown"
    
    static func by(name: String) -> StarWarsAffiliation {
        let aff: StarWarsAffiliation
        
        switch name {
        case StarWarsAffiliation.galacticEmpire.rawValue:
            aff = .galacticEmpire
        case StarWarsAffiliation.rebelAlliance.rawValue:
            aff = .rebelAlliance
        case StarWarsAffiliation.firstOrder.rawValue:
            aff = .firstOrder
        case StarWarsAffiliation.jabbaCriminalEmpire.rawValue:
            aff = .jabbaCriminalEmpire
        default:
            aff = .unknown
        }
        
        return aff
    }
    
    static func by(name: String?) -> StarWarsAffiliation {
        // Se valida si name es nil
        guard let realName = name else {
            return .unknown
        }
        
        return by(name: realName)
    }
}
