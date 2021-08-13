//
//  FxBtnView.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 27/07/2021.
//

import UIKit

class FxBtnView: UIScrollView {
    
    let mySynth = Synth.shared
    let colorCode = SynthColorCode()
    
    @IBAction func btnHermonizerAction(_ sender: UIButton) {
        if sender.alpha != 1 {
            sender.alpha = 1
            mySynth.hermonizerOnOff(true)
        } else {
            sender.alpha = 0.5
            mySynth.hermonizerOnOff(false)
        }
    }
    
    @IBAction func btnDistAction(_ sender: UIButton) {
        if sender.alpha != 1 {
            sender.alpha = 1
            mySynth.distOnOff(isOn: true)
        } else {
            sender.alpha = 0.5
            mySynth.distOnOff(isOn: false)
        }
    }
    
    @IBAction func btnModAction(_ sender: UIButton) {
        if sender.alpha != 1 {
            sender.alpha = 1
            mySynth.modOnOff(isOn: true)
        } else {
            sender.alpha = 0.5
            mySynth.modOnOff(isOn: false)
        }
    }
    
    @IBAction func btnRevAction(_ sender: UIButton) {
        if sender.alpha != 1 {
            sender.alpha = 1
            mySynth.reverbOnOff(isOn: true)
        } else {
            sender.alpha = 0.5
            mySynth.reverbOnOff(isOn: false)
        }
    }
    
    @IBAction func btnDlyAction(_ sender: UIButton) {
        if sender.alpha != 1 {
            sender.alpha = 1
            mySynth.delayOnOff(isOn: true)
        } else {
            sender.alpha = 0.5
            mySynth.delayOnOff(isOn: false)
        }
    }
    
    @IBAction func btnEQAction(_ sender: UIButton) {
        if sender.alpha != 1 {
            sender.alpha = 1
            mySynth.eqOnOff(isOn: true)
        } else {
            sender.alpha = 0.5
            mySynth.eqOnOff(isOn: false)
        }
    }
        
    func loadFxBtns(){
        
        let btnPitch:UIButton = roundedBtn(title: "Pitch", backgroundColor: colorCode.synthColorCode(.pitch), alpha: 0.5)
        let btnDist:UIButton = roundedBtn(title: "Dist", backgroundColor: colorCode.synthColorCode(.distoration), alpha: 0.5)
        let btnMod:UIButton = roundedBtn(title: "Mod", backgroundColor: colorCode.synthColorCode(.modulation), alpha: 0.5)
        let btnRev:UIButton = roundedBtn(title: "Rev", backgroundColor: colorCode.synthColorCode(.reverb), alpha: 0.5)
        let btnDly:UIButton = roundedBtn(title: "Dly", backgroundColor: colorCode.synthColorCode(.delay), alpha: 0.5)
        let btnEQ:UIButton = roundedBtn(title: "EQ", backgroundColor: colorCode.synthColorCode(.eq), alpha: 0.5)
        
        btnPitch.addTarget(self, action: #selector(btnHermonizerAction), for: .touchUpInside)
        btnDist.addTarget(self, action: #selector(btnDistAction), for: .touchUpInside)
        btnMod.addTarget(self, action: #selector(btnModAction), for: .touchUpInside)
        btnRev.addTarget(self, action: #selector(btnRevAction), for: .touchUpInside)
        btnDly.addTarget(self, action: #selector(btnDlyAction), for: .touchUpInside)
        btnEQ.addTarget(self, action: #selector(btnEQAction), for: .touchUpInside)
        
        self.contentSize = CGSize(width: 100, height: 490)
        
        let stack = UIStackView(arrangedSubviews: [btnPitch,btnDist,btnMod,btnRev,btnDly,btnEQ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .fillEqually
        stack.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        stack.isUserInteractionEnabled = true

        self.addSubview(stack)
        
        var stackConstraint =  [stack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                  stack.widthAnchor.constraint(equalTo: self.widthAnchor,constant: -32)]
        
        if (UIDevice.current.userInterfaceIdiom == .pad) {
            print("We are in a ipad device")
            self.contentSize = CGSize(width: 100, height: 650)
            stackConstraint.append(stack.centerYAnchor.constraint(equalTo: self.centerYAnchor))
            stackConstraint.append(stack.heightAnchor.constraint(equalToConstant: 650))
             stack.spacing = 48
        } else {
            print("We are in a phone device")
            stackConstraint.append(stack.heightAnchor.constraint(equalToConstant: 490))
        }
        
        NSLayoutConstraint.activate(stackConstraint)
        
    }
    
    func roundedBtn(title:String, backgroundColor: UIColor, alpha: CGFloat) -> UIButton {
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
