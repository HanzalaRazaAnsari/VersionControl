//
//  ViewController.swift
//  VersionAction
//
//  Created by Hanzala Raza on 09/07/2021.
//

import UIKit

class ViewController: UIViewController ,justToGetStart{
    

    
    
    
    func initialFunc() {
        view.backgroundColor = .red
    }
    
    var firstVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
    
//    var firstVC = SecondViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstVC.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func moveForward( _ sender:UIButton){
        self.navigationController?.pushViewController(firstVC, animated: true)
    }


}





protocol justToGetStart : AnyObject {
    func initialFunc()
    func changeTheButtonTitle()
}

extension justToGetStart {
    func changeTheButtonTitle(){
        
    }
}

