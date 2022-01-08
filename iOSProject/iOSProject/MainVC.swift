//
//  MainVC.swift
//  iOSProject
//
//  Created by CTIS Student on 15.12.2021.
//  Copyright © 2021 CTIS. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    var counter = 3
    var timer = Timer()
    
    @IBOutlet weak var longClickWarning: UILabel!
    @IBOutlet weak var aboutBtn: UIButton!
    
    @objc func longPressed(sender: UILongPressGestureRecognizer) {
            performSegue(withIdentifier: "aboutID" , sender: self)
    }
    
    @IBAction func oneClickAboutBtn(_ sender: UIButton) {
        counter = 3
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MainVC.countDown), userInfo: nil, repeats: true)
    }
    
    
    // Function for timer
    @objc func countDown() {
        counter = counter - 1
        
        if counter > 0 {
            longClickWarning.text = "Please Long Click"
        }
        if counter == 0 {
            timer.invalidate()
            longClickWarning.text = ""
        }
        
    }
        
    @IBAction func unwindToMainVC(_ unwindSegue: UIStoryboardSegue) {
        _ = unwindSegue.source
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressed))
        aboutBtn.addGestureRecognizer(longPressRecognizer)
        
    }
    
}

