//
//  NodeObject.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 05/08/2021.
//

import Foundation

struct NodeObject: Codable {
    var name:String
    var properties:[Property]?
    var isSelected:Bool
    
    init(name:String,properties:[Property]? = nil,isSelected:Bool){
        
        self.name = name
        self.properties = properties
        self.isSelected = isSelected
    }
    
}
