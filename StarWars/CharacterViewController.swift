//
//  CharacterViewController.swift
//  StarWars
//
//  Created by Jose Sanchez Rodriguez on 24/1/17.
//  Copyright © 2017 Jose Sanchez Rodriguez. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {

    let model: StarWarsCharacter
    
    //MARK: - Initialization
    init(model: StarWarsCharacter) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
