//
//  CharacterViewController.swift
//  StarWars
//
//  Created by Jose Sanchez Rodriguez on 24/1/17.
//  Copyright © 2017 Jose Sanchez Rodriguez. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var photoView: UIImageView!
    let model: StarWarsCharacter
    
    //MARK: - Initialization
    init(model: StarWarsCharacter) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        syncViewWithModel()
    }
    
    //MARK: - Sync model -> View
    // Función que sincroniza la vista con el modelo, es decir, saca datos del modelo y los mete en la vista
    func syncViewWithModel() {
        photoView.image = model.photo
        title = model.alias ?? model.name
    }
    
    //MARK: - Actions
    // Acción que reproduce el sonido adjunto del StarWarsCharacter
    @IBAction func playSound(_ sender: UIBarButtonItem) {
    }
    
    // Acción que abre Wikipedia con la información del StarWarsCharacter
    @IBAction func displayWikipedia(_ sender: UIBarButtonItem) {
    }
}
