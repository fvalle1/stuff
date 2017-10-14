//
//  ViewController.swift
//  test
//
//  Created by Filippo Valle on 18/06/17.
//  Copyright © 2017 Filippo Valle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    var timePressed:Double=0
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func pressed(_ sender: Any) {
        timePressed+=1
        label.text=String(timePressed)
    }
    
    @IBAction func SendNotification(_ sender: Any) {
        let trigger = "notifica"
        let IFTTTkey = "95ZnJdPvDZmBx8yfEy6WL"
        let url = "https://maker.ifttt.com/trigger/"+trigger+"/with/key/"+IFTTTkey
        let manager = ApiManager(url:url)
        manager.Call()
        
        textField.text="notification sent"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

