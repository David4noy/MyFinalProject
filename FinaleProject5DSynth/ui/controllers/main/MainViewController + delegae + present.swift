//
//  MainViewController + delegae + present.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 18/08/2021.
//

import UIKit
import AudioKit
import AVFoundation


extension MainViewController: SettingDelegate {
    
    // Define self as the delegate throgh the TableVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? GeneralSettingTableViewController{
            dest.delegate = self
        }

    }
    
    // MARK: Delegate func
    func didSetSetting(mod: Int, inputGain: Float, bool: Bool, settingItems: SettingItems) {
        
        // According to the Enum case do
        switch settingItems {
        
        case .chooseFile:
            loadFile(loadFileMod: .load)
            
        case .darkMod:
            darkModActivation(num: mod)
            generalData?.darkLightMod = Int64(mod)

        case .inputGain:
            mainAudioMixer.setRecordInputGain(inputGain)
            generalData?.recordInputGain = inputGain
            
        case .synthInputGain:
            mainAudioMixer.setRecordInputSynthGain(inputGain)
            generalData?.synthRecordGain = inputGain
            
        case .playbackInputGain:
            mainAudioMixer.setRecordInputPlayerGain(inputGain)
            generalData?.playbackRecordGain = inputGain
            
        case .recordName:
            setRecordName()
            
        case .recordPlaybackToo:
            mainAudioMixer.isRecordingPlayback(bool)
            generalData?.recordPlayback = bool
            
        case .recordCountdown:
            recordIsCountdowning = bool
            generalData?.recordCountdown = bool
            
        case .playbackCountdown:
            playbackIsCountdowning = bool
            generalData?.playbackCountdown = bool
            
        case .copyFileToAppFolder:
            loadFile(loadFileMod: .copy)
            
            
        case .about:
            showAbout()
            dialogsMod = .about
            
        case .myScocialMedia:
            addSocialMediaDialoge()
            dialogsMod = .socialMedia
        }
        
        save.saveContext()
        
    }
    
    func showAbout(){
        
        if (UIDevice.current.userInterfaceIdiom == .pad) {
            aboutLabel.font = UIFont(name:"Charter Roman",size:32)
            
            aboutScrollingView.frame = CGRect(width: 700, height: 400)
            aboutScrollingView.center = CGPoint(x: self.view.frame.maxX / 2, y: self.view.frame.maxY / 2)
            aboutLabel.frame = CGRect(x: 0, y: 0, width: 700, height: 1400)
            aboutScrollingView.contentSize = CGSize(width: 700, height: 1400)
            
            aboutView.frame = CGRect(width: 730, height: 430)
            aboutView.center = CGPoint(x: self.view.frame.maxX / 2, y: self.view.frame.maxY / 2)
            
            aboutView2.frame = CGRect(width: 720, height: 420)
            aboutView2.center = CGPoint(x: self.view.frame.maxX / 2, y: self.view.frame.maxY / 2)
            
        } else {
            aboutLabel.font = UIFont(name:"Charter Roman",size:23)
            
            aboutScrollingView.frame = CGRect(width: 400, height: 300)
            aboutScrollingView.center = CGPoint(x: self.view.frame.maxX / 2, y: self.view.frame.maxY / 2)
            aboutLabel.frame = CGRect(x: 0, y: 0, width: 400, height: 1150)
            aboutScrollingView.contentSize = CGSize(width: 400, height: 1150)
            
            aboutView.frame = CGRect(width: 430, height: 330)
            aboutView.center = CGPoint(x: self.view.frame.maxX / 2, y: self.view.frame.maxY / 2)
            
            aboutView2.frame = CGRect(width: 420, height: 320)
            aboutView2.center = CGPoint(x: self.view.frame.maxX / 2, y: self.view.frame.maxY / 2)
            
        }
        
        aboutView.layer.masksToBounds = true
        aboutView.layer.cornerRadius = 10.0
        
        aboutView2.layer.masksToBounds = true
        aboutView2.layer.cornerRadius = 10.0
        
        aboutLabel.layer.masksToBounds = true
        aboutLabel.layer.cornerRadius = 10.0
        
        self.view.addSubview(aboutView)
        self.view.addSubview(aboutView2)
        self.view.addSubview(aboutScrollingView)
        self.view.bringSubviewToFront(aboutScrollingView)
        
        
        aboutLabel.numberOfLines = 0
        aboutLabel.textColor = .black
        aboutLabel.backgroundColor = .clear
        aboutLabel.textAlignment = .left
        
        
        aboutLabel.text = "Hello, and welcome to my app! \nFirst I want to thank you for downloading and using my app, I hope you'll find my app fun and useful. \n\nSome point who might help you to use the app: \n\n1) Gain on 0 => silence, gain on 1 => normal (no change). \n\n2) Every long rectangle is a step of half tone. for the fix tone frequency - touch on the black line in between the long rectangles. \n\n3) The point of this new kind of instrument is to give you the ability to rich ALL the frequency - absolutely chromatically. This way you can find new tones and new approach to you playing. \n\n4) Because of that, there is a little learning cruve, but it worth it!\n\n5) Because we use to play with 12-tone equal temperament, the tone we use to play are a little 'out of tune'. But here, because you have all the tones, sometimes you'll find yourself playing according to you hears and it not perfectly match (for example the # will be higher and the b will be lower). It's perfectly ok and cool, don't worry. Also, when you will play with fixed playback you will play differently.\n\nThanks again and rock on!\nDavid Noy"
        
        
        aboutScrollingView.addSubview(aboutLabel)
        
        let gradientLayer1 = CAGradientLayer()
        gradientLayer1.frame = aboutView2.bounds
        gradientLayer1.startPoint = CGPoint(x: 1, y: 0)
        gradientLayer1.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer1.colors = [UIColor.orange.cgColor,UIColor.yellow.cgColor,UIColor.purple.cgColor]
        aboutView2.layer.insertSublayer(gradientLayer1, at: 0)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = aboutView.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.colors = [UIColor.cyan.cgColor,UIColor.purple.cgColor,UIColor.cyan.cgColor]
        aboutView.layer.insertSublayer(gradientLayer, at: 0)
        
        socialMediaDialogeEffect.isHidden = false
        aboutView.isHidden = false
        aboutView2.isHidden = false
        aboutScrollingView.isHidden = false
        aboutLabel.isHidden = false
        
    }
    
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
            mainAudioMixer.toggleRecord()
            recordCount = 4
            //  recordCountdownView.isHidden = true
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
    
    
    func darkModActivation(num: Int){
        switch num {
        case 0:
            self.overrideUserInterfaceStyle = .unspecified
        case 1:
            self.overrideUserInterfaceStyle = .dark
        case 2:
            self.overrideUserInterfaceStyle = .light
        default:
            self.overrideUserInterfaceStyle = .unspecified
        }        
    }
    
    // Set the file name of the next record
    func setRecordName(){
        
        var fileName: String? = nil
        
        let nameAlert = UIAlertController(title: "File name:", message: nil, preferredStyle: .alert)
        
        nameAlert.addTextField { textField in
            textField.placeholder = "Name of the file"
        }
        
        nameAlert.addAction(.init(title: "Cancel", style: .destructive, handler: { action in
            print("Cancel")
        }))
        
        nameAlert.addAction(.init(title: "Add", style: .default, handler: { action in
            fileName = nameAlert.textFields?[0].text ?? nil
            print(fileName ?? "Name is empty")
            self.mainAudioMixer.setRecordName(fileName)
        }))
        
        self.present(nameAlert, animated: true)
        
    }
    
    // Choose file and or load it or copy it (or add to playlist - not avilable in this version)
    func loadFile(loadFileMod:LoadFileMod){
        
        self.loadFileMod = loadFileMod
        
        let docomentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [UTType.aiff,UTType.mp3,UTType.wav,UTType.audio], asCopy: true)
        docomentPicker.delegate = self
        
        if self.loadFileMod == .addToPlaylist {
            docomentPicker.allowsMultipleSelection = true
        } else {
            docomentPicker.allowsMultipleSelection = false
        }
        
        self.present(docomentPicker, animated: true, completion: nil)
    }
    
    func showLoadAlert(_ inputMessage:String? = nil) {
        
        var message = inputMessage
        
        if message == nil {
            message = loadFileMod.rawValue
        }
        
        
        let alert = UIAlertController(title: "Player", message: message, preferredStyle: .alert)
        self.present(alert,animated: true){
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                alert.dismiss(animated: true)
            }
        }
    }
    
    // Backgrounf image
    func addBackground() {
        
        let backgroundImageView = UIImageView(frame: UIScreen.main.bounds)
        let imageName: String = "sky_stars_background"
        
        backgroundImageView.image = UIImage(named: imageName)
        backgroundImageView.contentMode = self.view.contentMode
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(backgroundImageView)
        self.view.sendSubviewToBack(backgroundImageView)
        
    }
    
    //Social Media Dialoge Background
    func addSocialMediaDialogeBackground(){
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = socialMediaDialoge.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.colors = [UIColor.purple.cgColor,UIColor.cyan.cgColor,UIColor.purple.cgColor]
        socialMediaDialoge.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
    // Social Media Dialoge Border
    func addSocialMediaDialogeBorderBackground(){
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = socialMediaDialogeBorder.bounds
        gradientLayer.colors = [UIColor.yellow.cgColor, UIColor.orange.cgColor]
        socialMediaDialogeBorder.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
    // Touch to dismiss th dialoge
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchLocation = touches.first?.location(in: self.view) else {return}
        
        switch dialogsMod {
        case .socialMedia:
            if !socialMediaDialogeBorder.frame.contains(touchLocation){
                dismissSocialMediaDialoge()
            }
        case .about:
            if !aboutView.frame.contains(touchLocation){
                dismissSocialMediaDialoge()
            }
        case .none:
            break
        }
        
    }
    
    
    // The dismiss func
    func dismissSocialMediaDialoge(){
        socialMediaDialogeBorder.isHidden = true
        socialMediaDialogeEffect.isHidden = true
        
        aboutView.isHidden = true
        aboutView2.isHidden = true
        aboutScrollingView.isHidden = true
        aboutLabel.isHidden = true
        
        dialogsMod = .none
    }
    
    // Show the dialoge
    func addSocialMediaDialoge(){
        
        socialMediaDialogeBorder.isHidden = false
        socialMediaDialogeEffect.isHidden = false
        
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
            view.alpha = 0.6
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
    
    
}

// MARK: For Picking Audio File
extension MainViewController: UIDocumentPickerDelegate{
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        
        guard let url = self.manager.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
        let audioFolder = url.appendingPathComponent("Audio")
        
        guard let selectedFileURL = urls.first else {return}
        
        switch loadFileMod {
        
        // Load the file to the player
        case .load:
            mainAudioMixer.loadFile(url: selectedFileURL)
            showLoadAlert()
            
        // Copy the file to the Audio folder
        case .copy:
            let sandboxFileURL = audioFolder.appendingPathComponent(selectedFileURL.lastPathComponent)
            
            if FileManager.default.fileExists(atPath: sandboxFileURL.path){
                showLoadAlert("Already Exists")
                print("Already Exists")
            } else {
                do {
                    try FileManager.default.copyItem(at: selectedFileURL, to: sandboxFileURL)
                    showLoadAlert()
                    print("Copied file")
                } catch  {
                    print("Error", error)
                }
            }
            
        // Add the file to the playlist
        case .addToPlaylist:
            
            for item in urls{
                
                mainAudioMixer.addToPlaylist(playerFile: PlayerFile(
                    url: item ,
                    name: item.deletingPathExtension().lastPathComponent
                ))
                //                self.audioFileList.append(
                //                    PlayerFile(
                //                        url: item ,
                //                        name: item.deletingPathExtension().lastPathComponent
                //                    )
                //                )
                showLoadAlert()
            }
        }
        
        print(loadFileMod.rawValue)
        
    }
    
}

enum LoadFileMod: String{
    
    case load = "Loaded"
    case copy = "Copied to audio folder"
    case addToPlaylist = "File added to playlist"
    
}

enum RecordItem {
    case play
    case record
}
