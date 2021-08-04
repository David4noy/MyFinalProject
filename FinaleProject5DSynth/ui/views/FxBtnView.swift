//
//  FxBtnView.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 27/07/2021.
//

import UIKit

class FxBtnView: UIScrollView {
    
    let mySynth = Synth.shared
    
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
       //     mySynth.eqOnOff(isOn: true)
        } else {
            sender.alpha = 0.5
           // mySynth.eqOnOff(isOn: false)
        }
    }
    
    fileprivate var btnAutoWah:UIButton = {
        return ViewFactory.roundedBtn(title: "Pitch", backgroundColor: .systemPurple, alpha: 0.5)
    }()
    
    fileprivate var btnDist:UIButton = {
        return ViewFactory.roundedBtn(title: "Dist", backgroundColor: .systemOrange, alpha: 0.5)
    }()
   
    fileprivate var btnMod:UIButton = {
        return ViewFactory.roundedBtn(title: "Mod", backgroundColor: .systemBlue, alpha: 0.5)
    }()
    
    fileprivate var btnRev:UIButton = {
        return ViewFactory.roundedBtn(title: "Rev", backgroundColor: .systemRed, alpha: 0.5)
    }()
    
    fileprivate var btnDly:UIButton = {
        return ViewFactory.roundedBtn(title: "Dly", backgroundColor: .systemGreen, alpha: 0.5)
    }()
    
    fileprivate var btnEQ:UIButton = {
        return ViewFactory.roundedBtn(title: "EQ", backgroundColor: .systemYellow, alpha: 0.5)
    }()


    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
    super.init(coder: coder)
    }
    
        
    func loadFxBtns(){
        
        btnAutoWah.addTarget(self, action: #selector(btnHermonizerAction), for: .touchUpInside)
        btnDist.addTarget(self, action: #selector(btnDistAction), for: .touchUpInside)
        btnMod.addTarget(self, action: #selector(btnModAction), for: .touchUpInside)
        btnRev.addTarget(self, action: #selector(btnRevAction), for: .touchUpInside)
        btnDly.addTarget(self, action: #selector(btnDlyAction), for: .touchUpInside)
        btnEQ.addTarget(self, action: #selector(btnEQAction), for: .touchUpInside)
        
        self.contentSize = CGSize(width: 100, height: 490)
        
        let stack = UIStackView(arrangedSubviews: [btnAutoWah,btnDist,btnMod,btnRev,btnDly,btnEQ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .fillEqually
        stack.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        stack.isUserInteractionEnabled = true

        self.addSubview(stack)
        
        var c =  [stack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                  stack.widthAnchor.constraint(equalTo: self.widthAnchor,constant: -32)]
        
        if (UIDevice.current.userInterfaceIdiom == .pad) {
            print("We are in a ipad device")
            self.contentSize = CGSize(width: 100, height: 650)
            c.append(stack.centerYAnchor.constraint(equalTo: self.centerYAnchor))
            c.append(stack.heightAnchor.constraint(equalToConstant: 650))
             stack.spacing = 48
        } else {
            print("We are in a phone device")
            c.append(stack.heightAnchor.constraint(equalToConstant: 490))
        }
        
        NSLayoutConstraint.activate(c)
        
    }
    
    
    
}
