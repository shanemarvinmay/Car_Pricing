//
//  ExploreViewController.swift
//  VERSUS
//
//  Created by Jazmine N Spann on 3/2/20.
//  Copyright © 2020 Jazmine N Spann. All rights reserved.
//

import Foundation
import UIKit

class ExploreViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    //Validatin for MPG and Mileage will be added on 04/25/20 Section------------------------------------------------------------------------------------------------------------------------------------------------
    @IBOutlet weak var validateMPGtextfield: UITextField!
    @IBOutlet weak var validateMileagetextfield: UITextField!
    @IBAction func validateBtn(_ sender: Any) {
    
    }
    //Create an alert when you calculate value from given inputs----------------------------------------------------------------------------------------------------------------------------------------------------------
    @IBAction func valueCalc(_ sender: UIButton)
    {

        let mpg = validateMPGtextfield.text!
        let mileage = validateMileagetextfield.text!
        let make = pickerTextField.text!
        let model = picker1TextField.text!
        

        //Get request for Car value---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        //Create URL
        let url = URL(string: "https://vast-gorge-25891.herokuapp.com/car-value?make=\(make)&model=\(model)&year=2020&mpg=\(mpg)35&milage=\(mileage)")
        guard let requestUrl = url else { fatalError() }
        
        //Create request for URL
        var request = URLRequest(url: requestUrl)
        
        //Specifying method to use for HTTP
        request.httpMethod = "GET"
        
        //Set Header for HTTP request
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        //Send HTTP request
        let task = URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            
            //Check for errors
            if let error = error {
                print ("Error took place \(error)")
                return
            }
        //Reading HTTP response status code
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
                let allHeaderFields: [AnyHashable : Any] = response.allHeaderFields
                //reads all HTTP response headers
                print("All headers: \(allHeaderFields)")
            }
            //Converting the response data of HTTP to string
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string: \n \(dataString)")
                 }
        }

        task.resume()
}
    //Fix username - work with angelica to figure out a way to get username requested over multple controllers and add years info to stop hard coding
    //POST request ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        // deleted post code
    
    //Picker View Section--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    @IBOutlet weak var pickerTextField: UITextField!
    @IBOutlet weak var picker1TextField: UITextField!
    //content for pickers
    let Make = ["", "Acura", "Alfa Romeo", "Audi", "Bentley", "BMW", "Buick", "Cadillac", "Chevrolet", "Chrysler", "Dodge", "Ferrari", "FIAT", "Ford", "Freightliner", "Genesis", "GMC", "Honda", "Hyundai", "INFINITI", "Jaguar", "Jeep", "Kia", "Lamborghini", "Land Rover", "Lexus", "Lincoln", "Maserati", "MAZDA", "McLaren", "Mercedes-Benz", "MINI", "Mitsubishi", "Nissan", "Porsche", "Ram", "Rolls-Royce", "Smart", "Subaru", "Tesla", "Toyota", "Volkswagon", "Volvo", "NOT LISTED" ]
    let Model = ["", "A", "A4", "A4 allroad", "A5", "A6", "A7", "A8", "Acadia", "Accent", "Accord", "Accord Hybrid", "A-Class", "Altima", "Armade", "Arteon", "Ascent", "Atlas", "ATS", "ATS-V", "Avalon", "Avalon Hybrid", "Aventador", "Aviator", "Beetle", "Bentayga", "Blazer", "Bolt EV", "BRZ", "Cadenza", "Camry", "Camry Hybrid", "Canyon Extended Cab", "Cascada", "Cayenne", "Cayenne Coupe", "C-Class", "Challenger", "Charger", "Cherokee", "C-HR", "Civic", "Civic Type R", "CLA", "Clarity Electric", "Clarity Fuel Cell", "Clarity Plug-in Hybrid", "CLS", "Clubman", "Colorado Crew Cab", "Colorado Extended Cab", "Compass", "Continental", "Convertible", "Corolla", "Corolla Hatchback", "Corolla Hybrid", "Corsair", "Corvette", "Countryman", "Crosstrek", "Cruze", "CR-V", "CT4", "CT5", "CT6", "CT6-V", "CTS", "CTS-V", "CX-3", "CX-30", "CX-5", "CX-9", "Dawn", "DB11", "Discovery", "Discovery Sport", "Durango", "E-Class", "Eclipse Cross", "Ecosport", "Edge", "e-Golf", "Elantra", "Elantra GT", "Enclave", "Encore", "Encore GX", "Envision", "E-Pace", "Equinox", "ES", "Escalade", "Escalade ESV", "Escape", "e-tron", "Expedition", "Expedition Max", "Explorer", "Express 2500 Cargo", "Express 2500 Passenger", "    Express 3500 Cargo", "Express 3500 Passenger", "F150 Regular Cab", "F150 Super Cab", "F150 SuperCrew Cab", "F250 Super Duty Crew Cab", "F250 Super Duty Regular Cab", "F250 Super Duty Super Cab", "F350 Super Duty Crew Cab", "F350 Super Duty Regular Cab", "F350 Super Duty Super Cab", "F450 Super Duty Crew Cab", "F450 Super Duty Regular Cab", "Fiesta", "Fit", "Flex", "Forester", "Forte", "fortwo electric drive", "fortwo electric drive cabrio", "fortwo EQ cabrio", "fortwo EQ coupe", "F-PACE", "Frontier Crew Cab", "Frontier King Cab", "F-TYPE", "Fusion", "Fusion Energi", "Fusion Plug-in Hybrid", "G80", "G90","G-Class", "Ghibli", "Ghost", "Giulia", "GLA", "Gladiator", "GLB", "GLC", "GLC Coupe", "GLE", "GLS", "Golf", "Golf Alltrack", "Golf GTI", "Golf R", "Golf SportWagen", "GR Supra", "Grand Caravan Passenger", "Grand Cherokee", "GranTurismo", "GS", "GTC4Lusso", "GT-R", "GX", "Hardtop 2 Door", "Hardtop 4 Door", "Highlander", "Highlander Hybrid", "HR-V", "Huracan", "i3", "i8", "ILX", "Impala", "Impreza", "Insight", "Ioniq Electric", "Ioniq Hybrid", "Ioniq Plug-in Hybrid", "I-PACE", "IS", "Jetta", "Jetta GLI", "Journey", "K900", "Kicks", "Kona", "Kona Electric", "LaCrosse", "Land Cruiser", "LC", "LEAF", "Legacy", "Levante", "LS", "LX", "M2", "M4", "M5", "M6", "Macan", "Malibu", "Maxima", "MAZDA3", "MAZDA6", "MDX", "MDX Sport Hybrid", "Mercedes-AMG C-Class", "Mercedes-AMG CLA", "Mercedes-AMG CLS", "Mercedes-AMG E-Class", "Mercedes-AMG G-Class", "Mercedes-AMG GLA", "Mercedes-AMG GLC", "Mercedes-AMG GLC Coupe", "Mercedes-AMG GLE", "Mercedes-AMG GLE Coupe", "Mercedes-AMG GLS", "Mercedes-AMG GT", "Mercedes-AMG S-Class", "Mercedes-AMG SL","Mercedes-AMG SLC"," Mercedes-Maybach S-Class", "Metris Cargo","Metris Passenger", " Metris WORKER Cargo", "Metris WORKER Passenger", "Mirage","Mirage G4", "Mirai", "MKC", "MKT", "MKZ", "Model 3", "Model S", "Model X", "Mulsanne", "Murano", "Mustang", "MX-5 Miata", "MX-5 Miata RF","Nautilus”, “Navigator", "Navigator L", "NEXO", "Niro","Niro EV", "Niro Plug-in Hybrid", "NSX", "NV1500 Cargo","NV200","NV2500 HD Cargo", "NV3500 HD Cargo", "NV3500 HD Passenger","NX","Odyssey","Optima","Optima Hybrid","Optima Plug-in Hybrid","Outback","Outlander","Outlander PHEV","Outlander Sport","Pacifica","Pacifica Hybrid","Palisade","Panamera","Passat","Passport","Pathfinder","Phantom","Pilot","Prius","Prius c","Prius Prime","ProMaster Cargo Van","ProMaster City","ProMaster Window Van","Q3","Q5","Q50","Q60","Q7","Q70","Q8","Quattroporte","QX30","QX50","QX60","QX80","R1S","R1T","R8","Range Rover","Range Rover Evoque","Range Rover Sport","Range Rover Velar","Ranger SuperCab","Ranger SuperCrew","RAV4","RAV4 Hybrid","RC","RDX","Regal Sportback","Regal TourX","Renegade","Ridgeline","Rio","RLX","RLX Sport Hybrid","Rogue","Rogue Sport","RS 3","RS 5","RX","S3","S4","S5","S60","S90","Santa Fe","Santa Fe XL","Savana 2500 Cargo","Savana 2500","Passenger","Savana 3500 Cargo","Savana 3500 Passenger","S-Class","Sedona","Seltos","Sentra","Sequoia","Sienna","Sierra 1500 Crew Cab","Sierra 1500 Double Cab","Sierra 1500 Limited Double Cab","Sierra 1500 Regular Cab","Sierra 2500 HD Crew Cab",
        "Sierra 2500 HD Double Cab","Sierra 2500 HD Regular Cab","Sierra 3500 HD Crew Cab","Silverado 1500 Crew Cab","Silverado 1500 LD Double Cab","Silverado 1500 Regular Cab","Silverado 2500 HD Crew Cab","Silverado 2500 HD Double Cab","Silverado 2500 HD Regular Cab","Silverado 3500 HD Crew Cab","SL","SLC","Sonata","Sonata Hybrid", "Sonata Plug-in Hybrid", "Sonic", "Sorento", "Soul","Soul EV", "Spark", "Sportage","Sprinter 2500 Cargo","Sprinter 2500 Cargo","Sprinter 2500 Crew","Sprinter 2500 Crew","Sprinter 2500 Passenger","Sprinter 2500 Passenger","Sprinter 3500 Cargo","Sprinter 3500 Cargo","Sprinter 3500 XD Cargo","Sprinter 3500XD Cargo","SQ5","Stelvio","Stinger","Suburban","Tacoma Access Cab","Tacoma Double Cab", "Tahoe", "Taurus", "Taycan", "Telluride", "Terrain", "Tiguan","Titan Crew Cab","Titan King Cab","TITAN Single Cab","TITAN XD Crew Cab","TITAN XD King Cab","TITAN XD Single Cab","TLX","Trailblazer" ,"Transit 150 Van","Transit 150 Wagon","Transit 250 Van","Transit 350 HD Van","Transit 350 Van","Transit 350 Wagon","Transit Connect Cargo", "Transit Connect Cargo Van","Transit Connect Passenger","Transit Connect Passenger Wagon","Traverse","Trax","TT","Tucson","Tundra CrewMax", "Tundra Double Cab","UX","V60","V90","Veloster","Venue","Versa","Versa Note","Volt","Voyager","Wraith","Wrangler","Wrangler Unlimited","WRX","X1","X2","X3","X4","X5","X6","X6 M","X7","XC40","XC60","XC90","XE","XF","XJ","XT4","XT5","XT6","XTS","Yaris","Yaris Hatchback", "Yukon","Yukon XL","Z4","124 Spider","1500 Classic Crew Cab","1500 Classic Quad Cab","1500 Classic Regular Cab","1500 Crew Cab", "1500 Quad Cab","2 Series","2500 Crew Cab","2500 Mega Cab","2500 Regular Cab","3 Series","300","3500 Crew Cab","3500 Mega Cab","3500 Regular Cab","370Z","4 Series","488 GTB","488 Spider","4C Spider","4Runner","5 Series","500","500 Abarth","500c","500c Abarth" ,"500e", "500L", "500X", "570GT","570S","6 Series","7 Series","718 Boxster","718 Cayman","720S","8 Series","812 Superfast","86","911"]
      
