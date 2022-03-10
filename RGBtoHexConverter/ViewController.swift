//
//  ViewController.swift
//  RGBtoHexConverter
//
//  Created by Murat Gültürk on 08.03.22.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var txtRed: UITextField!
    @IBOutlet weak var txtGreen: UITextField!
    @IBOutlet weak var txtBlue: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var btnConvert: UIButton!
    @IBOutlet weak var lblSelectedColor: UILabel!
    var selectedIndex : Int = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        selectedIndex = sender.selectedSegmentIndex
        lblResult.text?.removeAll()
        txtRed.text?.removeAll()
        txtBlue.text?.removeAll()
        txtGreen.text?.removeAll()
        lblSelectedColor.backgroundColor = UIColor.white

        if selectedIndex == 0{
            btnConvert.setTitle("RGB - HEX konvertieren", for: UIControl.State.normal)
        }else{
            btnConvert.setTitle("HEX - RGB konvertieren", for: UIControl.State.normal)
        }
    }

    @IBAction func btnConvertClicked(_ sender: UIButton) {

        if selectedIndex == 0{
            // RGB to HEX convert
            convertRGBtoHEX()
        }else{
            // HEX to RGB convert
            convertHEXtoRGB()
        }
    }

    func convertRGBtoHEX(){
        guard let redValue = UInt8(txtRed.text!) else {return}
        guard let greenValue = UInt8(txtGreen.text!) else {return}
        guard let blueValue = UInt8(txtBlue.text!) else {return}

                    // Hex format assing, %2 = tens. X to Hex
                    let redHex = String(format: "%2X", redValue)
                    let greenHex = String(format: "%2X", greenValue)
                    let blueHex = String(format: "%2X", blueValue)

                    lblResult.text = "HEX Color : #\(redHex)\(greenHex)\(blueHex)"
                    lblSelectedColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
}

    func convertHEXtoRGB(){
        guard let redValue = UInt8(txtRed.text!, radix: 16) else {return}
        guard let greenValue = UInt8(txtGreen.text!, radix: 16) else {return}
        guard let blueValue = UInt8(txtBlue.text!, radix: 16) else {return}


                    lblResult.text = "RED : \(redValue) \n GREEN : \(greenValue) \n BLUE : \(blueValue)"
                    lblSelectedColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
    }

}
