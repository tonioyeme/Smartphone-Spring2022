//
//  SecondViewController.swift
//  Segue Example
//
//  Created by FordToni on 2022/2/6.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var lblToday: UILabel!
    var todayStr = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblToday.text = todayStr

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    

}
