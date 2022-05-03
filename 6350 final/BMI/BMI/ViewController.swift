//
//  ViewController.swift
//  BMI
//
//  Created by FordToni on 2022/5/3.
//

import UIKit

class ViewController: UIViewController {
    var Weight : Int?
    var Height : Int?

    
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet weak var txtWeight: UITextField!
    
    
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var txtHeight: UITextField!
    
    
    @IBOutlet weak var lblBMI: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guard let Weight = Weight else {return}
        guard let Height = Height else {return}
        
        txtWeight.text = String(Weight)
        txtHeight.text = String(Height)
    }
    
    
    @IBAction func calculateBMI(_ sender: Any) {
        if Weight != nil{
            if Height != nil{
                lblBMI.text = String((Weight ?? 150/((Height!)^2))*703)
            }
        }else{
            print("invalid input")
        }
        
        
    }
    
    

}

