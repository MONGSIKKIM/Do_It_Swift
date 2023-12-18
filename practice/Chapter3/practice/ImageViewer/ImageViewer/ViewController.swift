//
//  ViewController.swift
//  ImageViewer
//
//  Created by 김홍식 on 12/18/23.
//

import UIKit

class ViewController: UIViewController {
    var numImage = 1
    var maxImage = 6
    
    
    @IBOutlet var viewImage: UIImageView!
    @IBOutlet var btnBefore: UIButton!
    @IBOutlet var btnAfter: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let imgName = "1.png"
        viewImage.image = UIImage(named: imgName)
        
    }


    @IBAction func btnGoBefore(_ sender: UIButton) {
        numImage += 1
        if (numImage > maxImage){
            numImage = 1
        }
        let imgName = String(numImage)+".png"
        viewImage.image = UIImage(named: imgName)
    }
    @IBAction func btnGoAfter(_ sender: UIButton) {
        numImage -= 1
        if (numImage < 1) {
            numImage = maxImage
        }
        let imgName = String(numImage)+".png"
        viewImage.image = UIImage(named: imgName)
    }
}

