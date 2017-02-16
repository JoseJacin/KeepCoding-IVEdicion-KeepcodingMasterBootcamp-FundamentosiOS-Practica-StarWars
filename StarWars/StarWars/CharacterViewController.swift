//
//  CharacterViewController.swift
//  StarWars
//
//  Created by Jose Sanchez Rodriguez on 24/1/17.
//  Copyright © 2017 Jose Sanchez Rodriguez. All rights reserved.
//

import UIKit
import AVFoundation

class CharacterViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var photoView: UIImageView!
    var model: StarWarsCharacter
    // Se crea una variable que sirve para leer y reproducir un fichero de audio. Se tiene que crear como variable de instancia para que la varible dure lo mismo que 
    // la instancia de CharacterViewController y no dure el tiempo que dura la ejecución de la función en la que se use
    var player: AVAudioPlayer? = nil
    
    //MARK: - Initialization
    init(model: StarWarsCharacter) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - View Lifecycle
    // Función que se ejecuta cuando la vista se ha cargado en memoria.
    // En el ciclo de vida de la vista, esta función solo va a ejecutarse una vez
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
        // Se reproduce el sonido
        do {
            // Se avisa que se va a reproducir sonido
            // Los métodos shared o default indican que se está accediendo a un singleton, por lo que solo habrá una sola instancia
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            // Se indica el formato de sonido que se va a reproducir (no es estrictamente necesario, ya que es capaz que coger el formato de la extensión del nombre del fichero
            player = try AVAudioPlayer(data: model.soundData, fileTypeHint: AVFileTypeCoreAudioFormat)
            
            // Se reproduce el sonido
            player?.play()
        } catch let err as NSError {
            print("error reproduciendo sonido")
            print("\(err)")
        }
    }
    
    // Acción que abre Wikipedia con la información del StarWarsCharacter
    @IBAction func displayWikipedia(_ sender: UIBarButtonItem) {
        // Se crea un WikiVC
        let wVC = WikiViewController(model: model)
        
        // Hacer un push (Se mete dentro de un navigationController)
        navigationController?.pushViewController(wVC, animated: true)
    }
}

//MARK: - Protocols
extension CharacterViewController: UniverseTableTableViewControllerDelegate {
    
    func universeTableViewController(_ uVC: UniverseTableTableViewController, didSelectCharacter char: StarWarsCharacter) {
        
        // Cambiamos el modelo
        model = char
        
        // Sincronizamos la vista con el modelo
        syncViewWithModel()
    }
}
