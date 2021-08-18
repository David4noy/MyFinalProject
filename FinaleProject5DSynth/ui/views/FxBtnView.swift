//
//  FxBtnView.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 27/07/2021.
//

import UIKit

class FxBtnView: UIScrollView {
    
    let mySynth = Synth.shared
    
    let data = CoreDataManager.shared.getSynthDataSettings()
    let save = CoreDataManager.shared
    
    let colorCode = SynthColorCode()
    var pitchAlpha: CGFloat = 0.5
    var distAlpha: CGFloat = 0.5
    var modAlpha: CGFloat = 0.5
    var revAlpha: CGFloat = 0.5
    var dlyAlpha: CGFloat = 0.5
    var eqAlpha: CGFloat = 0.5
    
    @IBAction func btnHermonizerAction(_ sender: UIButton) {
        if sender.alpha != 1 {
            sender.alpha = 1
            mySynth.hermonizerOnOff(true)
            data?.hermonizerOnOff = true
            save.saveContext()
        } else {
            sender.alpha = 0.5
            mySynth.hermonizerOnOff(false)
            data?.hermonizerOnOff = false
            save.saveContext()
        }
    }
    
    @IBAction func btnDistAction(_ sender: UIButton) {
        if sender.alpha != 1 {
            sender.alpha = 1
            mySynth.distOnOff(isOn: true)
            data?.distOnOff = true
            save.saveContext()
        } else {
            sender.alpha = 0.5
            mySynth.distOnOff(isOn: false)
            data?.distOnOff = false
            save.saveContext()
        }
    }
    
    @IBAction func btnModAction(_ sender: UIButton) {
        if sender.alpha != 1 {
            sender.alpha = 1
            mySynth.modOnOff(isOn: true)
            data?.modOnOff = true
            save.saveContext()
        } else {
            sender.alpha = 0.5
            mySynth.modOnOff(isOn: false)
            data?.modOnOff = false
            save.saveContext()
        }
    }
    
    @IBAction func btnRevAction(_ sender: UIButton) {
        if sender.alpha != 1 {
            sender.alpha = 1
            mySynth.reverbOnOff(isOn: true)
            data?.reverbOnOff = true
            save.saveContext()
        } else {
            sender.alpha = 0.5
            mySynth.reverbOnOff(isOn: false)
            data?.reverbOnOff = false
            save.saveContext()
        }
    }
    
    @IBAction func btnDlyAction(_ sender: UIButton) {
        if sender.alpha != 1 {
            sender.alpha = 1
            mySynth.delayOnOff(isOn: true)
            data?.delayOnOff = true
            save.saveContext()
        } else {
            sender.alpha = 0.5
            mySynth.delayOnOff(isOn: false)
            data?.delayOnOff = false
            save.saveContext()
        }
    }
    
    @IBAction func btnEQAction(_ sender: UIButton) {
        if sender.alpha != 1 {
            sender.alpha = 1
            mySynth.eqOnOff(isOn: true)
            data?.eqOnOff = true
            save.saveContext()
        } else {
            sender.alpha = 0.5
            mySynth.eqOnOff(isOn: false)
            data?.eqOnOff = false
            save.saveContext()
        }
    }
        
    func loadFxBtns(){
        
        print("Enter/////////////////")
        
        let her = data?.hermonizerOnOff
        
        if let pitchData = her {
            pitchAlpha = pitchData ? 1 : 0.5
        } else {
            pitchAlpha = 0.5
            print("else/////////////////")
        }
        
        if let distData = data?.distOnOff {
            distAlpha = distData ? 1 : 0.5
        } else {
            distAlpha = 0.5
        }
        
        
        if let modData = data?.modOnOff {
            modAlpha = modData ? 1 : 0.5
        } else {
            modAlpha = 0.5
        }
        
        if let revData = data?.reverbOnOff {
            revAlpha = revData ? 1 : 0.5
        } else {
            revAlpha = 0.5
        }
        
        if let dlyData = data?.delayOnOff {
            dlyAlpha = dlyData ? 1 : 0.5
        } else {
            dlyAlpha = 0.5
        }
        
        if let eqData = data?.eqOnOff {
            eqAlpha = eqData ? 1 : 0.5
        } else {
            eqAlpha = 0.5
        }
        
        print(eqAlpha,"eqAlpha/////////////////")
        
        let btnPitch:UIButton = roundedBtn(title: "Pitch", backgroundColor: colorCode.synthColorCode(.pitch), alpha: pitchAlpha)
        let btnDist:UIButton = roundedBtn(title: "Dist", backgroundColor: colorCode.synthColorCode(.distoration), alpha: distAlpha)
        let btnMod:UIButton = roundedBtn(title: "Mod", backgroundColor: colorCode.synthColorCode(.modulation), alpha: modAlpha)
        let btnRev:UIButton = roundedBtn(title: "Rev", backgroundColor: colorCode.synthColorCode(.reverb), alpha: revAlpha)
        let btnDly:UIButton = roundedBtn(title: "Dly", backgroundColor: colorCode.synthColorCode(.delay), alpha: dlyAlpha)
        let btnEQ:UIButton = roundedBtn(title: "EQ", backgroundColor: colorCode.synthColorCode(.eq), alpha: eqAlpha)
        
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
