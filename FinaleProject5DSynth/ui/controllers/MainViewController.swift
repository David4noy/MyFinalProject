//
//  MainViewController.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 27/07/2021.
// 

import UIKit

class MainViewController: UIViewController{

    let mySynth = Synth.shared
    let manager = FileManager.default
    
    var loadFileMod: LoadFileMod = .load
    var numberOfNote: Int = 26
    var socialMediaDialogeEffect = UIVisualEffectView()
    let blurEffect = UIBlurEffect(style: .light)
    var recordFlashing: Bool = false
    var playFlashing: Bool = false
    
    let synthColorCode = SynthColorCode()
    var keyboardViewIsLoaded:Bool = false
    var frequenctIsHidden:Bool = true
    let mainAudioMixer = MainAudioMixer()
    
    @IBOutlet weak var keyboardView: KeyboardView!    
    @IBOutlet weak var settingView: UIView!
    @IBOutlet weak var fxScrollView: FxBtnView!
    @IBOutlet weak var synthSettingView: UIView!
    @IBOutlet weak var settingScrollView: UIScrollView!
    @IBOutlet weak var octaveOutlet: UIStepper!
    @IBOutlet weak var octaveNum: UILabel!
    @IBOutlet weak var settingOutlet: UIButton!
    @IBOutlet weak var synthSettingOutlet: UIButton!
    @IBOutlet weak var generalSettingTableView: UIView!
    @IBOutlet weak var socialMediaDialoge: UIView!
    @IBOutlet weak var socialMediaDialogeBorder: UIView!
    @IBOutlet weak var recordBtnOutlet: UIButton!
    @IBOutlet weak var playBtnOutlet: UIButton!
    @IBOutlet weak var pauseBtnOutlet: UIButton!
    @IBOutlet weak var stopBtnOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMethods()
    }
    
    override func viewDidLayoutSubviews() {
        
        if !keyboardViewIsLoaded {
            keyboardView.loadKeyViews(keyNumber: numberOfNote)
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
    
    @IBAction func setSynthVolume(_ sender: UISlider) {
        mySynth.setVolume(volume: sender.value)
        
    }
    
    @IBAction func setPlaybackVolume(_ sender: UISlider) {
        mainAudioMixer.setVolume(sender.value)
    }
    
    @IBAction func settingBtn(_ sender: UIButton) {
        
        if sender.alpha != 1 {
            synthSettingOutlet.alpha = 0.5
            sender.alpha = 1
            synthSettingView.isHidden = true
            settingScrollView.isHidden = false
            generalSettingTableView.isHidden = false
        } else {
            sender.alpha = 0.5
            hiddeSettings()
        }
    }
    
    @IBAction func synthSettingBtn(_ sender: UIButton) {
        
        if sender.alpha != 1 {
            settingOutlet.alpha = 0.5
            sender.alpha = 1
            generalSettingTableView.isHidden = true
            settingScrollView.isHidden = false
            synthSettingView.isHidden = false
        } else {
            sender.alpha = 0.5
            hiddeSettings()
        }
        
    }
    
    @IBAction func toggleRecordBtn(_ sender: UIButton) {
        mainAudioMixer.toggleRecord()
        if recordFlashing {
            stopFlashing(recordItem: .record)
            recordFlashing = false
        } else {
            startFlashing(recordItem: .record)
            recordFlashing = true
        }
    }
    
    @IBAction func playBtn(_ sender: UIButton) {
            mainAudioMixer.playPlayback()
        startFlashing(recordItem: .play)
        btnToGray()
        playBtnOutlet.tintColor = .white
    }
    
    @IBAction func pauseBtn(_ sender: UIButton) {
        mainAudioMixer.pausePlayback()
        stopFlashing(recordItem: .play)
        btnToGray()
        pauseBtnOutlet.tintColor = .white
    }
    
    @IBAction func stopBtn(_ sender: UIButton) {
        mainAudioMixer.stopPlayback()
        stopFlashing(recordItem: .play)
        btnToGray()
        stopBtnOutlet.tintColor = .white
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.stopBtnOutlet.tintColor = .gray
        }
    }
    
    @IBAction func youtubeBtn(_ sender: UIButton) {
        guard let url = URL(string: WebLinkes.youtube.rawValue) else {return}
        UIApplication.shared.open( url, options: [: ], completionHandler: nil)
    }
    
    @IBAction func instagramBtn(_ sender: UIButton) {
        guard let url = URL(string: WebLinkes.instagram.rawValue) else {return}
        UIApplication.shared.open( url, options: [: ], completionHandler: nil)
    }
    
    @IBAction func facebookBtn(_ sender: UIButton) {
        guard let url = URL(string: WebLinkes.facebook.rawValue) else {return}
        UIApplication.shared.open( url, options: [: ], completionHandler: nil)
    }
    
    @IBAction func linkedinBtn(_ sender: UIButton) {
        guard let url = URL(string: WebLinkes.linkedin.rawValue) else {return}
        UIApplication.shared.open( url, options: [: ], completionHandler: nil)
    }
    
    func hiddeSettings(){
        settingScrollView.isHidden = true
        synthSettingView.isHidden = true
        generalSettingTableView.isHidden = true
    }
    
    func setupMethods(){
        addBackground()
        addSocialMediaDialogeBackground()
        addSocialMediaDialogeBorderBackground()
        socialMediaDialogeEffect = UIVisualEffectView(frame: self.view.frame)
        socialMediaDialogeEffect.effect = blurEffect
        self.view.addSubview(socialMediaDialogeEffect)
        self.view.addSubview(socialMediaDialogeBorder)
        dismissSocialMediaDialoge()
        fxScrollView.loadFxBtns()
        generalSettingTableView.isHidden = true
        synthSettingView.isHidden = true
        settingScrollView.isHidden = true
        octaveOutlet.value = 3
        octaveOutlet.backgroundColor = synthColorCode.synthColorCode(.pitch)
        octaveOutlet.tintColor = .white
        octaveNum.textColor = synthColorCode.synthColorCode(.pitch)
        self.overrideUserInterfaceStyle = .dark
    }
    
}


enum WebLinkes: String {
    case instagram = "https://www.instagram.com/david.noy.music/"
    case youtube = "https://www.youtube.com/channel/UCWbjZLfcN5db4PQTHA1JmDg"
    case facebook = "https://www.facebook.com/david.noy.58/"
    case linkedin = "https://www.linkedin.com/in/david-noy/"
}