//Picker View
    let car_PickerView = UIPickerView()
    
    //Hold current data
    var current_arr : [String] = []
    //Hold current text
    var active_textFiled : UITextField!
      
    override func viewDidLoad() {
        super.viewDidLoad()
    
        /* -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
     let response = Validation.shared.validate(values: (ValidationType.mpg, "167"), (ValidationType.mileage, "65,000"))
                  switch response {
                  case .success:
                      break
                  case .failure(_, let message):
                      print(message.localized())
                  }
 ---------------------------------------------------- ----------------------------------------------- --------------------------------------- -------------------------------------- -------------------------------*/
       validateMPGtextfield.delegate = self
        
        //assign delegates
        picker1TextField.delegate = self
        pickerTextField.delegate = self
        
        car_PickerView.delegate = self
        car_PickerView.dataSource = self
        
        picker1TextField.inputView = car_PickerView
        pickerTextField.inputView = car_PickerView
    }
    //TextFieled delegate----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print ("return Pressed ")
        return true
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        active_textFiled = textField
        
        switch textField {
        case pickerTextField:
            current_arr = Make
        case picker1TextField:
            current_arr = Model
        default:
            print("Default")
        }
        car_PickerView.reloadAllComponents()
        return true
    }
    //Mark : Picker View----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return current_arr.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return current_arr[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Selected item is", current_arr[row])
        active_textFiled.text = current_arr[row]
    }
    
     func displayAlert(msgTitle:String, msgContent:String){
               let alertController = UIAlertController(title: msgTitle,message: msgContent, preferredStyle: .alert)
               let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
               alertController.addAction(defaultAction)
               
               present(alertController, animated: true, completion: nil)
           }
            
            func displayText() -> Bool {
                var isdisplayText = true
                var displayMessage = "Missing: "
                
                if (validateMPGtextfield.text!.isEmpty) {
                    isdisplayText = false
                    displayMessage += "Miles Per Gallon"
                }
                if (validateMPGtextfield.text!.isEmpty) {
                    isdisplayText = false
                    displayMessage += "Mileage"
                }
               if (isdisplayText == false) {
                   displayAlert(msgTitle: "Missing Values", msgContent: displayMessage)
               }
               return true
            }

}
