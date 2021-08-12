//
//  TableCellElements.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 12/08/2021.
//

import UIKit

struct TableCellElements {
    
    var title:String
    var value:String
    var slider:UISlider
    
    init(title:String,value:String,slider:UISlider) {
        self.title = title
        self.value = value
        self.slider = slider
    }
    
}
