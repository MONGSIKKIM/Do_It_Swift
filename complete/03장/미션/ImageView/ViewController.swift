//
//  ViewController.swift
//  ImageView
//
//  Created by Ho-Jeong Song on 2022/11/11.
//

import UIKit

class ViewController: UIViewController {
    var maxImage = 6
    var numImage = 1

    @IBOutlet var imgGallery: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        imgGallery.image = UIImage(named:"1.png")
    }

    @IBAction func btnPrevImage(_ sender: UIButton) {
        numImage = numImage - 1
        if (numImage < 1) {
            numImage = maxImage
        }
        
        let imageName = String(numImage) + ".png"
        imgGallery.image = UIImage(named:imageName)
    }
    
    @IBAction func btnNextImage(_ sender: UIButton) {
        numImage = numImage + 1
        if (numImage > maxImage) {
            numImage = 1
        }
        
        let imageName = String(numImage) + ".png"
        imgGallery.image = UIImage(named:imageName)
    }
}

