//
//  ViewController.swift
//  RGBtoHexConverter
//
//  Created by Mert Furkan Doğan on 21.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtRed: UITextField!
    @IBOutlet weak var txtGreen: UITextField!
    @IBOutlet weak var txtBlue: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var btnConvert: UIButton!
    @IBOutlet weak var lblSelectColor: UILabel!
    var secilenIndex : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Clear(_ sender: Any) {
        lblResult.text?.removeAll()
        txtRed.text?.removeAll()
        txtGreen.text?.removeAll()
        txtBlue.text?.removeAll()
        lblSelectColor.backgroundColor = UIColor.white
        
    }
    
    
    
    
    @IBAction func segmentChange(_ sender: UISegmentedControl) {
//        lblResult.text?.removeAll()
//        txtRed.text?.removeAll()
//        txtGreen.text?.removeAll()
//        txtBlue.text?.removeAll()
//        lblSelectColor.backgroundColor = UIColor.white
        
        secilenIndex = sender.selectedSegmentIndex
        if secilenIndex == 0 {
            btnConvert.setTitle("RGB - HEX ÇEVİR", for: UIControl.State.normal)
        } else {
            btnConvert.setTitle("HEX - RGB ÇEVİR", for: UIControl.State.normal)
        }
        
    }
    
    
    
    @IBAction func btnConvertClick(_ sender: UIButton) {
        if secilenIndex == 0 {
            //RGB TO HEX
            convertRGBtoHex()
        } else {
            // HEX TO RGB
            convertHextoRGB()
        }
        
    }
    func convertRGBtoHex () {
       //GUARD LET
        guard let redValue = UInt8(txtRed.text!) else {return}
        guard let greenValue = UInt8(txtGreen.text!) else {return}
        guard let blueValue = UInt8(txtBlue.text!) else {return}
                    
                    //buraya kadar gelinirse kullanıcı değerleri düzgün şekilde girmiştir
                    
                    let redHex = String(format: "%2X", redValue)
                    let greenHex = String(format: "%2x", greenValue)
                    let blueHex = String(format: "%2x", blueValue)
                    
                    lblResult.text = "HEX Color : #\(redHex)\(greenHex)\(blueHex)"
                    lblSelectColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
        
        
          
        
    }
    func convertHextoRGB () {
    
        guard let redValue = UInt8(txtRed.text!, radix: 16) else {return}
        guard let greenValue = UInt8(txtGreen.text!, radix: 16) else {return}
        guard let blueValue = UInt(txtBlue.text!, radix: 16 )else {return}
                    
                    lblResult.text = "RED : \(redValue) GREEN : \(greenValue) BLUE : \(blueValue)"
                    lblSelectColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
                    
                
        
        
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)

    }
    
}

