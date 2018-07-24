//
//  MainViewController.swift
//  TestWeatherApp
//
//  Created by Sergio Cavero Diaz on 16/07/2018.
//  Copyright © 2018 Sergio Cavero Diaz. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var city = "Initial string"
    
    @IBOutlet weak var leedsButton: UIButton!
    @IBOutlet weak var londonButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is ViewController
        {
            let vc = segue.destination as? ViewController
            vc?.city = self.city
        }
    }
    
    @IBAction func londonPressed(_ sender: Any) {
        city = "London,uk"
    }
    
    @IBAction func leedsPressed(_ sender: Any) {
        city = "Leeds"
    }
    
}
