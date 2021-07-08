//
//  SecondViewController.swift
//  VersionAction
//
//  Created by Hanzala Raza on 09/07/2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    weak var delegate : justToGetStart?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttonPressed( _ sender:UIButton){
        delegate?.initialFunc()
        self.navigationController?.popViewController(animated: true)
    }
    

}
