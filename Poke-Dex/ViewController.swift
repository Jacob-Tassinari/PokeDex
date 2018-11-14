//
//  ViewController.swift
//  Poke-Dex
//
//  Created by Jacob Tassinari on 11/12/18.
//  Copyright © 2018 Jacob Tassinari. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import SDWebImage

class ViewController: UIViewController {
    var pokemonNames = [String]()
    let URLBase = "https://pokeapi.co/api/v2/pokemon/"
    @IBOutlet var userinput: UITextField!
    @IBOutlet var textView: UITextView!
    @IBOutlet var picView: UIImageView!
    @IBAction func searchTapped(_ sender: Any) {
        // turn off keyboard
        userinput.resignFirstResponder()
        
        //verification
        guard let pokeName = userinput.text,
            userinput.text != " "else{
            return
        }
        let pokeNameURLComponent = pokeName.replacingOccurrences(of: " ", with: "")
        let requestURL = URLBase + pokeNameURLComponent + "/"
        
        Alamofire.request(requestURL).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                print(value)
                let json = JSON(value)
                if let results = json["results"].array{
                    for result in results{
                        if let pokename = result["name"].string{
                            self.pokemonNames.append(pokeName)
                        }
                    }
                }
                self.textView.text = json["name"].stringValue
                if let spriteURL = json["sprites"]["front_default"].string{
                    if let url = URL(string: spriteURL){
                        self.picView.sd_setImage(with: url, completed: nil)
                    }
                }
               // self.picView = json["sprites"]["front_default"]
            case .failure(let error):
                self.textView.text = "Invaild selection entered or anerror occured. Please try again."
                print(error.localizedDescription)
            }
        }
    }
}

