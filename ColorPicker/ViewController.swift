//
//  ViewController.swift
//  ColorPicker
//
//  Created by Lambda_School_Loaner_201 on 11/20/19.
//  Copyright © 2019 Christian Lorenzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Best way to change the colors:
    @IBAction func changeColor(_ sender: ColorWheel) {

        //view.backgroundColor = sender.color
        
        button.setTitleColor(sender.color, for: .normal)
        bottomView.backgroundColor = sender.color
    }
    
    @IBAction func touchUpOutside(_ sender: ColorWheel) {
        
        //view.backgroundColor = sender.color
    }
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var bottomView: UIView!
    
    
    //Another way of doing it: Not very good.
    @IBAction func userTappedWheel(_ sender: ColorWheel) {
        //view.backgroundColor = sender.color
    }
}

