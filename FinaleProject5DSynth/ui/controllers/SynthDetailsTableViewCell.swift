//
//  SynthDetailsTableViewCell.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 11/08/2021.
//

import UIKit

class ModelsDetailsTableViewCell: UITableViewCell {
    

    @IBOutlet weak var sliderOutlet: UISlider!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    
    @IBAction func sliderAction(_ sender: UISlider) {
        valueLabel.text = String(sender.value)
    }

    func setModelCell(synthSettingList:DataSourceBuilder){
        
        titleLabel.text = synthSettingList.title
        
        
    }


}
