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

class ViewController: UIViewController {
    let URLBase = "https://pokeapi.co/api/v2/pokemon/"
    @IBOutlet var userinput: UITextField!
    @IBOutlet var textView: UITextView!
    @IBAction func searchTapped(_ sender: Any) {
        // turn off keyboard
        userinput.resignFirstResponder()
        
        //verification
        guard let pokeName = userinput.text,
            userinput.text != " "else{
            return
        }
        let pokeNameURLComponent = pokeName.replacingOccurrences(of: " ", with: "")
        let requestURLComponet = URLBase + pokeNameURLComponent + "/"
    }
}

