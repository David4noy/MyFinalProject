//
//  KeyboardView.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 27/07/2021.
//

import UIKit
import AudioKit
import AudioKitUI

@objc
class KeyboardView: UIView, UIGestureRecognizerDelegate {
    
    let mySynth = Synth.shared
    var octaveMult = 2.0
    var overtoneView = UIView()
    var viewArray:[UIView] = []
    var labelArray:[UILabel] = []
    var notesLabelLoaded = false
    var numberOfNote:Int = 26
    var frequencyLabel:UILabel = UILabel()
        
    let noteColor:[DataSourceBuilder] = DataSourceArrays().noteColor
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    func setOctaveMult(mult:Double){
        octaveMult = mult
    }
    
    func callTouch(){
        let tArr = NSMutableArray()
        tArr.add(UITouch())
        let touch = NSSet()
        touch.adding(tArr)

        touchesBegan(touch as! Set<UITouch>, with: nil)
    }
    
    //***************//
    //MARK: START OF GESTURE
    
    private func multitouchGestureRecognizer(_ gestureRecognizer: MultitouchGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: MultitouchGestureRecognizer) -> Bool {
        
        gestureRecognizer.mode = .stack
        gestureRecognizer.count = 1
        gestureRecognizer.sustain = false
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let firstTouch = touches.first
        setFrequencyToNotes(touch: firstTouch, touchesMod: .touchesBegan)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let firstTouch = touches.first
        setFrequencyToNotes(touch: firstTouch, touchesMod: .touchesMoved)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let firstTouch = touches.first
        setFrequencyToNotes(touch: firstTouch, touchesMod: .touchesEnded)
    }
    
    func setFrequencyToNotes(touch:UITouch?, touchesMod:TouchesMod){
        
        guard let xPosition = touch?.location(in: self).x else {
            return
        }
        
        guard let yPosition = touch?.location(in: overtoneView).y else {
            return
        }
        
        var mix = 0.0
        if yPosition <= overtoneView.bounds.maxY {
            mix = Double((overtoneView.bounds.maxY - yPosition) / overtoneView.frame.maxY * 100) + 20.0
            mySynth.overtoneMixChange(mix: AUValue(mix))
        } else {
            mix = 0
            mySynth.overtoneMixChange(mix: AUValue(mix))
        }
        
        let note = Notes(totalXOfView: Double(self.bounds.maxX), numberOfNote: numberOfNote)
        
        let frequency = note.getNote(touchPoint: Double(xPosition)) * octaveMult
                
        showFrequency(frequency: frequency)
        
        mySynth.setNoteFrequency(AUValue(frequency))
        
        switch touchesMod {
        case .touchesBegan:
            mySynth.noteOn()
        case .touchesMoved:
            break
        case .touchesEnded:
            mySynth.noteOff()
        }
    }
    
    func showFrequency(frequency:Double){
        frequencyLabel.text = String(format: "%.2f", frequency)
    }
    
    //MARK: END OF GESTURE
    //***************//
    
    
    
    //***************//
    //MARK: STRAT OF KEY VIEW
    
    
    //MARK: Loading Notes Names Label
    func noteNamesLabel(){
                
        let maxX = Double(self.bounds.maxX)
        
        // MARK: שמות צלילים
        let viewXSteps:Double = maxX / Double(numberOfNote)
        var steps = viewXSteps
        var i = 0
        
        for keyNumber in 1...numberOfNote-1{
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = .black
            label.text = noteColor[i].title
            
            if (UIDevice.current.userInterfaceIdiom == .pad) {
                label.font = label.font.withSize(25)
            } else {
                label.font = label.font.withSize(18)
            }
            

            label.textAlignment = .center
            label.alpha = 1
            label.layer.borderWidth = 0.3
            label.layer.borderColor = UIColor.black.cgColor
            label.backgroundColor = noteColor[i].textColor
            
            
            i += 1
            if i == noteColor.count {
                i = 0
            }
            
            self.addSubview(label)
            self.sendSubviewToBack(label)
            steps = (viewXSteps * Double(keyNumber))
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: CGFloat(steps - (viewXSteps / 2))).isActive = true
            label.widthAnchor.constraint(equalToConstant: CGFloat(viewXSteps)).isActive = true
            
            if (UIDevice.current.userInterfaceIdiom == .pad) {
                label.heightAnchor.constraint(equalToConstant: CGFloat(200)).isActive = true
            } else {
                label.heightAnchor.constraint(equalToConstant: CGFloat(100)).isActive = true
            }
            
        }
    }
    
    // MARK: Loading Views Method
    func loadKeyViews(keyNumber:Int? = 26){
        
        if let noteNumber = keyNumber {
            numberOfNote = noteNumber
        }else {
            numberOfNote = 26
        }
        
        
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.systemIndigo.cgColor
        self.backgroundColor?.withAlphaComponent(0.7)
        
        // MARK: קלידים
        for _ in 1...numberOfNote{
            let view = UIView()
            view.backgroundColor = .white
            view.alpha = 0.1
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.black.cgColor
            viewArray.append(view)
            
        }
        
        let stack = UIStackView(arrangedSubviews: viewArray)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 0
        stack.distribution = .fillEqually
        self.addSubview(stack)
        stack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stack.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stack.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        stack.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        
        
        
        // MARK: מלבן של האוברטון
        
        frequencyLabel = UILabel()
        frequencyLabel.backgroundColor = .clear
        frequencyLabel.textColor = UIColor.white
        frequencyLabel.frame = CGRect(width: 90, height: 21)

        if (UIDevice.current.userInterfaceIdiom == .pad) {
            frequencyLabel.font = frequencyLabel.font.withSize(33)
        } else {
            frequencyLabel.font = frequencyLabel.font.withSize(17)
        }
        
        let scrollView =  self.subviews[0]
        let synthSettingVC =  scrollView.subviews[0]
        let generalSettingTableView = scrollView.subviews[1]
        
        overtoneView = UIView()
        overtoneView.backgroundColor = .clear
        overtoneView.layer.borderWidth = 1
        overtoneView.layer.borderColor = UIColor.systemIndigo.cgColor
        
        self.addSubview(overtoneView)
        self.addSubview(scrollView)
        self.addSubview(generalSettingTableView)
        self.addSubview(frequencyLabel)
        
        setConstraints(overtoneView)
        setConstraints(scrollView)
        setConstraints(synthSettingVC)
        setConstraints(generalSettingTableView)
        setFrequencyLabelConstraints(frequencyLabel)
        
        synthSettingVC.backgroundColor = .clear
        generalSettingTableView.backgroundColor = .clear
        
        synthSettingVC.isHidden = true
        scrollView.isHidden = true
        frequencyLabel.isHidden = true
        
        
    }
    
    //MARK: END OF KEY VIEW
    //***************//

    
    func setConstraints(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        
        if (UIDevice.current.userInterfaceIdiom == .pad) {
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -200).isActive = true
        } else {
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100).isActive = true
        }
        
    }
    
    func setFrequencyLabelConstraints(_ view:UIView){
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: self.topAnchor,constant:8).isActive = true
        view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

    }
    
}

enum TouchesMod {
    case touchesBegan
    case touchesMoved
    case touchesEnded
}
