//
//  ViewController.swift
//  TestWeatherApp
//
//  Created by Sergio Cavero Diaz on 16/07/2018.
//  Copyright © 2018 Sergio Cavero Diaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var mainInfo: UILabel!
    @IBOutlet weak var wind: UILabel!
    @IBOutlet weak var descrip: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var bannerImage: UIImageView!
    
    
    var done = false
    var document: WeatherDocument?
    var city : String = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBanner(city: city)
        makeGetCall()
        repeat{
            RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.1))
        }while !done
        let tempe = (self.document?.main?.temp!)! - 273.15
        let tempeMax = (self.document?.main?.temp_max!)! - 273.15
        let tempeMin = (self.document?.main?.temp_min!)! - 273.15
        temp.text = temp.text! + "  " + String(format:"%.1f", tempe)
        mainInfo.text = mainInfo.text! + "  " + (self.document?.weather![0].main)!
        wind.text = wind.text! + "  " + String(format:"%.1f", (self.document?.wind?.speed!)!)
        descrip.text = self.document?.weather![0].description
        maxTemp.text = maxTemp.text! + "  " + String(format:"%.1f", tempeMax)
        minTemp.text = minTemp.text! + "  " + String(format:"%.1f", tempeMin)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeGetCall() {
        let jsonUrlString = "http://api.openweathermap.org/data/2.5/weather?q=" + city + "&appid=f0d10597634568abee813f68138452fd"
        guard let url = URL(string: jsonUrlString) else {
            print("Error: cannot create URL")
            return
            
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {
                print("Error: did not receive data")
                return
            }
            do {
                
                self.document = try JSONDecoder().decode(WeatherDocument.self, from: data)
                self.done = true
                print(self.document!)
                print("========================INIT===============================")
                print(self.document?.main?.temp! ?? "No temp")
                print(self.document?.weather![0].description ?? "No info")
                print(self.document?.wind?.speed ?? "No wind")
                print("==========================END===============================")
                print(self.document?.weather![0].main ?? "No main info")
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
            
            
            }.resume()
    }
    
    
    func setBanner(city: String){
        switch city {
        case "Leeds":
            bannerImage.image = #imageLiteral(resourceName: "Leeds")
        case "London,uk":
            bannerImage.image = #imageLiteral(resourceName: "London")
        default:
            bannerImage.image = nil
        }
    }
    
    
    
}

