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
        //        else if let dest = segue.destination as? SynthSettingTableViewController{
        //                // For future using, do stuff with synth settings
        //            print("Moved to SynthSettingTableViewController")
        //        }
    }
    
    // MARK: Delegate func
    func didSetSetting(numberOfKeys: Int, inputGain: Float, bool: Bool, settingItems: SettingItems) {
        
        // According to the Enum case do
        switch settingItems {
        case .chooseFile:
            loadFile(loadFileMod: .load)
        case .numberOfKeys:
            setNumberOfKeys(num: numberOfKeys)
        case .visualEQ:
            print("visualEQ")
        case .myScocialMedia:
            addSocialMediaDialoge()
        case .inputGain:
            mainAudioMixer.setRecordInputGain(inputGain)
        case .synthInputGain:
            mainAudioMixer.setRecordInputSynthGain(inputGain)
        case .playbackInputGain:
            mainAudioMixer.setRecordInputPlayerGain(inputGain)
        case .recordName:
            setRecordName()
        case .recordPlaybackToo:
            mainAudioMixer.isRecordingPlayback(bool)
        case .countdown:
            print("countdown")
        case .copyFileToAppFolder:
            loadFile(loadFileMod: .copy)
        }
    }
    
    func setNumberOfKeys(num: Int){
        switch num {
        case 0:
            numberOfNote = 13
        case 1:
            numberOfNote = 19
        case 2:
            numberOfNote = 26
        default:
            numberOfNote = 26
        }
        //  keyboardView.numberOfNote = numberOfNote
        //   keyboardView.reloadKeysViews()
        print(numberOfNote,"Keys num changed")
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
        
        if !socialMediaDialogeBorder.frame.contains(touchLocation){
            dismissSocialMediaDialoge()
        }

    }
    
    // The dismiss func
    func dismissSocialMediaDialoge(){
        socialMediaDialogeBorder.isHidden = true
        socialMediaDialogeEffect.isHidden = true
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
