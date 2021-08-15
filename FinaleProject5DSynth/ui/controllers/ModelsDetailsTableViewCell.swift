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
    
    var waveform:String = TableToStrnig.sine.rawValue
    var rounded:Bool = false
    var onOff:Bool = false
    var model:ModelsListItems = .synthType
    
    @IBAction func sliderAction(_ sender: UISlider) {
        
        let value = sender.value
        
        if rounded {
            let roundedValue = round(value)
            sliderOutlet.value = roundedValue
            valueLabel.text = waveform
            setValue(value:roundedValue, onOff:onOff)
        } else {
            valueLabel.text = String(format: "%.2f", value)
            setValue(value:value, onOff:onOff)
        }
        
    }
    
    func setModelCell(modelsDataSourceBuilder:ModelsDataSourceBuilder){
        valueLabel.text = ""
        sliderOutlet.value = 0
        rounded = false
        model = modelsDataSourceBuilder.model
        titleLabel.text = modelsDataSourceBuilder.title
        sliderOutlet.minimumValue = modelsDataSourceBuilder.minValue
        sliderOutlet.maximumValue = modelsDataSourceBuilder.maxValue
        if modelsDataSourceBuilder.rounded ?? false {
            rounded = true
        }
        
    }
    
    
}

/*
 let step: Float = 1
 let roundedValue = round(value / step) * step
 */
