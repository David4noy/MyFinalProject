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
    
    func didSetSetting(numberOfKeys: Int, inputGain: Float, bool: Bool, settingItems: SettingItems) {
        
        switch settingItems {
        case .chooseFile:
            loadFile(loadFileMod: .load)
        case .numberOfKeys:
            setNumberOfKeys(num: numberOfKeys)
        case .visualEQ:
            print("visualEQ")
        case .myScocialMedia:
            print("myScocialMedia")
        case .inputGain:
            mainAudioMixer.setRecordInputGain(inputGain)
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
        keyboardView.numberOfNote = numberOfNote
     //   keyboardView.reloadKeysViews()
        print(numberOfNote)
    }
    
    func setRecordInputGain(_ gain: AUValue){
        self.mainAudioMixer.setRecordInputGain(gain)
    }
    
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

extension MainViewController: UIDocumentPickerDelegate{
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        
        guard let url = self.manager.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
        let audioFolder = url.appendingPathComponent("Audio")
        
        guard let selectedFileURL = urls.first else {return}
        
        switch loadFileMod {
        
        // Load the file to the player
        case .load:
            
        //    url = selectedFileURL
//            addPlaybackFile()
            
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
