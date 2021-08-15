//
//  SynthDetailsTableViewCell.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 11/08/2021.
//
import AudioKit
import UIKit


class ModelsDetailsTableViewCell: UITableViewCell {
    
    let mySynth = Synth.shared
    
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var onOffSwitchOutlet: UISwitch!
    
    var waveform:String = TableToStrnig.sine.rawValue
    var rounded:Bool = false
    var onOff:Bool = false
    var model:ModelsListItems = .synthType
    
    @IBAction func onOffSwitch(_ sender: UISwitch) {
        onOff = sender.isOn
        setValue(value:0, onOff:onOff)
    }
    @IBAction func sliderAction(_ sender: UISlider) {
        
        let value = sender.value
        
        if rounded {
            let roundedValue = round(value)
            sliderOutlet.value = roundedValue
            
            if model == ModelsListItems.harmonicIntervals{
                valueLabel.text = String(format: "%.2f", roundedValue)
            } else {
                valueLabel.text = waveform
            }
            setValue(value:roundedValue, onOff:onOff)
        } else {
            valueLabel.text = String(format: "%.2f", value)
            setValue(value:value, onOff:onOff)
        }
        
    }
    
    func setModelCell(modelsDataSourceBuilder:ModelsDataSourceBuilder){
        
        // cell reset
        onOffSwitchOutlet.isHidden = true
        valueLabel.isHidden = false
        sliderOutlet.isHidden = false
        rounded = false
        valueLabel.text = ""
        sliderOutlet.value = 0
        onOff = false
        onOffSwitchOutlet.setOn(false, animated: false)
         
        // define values
        model = modelsDataSourceBuilder.model
        titleLabel.text = modelsDataSourceBuilder.title
        sliderOutlet.minimumValue = modelsDataSourceBuilder.minValue
        sliderOutlet.maximumValue = modelsDataSourceBuilder.maxValue
        
        // chaking for layout type
        if modelsDataSourceBuilder.onOff ?? false {
            onOffSwitchOutlet.isHidden = false
            valueLabel.isHidden = true
            sliderOutlet.isHidden = true
        }
        if modelsDataSourceBuilder.rounded ?? false {
            rounded = true
        }
        
    }
    
    
}

/*
 let step: Float = 1
 let roundedValue = round(value / step) * step
 */
