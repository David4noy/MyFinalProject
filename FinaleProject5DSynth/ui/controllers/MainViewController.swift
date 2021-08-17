//
//  MainViewController.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 27/07/2021.
// 

import UIKit

class MainViewController: UIViewController {

    let mySynth = Synth.shared
    
    @IBOutlet weak var keyboardView: KeyboardView!    
    @IBOutlet weak var settingView: UIView!
    @IBOutlet weak var fxScrollView: FxBtnView!
    @IBOutlet weak var synthSettingView: UIView!
    @IBOutlet weak var settingScrollView: UIScrollView!
    @IBOutlet weak var octaveOutlet: UIStepper!
    @IBOutlet weak var octaveNum: UILabel!
    @IBOutlet weak var settingOutlet: UIButton!
    @IBOutlet weak var synthSettingOutlet: UIButton!
    @IBOutlet weak var playbackSettingOutlet: UIButton!
    @IBOutlet weak var recorderSettingOutlet: UIButton!
    
    let synthColorCode = SynthColorCode()
    var keyboardViewIsLoaded:Bool = false
    var frequenctIsHidden:Bool = true
    let mainAudioMixer = MainAudioMixer()

    override func viewDidLoad() {
        super.viewDidLoad()
        addBackground()
        keyboardView.loadKeyViews()
        fxScrollView.loadFxBtns()
        synthSettingView.isHidden = true
        settingScrollView.isHidden = true
        octaveOutlet.value = 3
        octaveOutlet.backgroundColor = synthColorCode.synthColorCode(.pitch)
        octaveOutlet.tintColor = .white
        octaveNum.textColor = synthColorCode.synthColorCode(.pitch)
    }
    
    override func viewDidLayoutSubviews() {
        
        if !keyboardViewIsLoaded {
            keyboardView.noteNamesLabel()
            keyboardViewIsLoaded = true
        }
    }
    @IBAction func showFrequencyBtn(_ sender: UIButton) {
        
        frequenctIsHidden = !frequenctIsHidden
        keyboardView.frequencyLabel.isHidden = frequenctIsHidden
    }
    
    @IBAction func octaveStepper(_ sender: UIStepper) {
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
    
    @IBAction func setGeneralVolume(_ sender: UISlider) {
        mySynth.setVolume(volume: sender.value)
        mainAudioMixer.setVolume(sender.value)
    }
    
    @IBAction func settingBtn(_ sender: UIButton) {
        
        if sender.alpha != 1 {
            btnOutletsSetAlpha()
            sender.alpha = 1
            settingScrollView.isHidden = false
            synthSettingView.isHidden = false
        } else {
            sender.alpha = 0.5
            settingScrollView.isHidden = true
            synthSettingView.isHidden = true
        }
    }
    
    @IBAction func synthSettingBtn(_ sender: UIButton) {
        
        if sender.alpha != 1 {
            btnOutletsSetAlpha()
            sender.alpha = 1
            settingScrollView.isHidden = false
            synthSettingView.isHidden = false
        } else {
            sender.alpha = 0.5
            settingScrollView.isHidden = true
            synthSettingView.isHidden = true
        }
        
    }
    
    @IBAction func playbackSettingBtn(_ sender: UIButton) {
        
        mainAudioMixer.addPlaybackFile()
        
//        if sender.alpha != 1 {
//            btnOutletsSetAlpha()
//            sender.alpha = 1
//            settingScrollView.isHidden = false
//            synthSettingView.isHidden = false
//        } else {
//            sender.alpha = 0.5
//            settingScrollView.isHidden = true
//            synthSettingView.isHidden = true
//        }
        
    }
    
    @IBAction func recorderSettingBtn(_ sender: UIButton) {

        
        mainAudioMixer.loadFile(self)
        
//        if sender.alpha != 1 {
//            btnOutletsSetAlpha()
//            sender.alpha = 1
//            settingScrollView.isHidden = false
//            synthSettingView.isHidden = false
//        } else {
//            sender.alpha = 0.5
//            settingScrollView.isHidden = true
//            synthSettingView.isHidden = true
//        }
        
    }
    
    func btnOutletsSetAlpha(){
        
        settingOutlet.alpha = 0.5
        synthSettingOutlet.alpha = 0.5
        playbackSettingOutlet.alpha = 0.5
        recorderSettingOutlet.alpha = 0.5
        
    }
    
    
    
   
    @IBAction func toggleRecordBtn(_ sender: UIButton) {
        mainAudioMixer.toggleRecord()
    }
    
    @IBAction func playBtn(_ sender: UIButton) {
            mainAudioMixer.playPlayback()
    }
    
    
    @IBAction func pauseBtn(_ sender: UIButton) {
        mainAudioMixer.pausePlayback()
    }
    
    @IBAction func stopBtn(_ sender: UIButton) {
        mainAudioMixer.stopPlayback()
    }
    
    

    
}

// Extensions

extension MainViewController {
    func addBackground() {
        
        let backgroundImageView = UIImageView(frame: UIScreen.main.bounds)
        let imageName: String = "sky_stars_background"
        
        backgroundImageView.image = UIImage(named: imageName)
        backgroundImageView.contentMode = self.view.contentMode
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(backgroundImageView)
        self.view.sendSubviewToBack(backgroundImageView)
        
    }
}
