//
//  Synth1ViewController.swift
//  FirstSynth
//
//  Created by דוד נוי on 09/07/2021.
//
//  git add . && git commit -m "Message" && git push origin main
//

import UIKit
import AudioKit
import SoundpipeAudioKit
import DunneAudioKit

class Synth1ViewController: UIViewController {
    
    @IBOutlet weak var freqOutlet: UILabel!
    let mySynth = Synth.shared
    var modOn = false
    
    @IBOutlet weak var noteFrequencyRecognaizer: UIView!
    
    let dragRecognaizer = UITapGestureRecognizer(target: self, action: #selector(gestureRecognizer(sender:)))

    override func viewDidLoad() {
        super.viewDidLoad()
        dragRecognaizer.numberOfTapsRequired = 1
        dragRecognaizer.numberOfTouchesRequired = 1
        noteFrequencyRecognaizer.addGestureRecognizer(dragRecognaizer)
        noteFrequencyRecognaizer.isUserInteractionEnabled = true
        mySynth.noteOff()
     //   mySynth.playSynth()
                
    }
    
    @objc func gestureRecognizer(sender: UITapGestureRecognizer){
        print("taped")
    }
    
    
    @IBAction func noteOnOff(_ sender: UISwitch) {
        
//        if sender.isOn{
//            mySynth.noteOn()
//        } else {
//            mySynth.noteOff()
//        }
    }
    
    @IBAction func noteFreq(_ sender: UISlider, forEvent event: UIEvent) {
        
//        mySynth.setNoteFrequency(frequency: AUValue(sender.value))
//        freqOutlet.text = String(format: "%.2f", sender.value) + "Hz"
        
//        sender.touchesBegan(event.allTouches!, with: event)
//        if let touchEvent = event.allTouches?.first {
//            switch touchEvent.phase {
//            case .began:
//              print("touches began")
//                mySynth.fxMixer.envelope.openGate()
//            case .ended:
//              print("touches ended")
//                mySynth.fxMixer.envelope.closeGate()
//            default:
//                print("default")
//            }
//          }
        
    }
    
    
    
    @IBAction func octaveChange(_ sender: UIStepper) {
    }
    
    @IBAction func synthTypeSegment(_ sender: UISegmentedControl) {
        
//        if sender.selectedSegmentIndex == 0{
//            mySynth.setSynthType(type: .oscillator)
//        } else {
//            mySynth.setSynthType(type: .fmSynth)
//        }
        
    }
    
    @IBAction func modeTyoeSegment(_ sender: UISegmentedControl) {

//        if sender.selectedSegmentIndex == 0{
//            mySynth.setModulationType(type: .chorus)
//        } else {
//            mySynth.setModulationType(type: .flanger)
//        }
    }
    
    @IBAction func distOnOffSwitch(_ sender: UISwitch) {
      //  mySynth.distOnOff(isOn: sender.isOn)
    }
    
    @IBAction func delayOnOffSwitch(_ sender: UISwitch) {
     //   mySynth.delayOnOff(isOn: sender.isOn)
    }
    
    @IBAction func reverbOnOffSwitch(_ sender: UISwitch) {
        if sender.isOn{
      //      mySynth.fxMixer.reverb.dryWetMix = 0.1
        } else {
        //    mySynth.fxMixer.reverb.dryWetMix = 0
        }
    }
    
    @IBAction func modOnOffSwitch(_ sender: UISwitch) {
        
    //    mySynth.modOnOff(isOn: sender.isOn)
    }
    
    
    @IBAction func modFreqSlider(_ sender: UISlider) {
      //  mySynth.setModFrequency(frequency: AUValue(sender.value))
    }
    
    @IBAction func delayTimeSlider(_ sender: UISlider) {
      //  mySynth.setDelayTime(time: AUValue(sender.value / 1000))
    }
    
    
}
