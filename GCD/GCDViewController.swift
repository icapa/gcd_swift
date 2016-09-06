//
//  GCDViewController.swift
//  GCD
//
//  Created by Iván Cayón Palacio on 6/9/16.
//  Copyright © 2016 KeepCoding. All rights reserved.
//

import UIKit

class GCDViewController: UIViewController {

    let url = URL(string: "https://orig02.deviantart.net/c3e4/f/2012/194/2/0/house_targaryen_by_archaox-d574ytp.jpg")!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func updateAlpha(_ sender: UISlider) {
        let value : CGFloat = CGFloat(sender.value)
        imageView.alpha = value
    }
    
    @IBAction func actorDownload(_ sender: AnyObject) {
    }
    
    @IBAction func asyncDownload(_ sender: AnyObject) {
        
        DispatchQueue.global(qos: .userInitiated).async {
            var data : Data
            do{
                try data = Data(contentsOf: self.url)
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
                
            }catch{
                print("Se jodió el invento")
            }
            
        }
        
        
         
        
    }
    
    @IBAction func syncDownload(_ sender: AnyObject) {
        var data : Data
        do{
            try data = Data(contentsOf: url)
            imageView.image = UIImage(data: data)
        }catch{
            print("Se jodió el invento")
        }
        
    }
    
    typealias completionClosuse = (UIImage)->()
   
    func withImage(_ image: UIImage, completion : completionClosuse){
        DispatchQueue.global(qos: .userInitiated).async {
            do{
                let data = try Data (contentsOf: self.url)
                let img = UIImage(data: data)!
                // hemos terminado, toca ejecutar la clausura
                // la clasusura de finalizacion siempre en cola principal
                DispatchQueue.main.async {
                    completion(img)
                }
            }catch{
                print("la cagamos")
            }
        }
    }
}
