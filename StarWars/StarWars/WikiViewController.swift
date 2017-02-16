//
//  WikiViewController.swift
//  StarWars
//
//  Created by Jose Sanchez Rodriguez on 24/1/17.
//  Copyright © 2017 Jose Sanchez Rodriguez. All rights reserved.
//

import UIKit

class WikiViewController: ViewController {

    //MARK: - Properties
    @IBOutlet weak var browser: UIWebView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var model : StarWarsCharacter
    
    //MARK: - Initialization
    init(model: StarWarsCharacter) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - View Lifecycle
    // Función que se ejecuta cuando la vista se va a mostrar.
    // En el ciclo de vida de la vista, esta función puede ejecutarse varias veces
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        syncViewWithModel()
        browser.delegate = self
        
        // Se da de alta de las notificaciones
        subcribe()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Se da de baja de las notificaciones
        unsubscribe()
    }

    //MARK: - Sync model View
    // Función que sincroniza la vista con el modelo, es decir, saca datos del modelo y los mete en la vista
    func syncViewWithModel() {
        // Se crea una URLRequest
        let req = URLRequest(url: model.url)
        
        // Se carga la URLRequest en el browser
        browser.loadRequest(req)
    }
}

//MARK: - UIWebViewDelegate
extension WikiViewController: UIWebViewDelegate {
    // Método que se ejecuta cuando el WebViewController va a cargar una URLRequest
    func webViewDidStartLoad(_ webView: UIWebView) {
        // Se muestra el spinner
        spinner.isHidden = false
        
        // Espinearlo (Hacer que se mueva)
        spinner.startAnimating()
    }
    
    // Método que se ejecuta cuando el WebViewController a finalizado la carga de una URLRequest
    func webViewDidFinishLoad(_ webView: UIWebView) {
        // Se oculta el spinner
        spinner.isHidden = true
        
        // Se despinea (Se para la animación)
        spinner.stopAnimating()
    }
}

//MARK: - Notifications
extension WikiViewController {
    // Función que se suscribe (da de alta) a una notificación
    func subcribe() {
        // Se crea una Referencia al NotificationCenter
        let nc = NotificationCenter.default
        
        // Se da de alta en una notificación
        // object: Se refiere al remitente, normalmente es nil)
        // queue: Hebra (hilo) en el que se ejecutará la notificación. Si es en la cola principal (main) o en segundo plano
        // using: Es el código que se va a ejecutar cuando se reciba la notificación. Se suele hacer mediante una clausura (trailing closure)
        nc.addObserver(forName: UniverseTableTableViewController.notificationName, object: nil, queue: OperationQueue.main)
            { (note: Notification) in
                // Se extrae el personaje de la notificación
                let userInfo = note.userInfo
                let char = userInfo?[UniverseTableTableViewController.characterKey]
                
                // Se cambia el modelo
                self.model = char as! StarWarsCharacter
                
                // Se actualizan las vistas
                self.syncViewWithModel()
        }
    }
    
    // Función que se desuscribe (da de baja) de una notificación
    func unsubscribe() {
        // Se crea una Referencia al NotificationCenter
        let nc = NotificationCenter.default
        
        // Se da de baja de una notificación
        nc.removeObserver(self)
    }
}
