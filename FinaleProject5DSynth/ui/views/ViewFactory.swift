//
//  ViewFactors.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 27/07/2021.
//

import UIKit

class ViewFactory{
    
    static func roundedBtn(title:String, backgroundColor: UIColor, alpha: CGFloat) -> UIButton {
        let btn = UIButton()
        let attributes = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20), NSAttributedString.Key.foregroundColor : UIColor.black]
        btn.setAttributedTitle(NSAttributedString(string: title, attributes: attributes), for: .normal)
        btn.backgroundColor = backgroundColor
        btn.layer.cornerRadius = 34
        btn.contentMode = .center
        btn.alpha = alpha

        btn.layer.borderWidth = 1.0
        btn.layer.borderColor = UIColor.black.cgColor
        btn.contentEdgeInsets = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        return btn
    }
}
