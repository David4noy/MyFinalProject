//
//  KeyboardView.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 27/07/2021.
//

import UIKit
import AudioKit

class KeyboardView: UIView, UIGestureRecognizerDelegate {
    
    let mySynth = Synth.shared
    var octaveMult = 2.0
    var overtoneView = UIView()
    var viewArray:[UIView] = []
    var labelArray:[UILabel] = []
    
    
//    weak var synthSettingViewController:SynthSettingViewController!
//
//    var scrollView:UIScrollView  = {
//        let scrollView = UIScrollView()
//        scrollView.contentSize = CGSize(width: 0, height: 0)
//        return scrollView
//    }()
    
    let noteColor:[TitleColor] = [
        TitleColor(title: "C", color: .white),
        TitleColor(title: "Db", color: .black),
        TitleColor(title: "D", color: .white),
        TitleColor(title: "Eb", color: .black),
        TitleColor(title: "E", color: .white),
        TitleColor(title: "F", color: .white),
        TitleColor(title: "Gb", color: .black),
        TitleColor(title: "G", color: .white),
        TitleColor(title: "Ab", color: .black),
        TitleColor(title: "A", color: .white),
        TitleColor(title: "Bb", color: .black),
        TitleColor(title: "B", color: .white)]
    

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
    

    
    //***************//
    //MARK: START OF GESTURE
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print("Start")
        var t = touches
        
        let v = t.popFirst()
        
        guard let vi = v?.location(in: self).x else {
            return
        }
      //  print("max x",self.bounds.maxX, "point",vi)

        guard let v2 = v?.location(in: overtoneView).y else {
            return
        }
        
        var mix = 0.0
        if v2 <= overtoneView.bounds.maxY {
            mix = Double((overtoneView.bounds.maxY - v2) / overtoneView.frame.maxY * 100) + 20.0
            mySynth.overtoneMixChange(mix: AUValue(mix))
        } else {
            mix = 0
            mySynth.overtoneMixChange(mix: AUValue(mix))
        }
        
        let note = Notes(totalXOfView: Double(self.bounds.maxX), numberOfNote: 26)
         
        let frequency = note.getNote(touchPoint: Double(vi)) * octaveMult
        print(frequency)
        
        mySynth.setNoteFrequency(AUValue(frequency))
        mySynth.noteOn()

    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        var t = touches
        let v = t.popFirst()
        guard let vi = v?.location(in: self).x else {
            return
        }

        guard let v2 = v?.location(in: overtoneView).y else {
            return
        }
        
        var mix = 0.0
        if v2 <= overtoneView.bounds.maxY {
            mix = Double((overtoneView.bounds.maxY - v2) / overtoneView.frame.maxY * 100) + 20.0
            mySynth.overtoneMixChange(mix: AUValue(mix))
        } else {
            mix = 0
            mySynth.overtoneMixChange(mix: AUValue(mix))
        }
        
        let note = Notes(totalXOfView: Double(self.bounds.maxX), numberOfNote: 26)
        
        let frequency = note.getNote(touchPoint: Double(vi)) * octaveMult
        print(frequency)
        mySynth.setNoteFrequency(AUValue(frequency))
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        var t = touches
        let v = t.popFirst()
        guard let vi = v?.location(in: self).x else {
            return
        }
        
        guard let v2 = v?.location(in: overtoneView).y else {
            return
        }
        
        var mix = 0.0
        if v2 <= overtoneView.bounds.maxY {
            mix = Double((overtoneView.bounds.maxY - v2) / overtoneView.frame.maxY * 100) + 20.0
            mySynth.overtoneMixChange(mix: AUValue(mix))
        } else {
            mix = 0
            mySynth.overtoneMixChange(mix: AUValue(mix))
        }
        
        let note = Notes(totalXOfView: Double(self.bounds.maxX), numberOfNote: 26)
        
        let frequency = note.getNote(touchPoint: Double(vi)) * octaveMult
        print(frequency)
        mySynth.setNoteFrequency(AUValue(frequency))
        
        mySynth.noteOff()
        
        print("End")
    }
  
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
 true
    }

    //MARK: END OF GESTURE
    //***************//
    
    
    //***************//
    //MARK: STRAT OF KEY VIEW
    
        // Loading Views Method
    func loadKeyViews(keyNumber:Int = 26){
        
        
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.yellow.cgColor

        
        // MARK: שמות צלילים
        let viewXSteps: Double = Double(self.bounds.maxX) / Double(keyNumber)
        var steps = viewXSteps
        var i = 0
        
        for j in 1...keyNumber-1{
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = .yellow
            label.alpha = 1
            label.layer.borderWidth = 1
            label.layer.borderColor = UIColor.black.cgColor
            label.text = noteColor[i].title 
            label.backgroundColor = noteColor[i].color
        //    let labelWidth = Double(label.bounds.width / 2)
        
            i += 1
            if i == noteColor.count {
                i = 0
            }
            
            self.addSubview(label)
            
            steps = (viewXSteps * Double(j))
            print(steps)
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: CGFloat(steps)).isActive = true


        }
        

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

       // scrollView.removeFromSuperview()
        self.addSubview(overtoneView)
        self.addSubview(scrollView)
      //  scrollView.addSubview(synthSettingVC)
        
    //    overtoneView.isUserInteractionEnabled = false
        
        setConstraints(overtoneView)
        setConstraints(scrollView)
        setConstraints(synthSettingVC)
        
        //   setGradientBackground(scrollView)
        synthSettingVC.backgroundColor = .brown
        scrollView.backgroundColor = .blue
        scrollView.isHidden = true
        
        // loadKeyViews end
    }
    
    //MARK: END OF KEY VIEW
    //***************//
    
    
    func setGradientBackground(_ view: UIView){

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.purple.cgColor, UIColor.blue.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)

    }
    
    
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



//
//        var constraints:[NSLayoutConstraint] = [topAnchor.constraint(equalTo: self.topAnchor),rightAnchor.constraint(equalTo: self.rightAnchor),leftAnchor.constraint(equalTo: self.leftAnchor)]
//
//        overtoneView.translatesAutoresizingMaskIntoConstraints = false
//        overtoneView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        overtoneView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//        overtoneView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
//
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        scrollView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//        scrollView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
//
//        synthSettingVC.translatesAutoresizingMaskIntoConstraints = false
//        synthSettingVC.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        synthSettingVC.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//        synthSettingVC.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
//
//
//        if (UIDevice.current.userInterfaceIdiom == .pad) {
//            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -200).isActive = true
//            overtoneView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -200).isActive = true
//            synthSettingVC.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -200).isActive = true
//            constraints.append(bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -200))
//        } else {
//            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100).isActive = true
//            overtoneView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100).isActive = true
//            synthSettingVC.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100).isActive = true
//            constraints.append(bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100))
//        }
//
//        overtoneView.addConstraints(constraints)
//        scrollView.addConstraints(constraints)
//        synthSettingVC.addConstraints(constraints)
//
//        NSLayoutConstraint.activate(overtoneView.constraints)
//        NSLayoutConstraint.activate(scrollView.constraints)
//        NSLayoutConstraint.activate(synthSettingVC.constraints)
