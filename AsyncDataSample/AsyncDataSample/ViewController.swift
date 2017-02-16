//
//  ViewController.swift
//  AsyncDataSample
//
//  Created by Fernando Rodríguez Romero on 2/3/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBAction func deleteCache(_ sender: Any) {
        // Borramos el cache que guarda AsyncImage
        AsyncData.removeAllLocalFiles()
    }
    
    static let realImageURL = URL(string:"https://orig01.deviantart.net/858d/f/2014/276/9/d/princess_leia_holding_an_gun_by_chow11-d81h1a4.jpg")!
    static let defaultImageAsData = try! Data(contentsOf: Bundle.main.url(forResource: "default-person", withExtension: "png")!)
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    let asyncData = AsyncData(url: ViewController.realImageURL, defaultData: ViewController.defaultImageAsData)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        spinner.isHidden = false
        spinner.startAnimating()
        
        asyncData.delegate = self
        photo.image = UIImage(data: asyncData.data) // muestra la de ir tirando y empieza a descargar la buena
        
    }

}

extension ViewController: AsyncDataDelegate{
    
    func asyncData(_ sender: AsyncData, shouldStartLoadingFrom url: URL) -> Bool {
        // nos pregunta si puede haer la descarga. 
        // por supuesto!
        return true
    }
    
    func asyncData(_ sender: AsyncData, willStartLoadingFrom url: URL) {
        // Nos avisa que va a empezar
        print("Viá a empezar a descargar del remoto: \(url)")
    }
    
    func asyncData(_ sender: AsyncData, didEndLoadingFrom url: URL) {
        // la tengo!
        print("Terminé la descarga")
        print("Y de paso, lo guardé en local, así que la próxima vez no tengo que descargar")
        
        // la actualizo, y encima con una animación (más en el avanzado)
        UIView.transition(with: photo,
                          duration: 0.7,
                          options: [.transitionCrossDissolve],
                          animations: {
            // cambio la imagen
            self.photo.image = UIImage(data: sender.data)
                            
        }, completion: nil)
        
        
        
        spinner.stopAnimating()
        spinner.isHidden = true
        
    }
    
}

