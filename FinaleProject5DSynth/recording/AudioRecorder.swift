//
//  AudioRecorder.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 08/08/2021.
//

import Foundation
import AudioKit
import AVFoundation

class AudioRecorder {

    var nodeRecorder: NodeRecorder?
    var internalFile: AVAudioFile?
//    var viewTimer: Timer? // Timer to update View on recording progress
    var fileName:String? = nil
    var recordsFolderUrl:URL? = nil
    var isRecording:Bool = false
    
    
    public init(node: Node) {
        do {
            try self.nodeRecorder = NodeRecorder(node: node)
        } catch let error as NSError {
            Log(error.description)
        }
        
        let manager = FileManager.default
        guard let url = manager.urls(for: .musicDirectory, in: .userDomainMask).first else {return}
        let recordsUrl = url.appendingPathComponent("Records")
        
        do {
            try manager.createDirectory(at: recordsUrl, withIntermediateDirectories: true, attributes: [:])
        } catch  {
            Log(error)
            print(error)
        }
        recordsFolderUrl = recordsUrl
    }
  
    public func toggleRecord() {
        
        guard let recorder = nodeRecorder else { return }
        if recorder.isRecording {
            recorder.stop()
            Log("File at: ", recorder.audioFile)
            guard let recordingFile = recorder.audioFile else { return }
            
            convertAndSaveFile(audioFile: recordingFile)
            
        } else {
            do {
                try recorder.reset()
                try recorder.record()
//                viewTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { (_) in
//                    updateView()
//                })
            } catch let error as NSError {
                Log(error.description)
            }
        }
        isRecording = recorder.isRecording
    }
    
    // Use Date and Time as Filename or get name
    private func createDateFileName() {
        if fileName == nil{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH-mm-ss"
            self.fileName = dateFormatter.string(from:Date())
            }
    }
    
    func setFileName(_ fileName: String? = nil){
        self.fileName = fileName
    }
    
    func convertAndSaveFile(audioFile:AVAudioFile){
        createDateFileName()
        var options = FormatConverter.Options()
        options.format = "wav"
        options.sampleRate = 44100
        options.bitDepth = 24
        
        guard let fileName = self.fileName else {return}
        
        let inputURL = audioFile.url
        if let outputURL = recordsFolderUrl?.appendingPathComponent(fileName + ".wav"){
            print("************** Records folder:",outputURL.path, "*****************")
            
        let formatConverter = FormatConverter(inputURL: inputURL, outputURL: outputURL, options: options)
        formatConverter.start()
        } else {
            print("Fall to find 'Records' folder")
        }
        
        removeTempFiles()
    }
    
    func removeTempFiles(){
        
        do {
            let content = try FileManager.default.contentsOfDirectory(atPath: NSTemporaryDirectory())
            for path in content {
                let filePath = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(path)
                try FileManager.default.removeItem(at: filePath!)
            }
        }catch {
            print(error)
        }
    }

}

