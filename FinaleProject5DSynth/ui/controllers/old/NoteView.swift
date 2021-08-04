//
//  NoteView.swift
//  FirstSynth
//
//  Created by דוד נוי on 22/07/2021.
//

import UIKit
import AudioKit

class NoteView: UIView, UIGestureRecognizerDelegate {
    
    let mySynth = Synth.shared
    var octaveMult = 2.0
        
    @IBAction func octave(_ sender: UIStepper) {
        octaveMult = sender.value
        print(octaveMult)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print("Start")
        
        var t = touches
        let v = t.popFirst()
        guard let vi = v?.location(in: self).x else {
            return
        }
        print("max x",self.frame.maxX, "point",vi)
        
        let note = Notes(totalXOfView: Double(self.frame.maxX), numberOfNote: 3)
         
        let frequency = note.getNote(touchPoint: Double(vi)) * octaveMult
        print(frequency)
        
     //   mySynth.synth.setNoteFrequency(AUValue(frequency))
        mySynth.noteOn()
        
        
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        var t = touches
        let v = t.popFirst()
        guard let vi = v?.location(in: self).x else {
            return
        }
        
        let note = Notes(totalXOfView: Double(self.frame.maxX), numberOfNote: 3)
        
        let frequency = note.getNote(touchPoint: Double(vi)) * octaveMult
        print(frequency)
   //     mySynth.synth.setNoteFrequency(AUValue(frequency))
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        var t = touches
        let v = t.popFirst()
        guard let vi = v?.location(in: self).x else {
            return
        }
        
        let note = Notes(totalXOfView: Double(self.frame.maxX), numberOfNote: 3)
        
        let frequency = note.getNote(touchPoint: Double(vi)) * octaveMult
        print(frequency)
   //     mySynth.synth.setNoteFrequency(AUValue(frequency))
        
        mySynth.noteOff()
        
        print("End")
    }


    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        true
    }
    
    
}
