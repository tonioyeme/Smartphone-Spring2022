//
//  ViewController.swift
//  Segue Example
//
//  Created by FordToni on 2022/2/6.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtDate: UITextField!
    
    @IBOutlet weak var txtWeather: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goToSecondVC(_ sender: Any) {
        
        performSegue(withIdentifier: "segueToSecondVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToSecondVC" {
            
            let secondVC = segue.destination as! SecondViewController
            
            secondVC.todayStr = "Today is \(txtDate.text!), \(txtWeather.text!)"
            
        }
    }
    
}

