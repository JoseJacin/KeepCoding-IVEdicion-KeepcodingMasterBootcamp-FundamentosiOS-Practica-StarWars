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
    
    let model : StarWarsCharacter
    
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
