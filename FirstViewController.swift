//
//  FirstViewController.swift
//  ReproductorMusica
//
//  Created by Adrian Camacho Soriano on 16/04/16.
//  Copyright © 2016 Adrian Camacho Soriano acaso. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var picker: UIPickerView!
    
    var numero: Int!
    var datoapasar: Int = 0
    var dataArray = ["Abracadabra","Czardas","I Don't want to spoil the party","My Sweet Lord","Something Stupid", "Aleatorio"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.picker.dataSource = self
        self.picker.delegate = self
    }
    
    // returns the number of 'columns' to display.
    @available(iOS 2.0, *)
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // returns the # of rows in each component..
    @available(iOS 2.0, *)
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataArray.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataArray[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let datoapasar = row
        print(datoapasar)
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        var pickerlabel = view as! UILabel!
        if view == nil {
            pickerlabel = UILabel()
            // color the label background
            let hue = CGFloat(row)/CGFloat(dataArray.count)
            pickerlabel.backgroundColor = UIColor(hue: hue, saturation: 1.0, brightness: 1.0, alpha: 1.0)
        }
        let titleData = dataArray[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name:"Georgia", size: 26.0)!, NSForegroundColorAttributeName:UIColor.blackColor()])
        pickerlabel.attributedText = myTitle
        pickerlabel.textAlignment = .Center
        return pickerlabel
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 36.0
    }
    
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 300
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let vistaDetalle = segue.destinationViewController as! ViewController
        let datoapasar1 = picker.selectedRowInComponent(datoapasar)
        vistaDetalle.indexSong = datoapasar1
        print("Pasa: \(datoapasar1)")
    }

}
