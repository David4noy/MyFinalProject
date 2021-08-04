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
    
    
    
    @IBAction func setGeneralVolume(_ sender: UISlider) {
        mySynth.setVolume(volume: sender.value)
    }
    
    @IBAction func settingBtn(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackground()
        keyboardView.loadKeyViews()
        fxScrollView.loadFxBtns()
        synthSettingView.isHidden = true
        settingScrollView.isHidden = true
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

