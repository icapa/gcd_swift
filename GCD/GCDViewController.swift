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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
