////
////  AutoBandFilter.swift
////  FinaleProject5DSynth
////
////  Created by דוד נוי on 30/07/2021.
////
//
//import Foundation
//import AudioKit
//import SoundpipeAudioKit
//
//class AutoBandFilter{
//    
//    let filter:PeakingParametricEqualizerFilter
//    let dryWetMix:DryWetMixer
//    
//    var timer: Timer!
//    var isOn = false
//    
//    var frequancy:Double = 500
//    var startFrequency: AUValue = 500
//    var endFrequency: AUValue = 3000
//    var frequancyRampDuration: Float = 3.0
//    
//    init(_ node:Node) {
//
//        filter = PeakingParametricEqualizerFilter(node, centerFrequency: 500, gain: 4, q: 0.5)
//        dryWetMix = DryWetMixer(node, filter)
//        
//     //   filter.$centerFrequency.ramp(from: startFrequency, to: endFrequency, duration: frequancyRampDuration)
//        
//    }
//    
//    func play(){
//        filter.play()
//    }
//    
//    func bypass(){
//        filter.bypass()
//    }
//    
//    func filterOn(){
//        
//        isOn = true
//        timer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(runTimer), userInfo: nil, repeats: false)
//    }
//    
//    func filterOff(){
//        isOn = false
//        timer.invalidate()
//    }
//    
//    @objc func runTimer(){
//        
//        while isOn {
//            for _ in 1...2500 {
//                filter.centerFrequency += 200
//            }
//            
//            for _ in 1...2500 {
//                filter.centerFrequency -= 1
//            }
//        }
//        
//    }
//    
//}
