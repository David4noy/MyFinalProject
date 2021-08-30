//
//  MainViewController + Record and Playback.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 30/08/2021.
//

import UIKit


extension MainViewController{
    
    
    
    func recordCountdown(){
        if !recordTimer.isValid{
            recordCountLabel()
            recordTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(recordingCountdownView), userInfo: nil, repeats: true)
        }
    }
    
    func playbackCountdown(){
        if !playbackTimer.isValid {
            playbackCountLabel()
            playbackTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(playbackCountdowningView), userInfo: nil, repeats: true)
        }
        
    }
    
    func recordCountLabel(){
        
        if (UIDevice.current.userInterfaceIdiom == .pad) {
            recordCountdownView.font = recordCountdownView.font.withSize(50)
            recordCountdownView.frame = CGRect(width: 100, height: 150)
            recordCountdownView.center = CGPoint(x: self.view.frame.maxX / 2, y: self.view.frame.maxY / 3)
        } else {
            recordCountdownView.font = recordCountdownView.font.withSize(40)
            recordCountdownView.frame = CGRect(width: 100, height: 100)
            recordCountdownView.center = CGPoint(x: self.view.frame.maxX / 2, y: self.view.frame.maxY / 3)
        }
        recordCountdownView.textColor = .black
        recordCountdownView.backgroundColor = .red
        recordCountdownView.layer.masksToBounds = true
        recordCountdownView.layer.cornerRadius = 10.0
        recordCountdownView.textAlignment = .center
        recordCountdownView.font = UIFont(name:"Charter Roman",size:90)
        recordCountdownView.isHidden = true
        self.view.addSubview(recordCountdownView)
        self.view.bringSubviewToFront(recordCountdownView)
        
    }
    
    func playbackCountLabel(){
        
        if (UIDevice.current.userInterfaceIdiom == .pad) {
            playbackCountdownView.font = playbackCountdownView.font.withSize(50)
            playbackCountdownView.frame = CGRect(width: 100, height: 150)
            playbackCountdownView.center = CGPoint(x: self.view.frame.maxX / 2, y: self.view.frame.maxY / 2)
        } else {
            playbackCountdownView.font = playbackCountdownView.font.withSize(40)
            playbackCountdownView.frame = CGRect(width: 100, height: 100)
            playbackCountdownView.center = CGPoint(x: self.view.frame.maxX / 2, y: self.view.frame.maxY / 1.5)
        }
        playbackCountdownView.textColor = .black
        playbackCountdownView.backgroundColor = .white
        playbackCountdownView.layer.masksToBounds = true
        playbackCountdownView.layer.cornerRadius = 10.0
        playbackCountdownView.textAlignment = .center
        playbackCountdownView.font = UIFont(name:"Charter Roman",size:90)
        playbackCountdownView.isHidden = true
        self.view.addSubview(playbackCountdownView)
        self.view.bringSubviewToFront(playbackCountdownView)
        
    }
    
    @objc func playbackCountdowningView(){
        
        if playbackCount == 0 {
            playbackTimer.invalidate()
            if (UIDevice.current.userInterfaceIdiom == .pad) {
                playbackCountdownView.font = playbackCountdownView.font.withSize(50)
                playbackCountdownView.frame = CGRect(width: 300, height: 150)
                playbackCountdownView.center = CGPoint(x: self.view.frame.maxX / 2, y: self.view.frame.maxY / 2)
            } else {
                playbackCountdownView.font = playbackCountdownView.font.withSize(40)
                playbackCountdownView.frame = CGRect(width: 300, height: 100)
                playbackCountdownView.center = CGPoint(x: self.view.frame.maxX / 2, y: self.view.frame.maxY / 1.5)
            }
            playbackCountdownView.text = "Playing"
            UIView.animate(withDuration: 1, delay: 0.0, options: [.curveEaseInOut, .beginFromCurrentState], animations: {() -> Void in
                self.playbackCountdownView.alpha = 0
            }, completion: {(finished: Bool) -> Void in
            })
            mainAudioMixer.playPlayback()
            playbackCount = 4
            //  playbackCountdownView.isHidden = true
        } else {
            playbackCountdownView.isHidden = false
            
            playbackCountdownView.alpha = 0.8
            UIView.animate(withDuration: 0.1, delay: 0.0, options: [.curveEaseInOut, .allowUserInteraction], animations: {() -> Void in
                self.playbackCountdownView.alpha = 1
            }, completion: {(finished: Bool) -> Void in
            })
            UIView.animate(withDuration: 0.9, delay: 0.0, options: [.curveEaseInOut, .allowUserInteraction], animations: {() -> Void in
                self.playbackCountdownView.alpha = 0.4
            }, completion: {(finished: Bool) -> Void in
            })
            playbackCountdownView.text = "\(playbackCount)"
            playbackCount -= 1
        }
    }
    
    @objc func recordingCountdownView(){

        if recordCount == 0 {
            recordTimer.invalidate()
            if (UIDevice.current.userInterfaceIdiom == .pad) {
                recordCountdownView.font = recordCountdownView.font.withSize(50)
                recordCountdownView.frame = CGRect(width: 300, height: 150)
                recordCountdownView.center = CGPoint(x: self.view.frame.maxX / 2, y: self.view.frame.maxY / 3)
            } else {
                recordCountdownView.font = recordCountdownView.font.withSize(40)
                recordCountdownView.frame = CGRect(width: 300, height: 100)
                recordCountdownView.center = CGPoint(x: self.view.frame.maxX / 2, y: self.view.frame.maxY / 3)
            }
            recordCountdownView.text = "Recording"
            UIView.animate(withDuration: 1, delay: 0.0, options: [.curveEaseInOut, .beginFromCurrentState], animations: {() -> Void in
                self.recordCountdownView.alpha = 0
            }, completion: {(finished: Bool) -> Void in
            })
            
            if recordingState == .countdowning {
                mainAudioMixer.toggleRecord()
                recordingState = .recording
            }
            recordCount = 4
        } else {
            recordCountdownView.isHidden = false
            
            recordCountdownView.alpha = 0.8
            UIView.animate(withDuration: 0.1, delay: 0.0, options: [.curveEaseInOut, .allowUserInteraction], animations: {() -> Void in
                self.recordCountdownView.alpha = 1
            }, completion: {(finished: Bool) -> Void in
            })
            UIView.animate(withDuration: 0.9, delay: 0.0, options: [.curveEaseInOut, .allowUserInteraction], animations: {() -> Void in
                self.recordCountdownView.alpha = 0.4
            }, completion: {(finished: Bool) -> Void in
            })
            recordCountdownView.text = "\(recordCount)"
            recordCount -= 1
        }
    }
    
    func stopRecordCountdown(){
        recordTimer.invalidate()
        recordCount = 4
        recordCountdownView.isHidden = true
    }
    
    func stopPlaybackCountdown(){
        playbackTimer.invalidate()
        playbackCount = 4
        playbackCountdownView.isHidden = true
    }

    
    func startFlashing(recordItem: RecordItem){
        
        let view: UIView
        
        switch recordItem {
        case .play:
            view = playBtnOutlet
        case .record:
            view = recordBtnOutlet
        }
        
        view.alpha = 1.0
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseInOut, .repeat, .autoreverse, .allowUserInteraction], animations: {() -> Void in
            view.alpha = 0.4
        }, completion: {(finished: Bool) -> Void in
        })
        
    }
    
    
    func stopFlashing(recordItem: RecordItem){
        let view: UIView
        
        switch recordItem {
        case .play:
            view = playBtnOutlet
        case .record:
            view = recordBtnOutlet
        }
        
        UIView.animate(withDuration: 0.1, delay: 0.0, options: [.curveEaseInOut, .beginFromCurrentState], animations: {() -> Void in
            view.alpha = 1.0
        }, completion: {(finished: Bool) -> Void in
        })
    }
    
    func btnToGray(){
        playBtnOutlet.tintColor = .gray
        pauseBtnOutlet.tintColor = .gray
        stopBtnOutlet.tintColor = .gray
    }
    
    func record(){
        
        switch recordingState {
        case .standby:
            startFlashing(recordItem: .record)
            recordFlashing = true
            if recordIsCountdowning {
                recordingState = .countdowning
                recordCountdown()
            } else {
                recordingState = .recording
            mainAudioMixer.toggleRecord()
            }
        case .recording:
            mainAudioMixer.toggleRecord()
            stopFlashing(recordItem: .record)
            recordFlashing = false
            recordingState = .standby
        case .countdowning:
            recordingState = .standby
            stopRecordCountdown()
            stopFlashing(recordItem: .record)
            recordFlashing = false
        }
    }
    
    func playPlayback(){
        startFlashing(recordItem: .play)
        btnToGray()
        playBtnOutlet.tintColor = .white
        
        if playbackIsCountdowning {
            playbackCountdown()
        } else {
            mainAudioMixer.playPlayback()
        }
    }
    
    func pausing(){
        mainAudioMixer.pausePlayback()
        stopFlashing(recordItem: .play)
        btnToGray()
        pauseBtnOutlet.tintColor = .white
        stopPlaybackCountdown()
    }
    
    func stoping(){
        stopPlaybackCountdown()
        mainAudioMixer.stopPlayback()
        stopFlashing(recordItem: .play)
        btnToGray()
        stopBtnOutlet.tintColor = .white
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.stopBtnOutlet.tintColor = .gray
        }
    }
    
    func synthVolume(_ sender: UISlider) {
        mySynth.setVolume(volume: sender.value)
        let vol = String(format: "%.2f", sender.value)
        synthVolumeLabelOutlet.text = "Player\n" + vol
        
        generalData?.synthGain = sender.value
        save.saveContext()
    }
    
    func playbackVolume(_ sender: UISlider) {
        mainAudioMixer.setVolume(sender.value)
        let vol = String(format: "%.2f", sender.value)
        playerVolumeLabelOutlet.text = "Player\n" + vol
        
        generalData?.playbackGain = sender.value
        save.saveContext()
    }
    
    func setOctave(_ sender: UIStepper) {
        var step = sender.value - 1
        
        if step == 0 {
            step = 0.5
        } else if step == 3 {
            step = 4
        } else if step == 4 {
            step = 8
        }
        keyboardView.setOctaveMult(mult: step)
        octaveNum.text = String(Int(sender.value))
    }
    
    
}

enum RecordingState{
    
    case recording
    case countdowning
    case standby
    
}
