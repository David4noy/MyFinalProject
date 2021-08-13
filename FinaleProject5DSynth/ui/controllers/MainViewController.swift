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
    
    let mainAudioMixer = MainAudioMixer()

    override func viewDidLoad() {
        super.viewDidLoad()
        addBackground()
        keyboardView.loadKeyViews()
        fxScrollView.loadFxBtns()
        synthSettingView.isHidden = true
        settingScrollView.isHidden = true
        print(keyboardView.bounds.maxX)
    }
    
    @IBAction func setGeneralVolume(_ sender: UISlider) {
        mySynth.setVolume(volume: sender.value)
        mainAudioMixer.setVolume(sender.value)
    }
    
    @IBAction func settingBtn(_ sender: UIButton) {
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
    
    
    @IBAction func synthSettingBtn(_ sender: UIButton) {
        
        if sender.alpha != 1 {
            sender.alpha = 1
            settingScrollView.isHidden = false
            synthSettingView.isHidden = false
        } else {
            sender.alpha = 0.5
            settingScrollView.isHidden = true
            synthSettingView.isHidden = true
        }
        
    }
    
}


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

