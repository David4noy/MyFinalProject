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
    @IBOutlet weak var showFrequencyOutlet: UIButton!
    
    var keyboardViewIsLoaded:Bool = false
    var frequenctIsShowing:Bool = false
    let mainAudioMixer = MainAudioMixer()

    override func viewDidLoad() {
        super.viewDidLoad()
        addBackground()
        keyboardView.loadKeyViews()
        fxScrollView.loadFxBtns()
        synthSettingView.isHidden = true
        settingScrollView.isHidden = true
        octaveOutlet.value = 3
    }
    
    override func viewDidLayoutSubviews() {
        
        if !keyboardViewIsLoaded {
            keyboardView.noteNamesLabel()
            keyboardViewIsLoaded = true
        }
    }
    @IBAction func showFrequencyBtn(_ sender: UIButton) {
        
        frequenctIsShowing = !frequenctIsShowing
        
        if !frequenctIsShowing {
            showFrequencyOutlet.setTitle("Show frequency", for: .normal)
        }
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

// Extensions

//extension MainViewController: ShowFrequencyDelegate {
//
//    func didSetFrequency(frequency: Double) {
//        if frequenctIsShowing {
//            showFrequencyOutlet.setTitle(String(format: "%.2f", frequency), for: .normal)
//        }
//    }
//
//}

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
