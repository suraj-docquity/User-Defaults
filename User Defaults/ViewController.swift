//
//  ViewController.swift
//  User Defaults
//
//  Created by Suraj Jaiswal on 09/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    var isDarkMode : Bool = false
    var name : String = ""

    @IBOutlet weak var ModeToggler: UISegmentedControl!
    @IBOutlet weak var EditText: UITextField!
    @IBOutlet weak var SaveBtn: UIButton!
    

    // ------------ User Default Keys ------------

    struct Keys {
        static let prefDarkMode = "prefDarkMode"
        static let prefSavedName = "prefSavedName"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chkPref()
    }

    // ------------ Action Handlers ------------

    @IBAction func SaveBtn(_ sender: Any) {
        
        isDarkMode = ModeToggler.selectedSegmentIndex == 1
        saveStylePref()
        
        name = EditText.text ?? ""
        if (!name.isEmpty){
            savePrefName()
        }
        
    }
    
    @IBAction func modeToggler(_ sender: UISegmentedControl) {
        isDarkMode = ModeToggler.selectedSegmentIndex == 1
        updateStyle()
    }
    
    // ------------ Saving view elements preferences ------------
    
    func saveStylePref(){
        defaults.set(isDarkMode, forKey: Keys.prefDarkMode)
    }
    
    func savePrefName(){
        defaults.set(name, forKey: Keys.prefSavedName)
    }
    
    // ------------ Checking Preferences ------------
    
    func chkPref(){
        isDarkMode = defaults.bool(forKey: Keys.prefDarkMode)
        if (isDarkMode){
            ModeToggler.selectedSegmentIndex = 1
        }
        updateStyle()
        
        name = defaults.string(forKey: Keys.prefSavedName) ?? ""
        print(name)
        updateName()
        
    }
    
    // ------------ updating view elements ------------
    
    func updateStyle(){
        if(isDarkMode){
            self.view.backgroundColor = UIColor.black
        }else{
            self.view.backgroundColor = UIColor.white
        }
    }
    
    func updateName(){
        EditText.text = name
    }
     
}

