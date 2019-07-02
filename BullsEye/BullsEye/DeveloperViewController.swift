//
//  DeveloperViewController.swift
//  BullsEye
//
//  Created by Vibhor Gupta on 8/12/18.
//

import UIKit

class DeveloperViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        image.image = #imageLiteral(resourceName: "Image.jpg")
        
        // Do any additional setup after loading the view.
    }


    
    @IBAction func closeButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
