//
//  Property.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 05/08/2021.
//

import Foundation
import AudioKit

struct Property: Codable {
    var title:String
    var value: Float?
    var table: String?
    
    init(title:String,value: AUValue? = nil,table: String? = nil) {
        self.title = title
        self.value = value
        self.table = table
    }
    
}
