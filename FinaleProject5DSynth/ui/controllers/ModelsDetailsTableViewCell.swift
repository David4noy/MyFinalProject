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
    var rounded:Bool = false
    var model:ModelsListItems = .synthType
    
    
    @IBAction func sliderAction(_ sender: UISlider) {
        
        if rounded {
            let step: Float = 1
            let roundedValue = round(sliderOutlet.value / step) * step
            sliderOutlet.value = roundedValue
            valueLabel.text = String(format: "%.2f", roundedValue)
        } else {
            valueLabel.text = String(format: "%.2f", sender.value)
        }
    }
    
    func setModelCell(modelsDataSourceBuilder:ModelsDataSourceBuilder){
        
        model = modelsDataSourceBuilder.model
        titleLabel.text = modelsDataSourceBuilder.title
        sliderOutlet.minimumValue = modelsDataSourceBuilder.minValue
        sliderOutlet.maximumValue = modelsDataSourceBuilder.maxValue
        if modelsDataSourceBuilder.rounded {
            rounded = true
        }
        
    }
    
    
}
