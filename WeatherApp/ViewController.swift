//
//  ViewController.swift
//  WeatherApp
//
//  Created by Hoàng Tuấn on 7/3/19.
//  Copyright © 2019 Hoàng Tuấn. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SCLAlertView

class ViewController: UIViewController {
    
    @IBOutlet weak var txfCityName: UITextField!
    
    @IBOutlet weak var lblCityName: UILabel!
    @IBOutlet weak var btnSearch: UIButton!
    
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var imgWeather: UIImageView!
    @IBOutlet weak var lblCountry: UILabel!
    var arrRes = [[String : Any]]()
    
    /*http://openweathermap.org/img/w/09d.png */ /*https://api.openweathermap.org/data/2.5/weather?q=Haiphong&units=metric&appid=83bcc717e4a76c07879e4df5c375cd23&fbclid=IwAR2Y1edr-c0z6_21oalLMprJGX5NbAkrvE9iUkihftLQzbzQNRroH4vGtRU */
    //ABC
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    func setupView(){
        btnSearch.layer.cornerRadius = 5
        btnSearch.clipsToBounds = true
        btnSearch.layer.borderColor = UIColor.white.cgColor
        btnSearch.layer.borderWidth = 1
    }
    func fetchData(string: String){
        Alamofire.request("https://api.openweathermap.org/data/2.5/weather?q="+"\(string)" + "&units=metric&appid=83bcc717e4a76c07879e4df5c375cd23&fbclid=IwAR2Y1edr-c0z6_21oalLMprJGX5NbAkrvE9iUkihftLQzbzQNRroH4vGtRU").responseJSON{ (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                    
                if let resData = swiftyJsonVar["contacts"].arrayObject {
                    self.arrRes = resData as! [[String:AnyObject]]
                    }
                }
            }
    }
    @IBAction func touchSearch(_ sender: Any) {
        if txfCityName.text == nil {
            let _ : SCLAlertViewResponder = SCLAlertView().showWarning("Notification", subTitle: "Please enter city name!")
        } else{
        fetchData(string: txfCityName.text!)
            
        }
    }
    
}




