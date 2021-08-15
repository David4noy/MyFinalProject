//
//  KeyboardView.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 27/07/2021.
//

import UIKit
import AudioKit
import AudioKitUI

class KeyboardView: UIView, UIGestureRecognizerDelegate {
    
    let mySynth = Synth.shared
    var octaveMult = 2.0
    var overtoneView = UIView()
    var viewArray:[UIView] = []
    var labelArray:[UILabel] = []
    var notesLabelLoaded = false
    
    //
    //    var scrollView:UIScrollView  = {
    //        let scrollView = UIScrollView()
    //        scrollView.contentSize = CGSize(width: 0, height: 0)
    //        return scrollView
    //    }()
    
    let noteColor:[DataSourceBuilder] = DataSourceArrays().noteColor
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    
    @IBAction func octave(_ sender: UIStepper) {
        octaveMult = sender.value
        print(octaveMult)
    }
    
    func getMaxX() -> Double{
        print("*****",Double(self.bounds.maxX),"***********//////")
        return Double(self.bounds.maxX)
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
        
        if !notesLabelLoaded{
            noteNamesLabel()
            notesLabelLoaded = true
        }
        print("Start")
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
        print("End")
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
        
        let note = Notes(totalXOfView: Double(self.bounds.maxX), numberOfNote: 26)
        
        let frequency = note.getNote(touchPoint: Double(xPosition)) * octaveMult
        print(frequency)
        
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
    
    
    //MARK: END OF GESTURE
    //***************//
    
    
    
    
    //***************//
    //MARK: STRAT OF KEY VIEW
    
    
    //MARK: Loading Notes Names Label
    func noteNamesLabel(){
        
        let keyNumber = 26
        
        let maxX = getMaxX()
        // MARK: שמות צלילים
        let viewXSteps:Double = maxX / Double(keyNumber)
        print(viewXSteps,Double(self.bounds.maxX),maxX, Double(keyNumber))
        var steps = viewXSteps
        var i = 0
        
        for j in 1...keyNumber-1{
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = .black
            label.text = noteColor[i].title
            
            if (UIDevice.current.userInterfaceIdiom == .pad) {
                label.font = label.font.withSize(33)
            } else {
                label.font = label.font.withSize(20)
            }
            

            label.textAlignment = .center
            label.alpha = 1
            label.layer.borderWidth = 1
            label.layer.borderColor = UIColor.black.cgColor
            label.backgroundColor = noteColor[i].textColor
            
            
            i += 1
            if i == noteColor.count {
                i = 0
            }
            
            self.addSubview(label)
            self.sendSubviewToBack(label)
            steps = (viewXSteps * Double(j))
            print(steps)
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
    func loadKeyViews(keyNumber:Int = 26){
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.yellow.cgColor
        self.backgroundColor?.withAlphaComponent(0.7)
        
        // MARK: קלידים
        for _ in 1...keyNumber{
            let view = UIView()
            view.backgroundColor = .gray
            view.alpha = 0.5
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
        
        
        let scrollView =  self.subviews[0]
        let synthSettingVC =  scrollView.subviews[0]
        
        overtoneView = UIView()
        overtoneView.backgroundColor = .clear
        overtoneView.layer.borderWidth = 1
        overtoneView.layer.borderColor = UIColor.yellow.cgColor
        
        self.addSubview(overtoneView)
        self.addSubview(scrollView)
        
        setConstraints(overtoneView)
        setConstraints(scrollView)
        setConstraints(synthSettingVC)
        
        synthSettingVC.backgroundColor = .clear
        scrollView.isHidden = true
        
        
    }
    
    //MARK: END OF KEY VIEW
    //***************//
    
    
//    func setGradientBackground(_ view: UIView){
//
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = view.bounds
//        gradientLayer.colors = [UIColor.purple.cgColor, UIColor.blue.cgColor]
//        view.layer.insertSublayer(gradientLayer, at: 0)
//
//    }
    
    
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
    
}

enum TouchesMod {
    case touchesBegan
    case touchesMoved
    case touchesEnded
}
