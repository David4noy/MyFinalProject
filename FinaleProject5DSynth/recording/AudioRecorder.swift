//
//  AudioRecorder.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 08/08/2021.
//

import Foundation
import AudioKit
import AVFoundation

enum RecorderState: Int {
    case Idle = 0
    case Recording = 1
    case Exporting = 2
}

protocol AudioRecorderFileDelegate {
    func didFinishRecording(file: AVAudioFile)
}

protocol AudioRecorderViewDelegate {
    func updateRecorderView(state: RecorderState, time: Double?)
}

class AudioRecorder {

    var nodeRecorder: NodeRecorder?
    var internalFile: AVAudioFile?
    var fileDelegate: AudioRecorderFileDelegate?
    var viewDelegate: AudioRecorderViewDelegate?
    var viewTimer: Timer? // Timer to update View on recording progress
    var fileName:String? = nil
    let recordsFolderUrl:URL? = nil
    
    
    public init(node: Node,
                file: AVAudioFile? = nil) {
        do {
            try self.nodeRecorder = NodeRecorder(node: node)
        } catch let error as NSError {
            Log(error.description)
        }
        
        let manager = FileManager.default
        guard let url = manager.urls(for: .musicDirectory, in: .userDomainMask).first else {return}
        let recordsFolderUrl = url.appendingPathComponent("Records")
        
        do {
            try manager.createDirectory(at: recordsFolderUrl, withIntermediateDirectories: true, attributes: [:])
        } catch  {
            Log(error)
            print(error)
        }
                
    }
  
    public func toggleRecord(value: Double) {
        
        let shouldRecord = value == 1
        guard let recorder = nodeRecorder else { return }
        if recorder.isRecording && !shouldRecord {
            recorder.stop()
            Log("File at: ", recorder.audioFile)
            guard let recordingFile = recorder.audioFile else { return }
            
            // callback לסיום?
            convertAndSaveFile(audioFile: recordingFile)
            
            
//            exportAsynchronously(
//                name: createDateFileName() + ".wav",
//                baseDir: .temp,
//                exportFormat: .wav,
//                callback: { exportedFile, error in
//                    if error != nil { return }
//                    guard let file = exportedFile else { return }
//                    DispatchQueue.main.async {
//                        self.fileDelegate?.didFinishRecording(file: file)
//                        self.updateView()
//                    }
//            })
            viewTimer?.invalidate()
            viewDelegate?.updateRecorderView(state: .Exporting, time: 0)
        } else {
            do {
                try recorder.reset()
                try recorder.record()
                viewTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { (_) in
                    self.updateView()
                })
            } catch let error as NSError {
                Log(error.description)
            }
        }
    }

    private func updateView() {
        guard let recorder = nodeRecorder else { return }
        let state: RecorderState = recorder.isRecording ? .Recording : .Idle
        viewDelegate?.updateRecorderView(state: state, time: recorder.recordedDuration)
    }

    // Use Date and Time as Filename
//    private func createDateFileName() -> String {
//        if fileName != nil{
//            return String("\(fileName)")
//        } else {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd HH-mm-ss"
//        return dateFormatter.string(from:Date())
//        }
//    }
    
    // Use Date and Time as Filename or get name
    private func createDateFileName() {
        if fileName != nil{
            self.fileName = String("\(fileName)")
        }else {
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
        
        let inputURL = audioFile.url
        if let outputURL = recordsFolderUrl?.appendingPathComponent("\(audioFile).wav"){
            print("************** Records folder:",outputURL.path, "*****************")
        let formatConverter = FormatConverter(inputURL: inputURL, outputURL: outputURL, options: options)
        formatConverter.start()
        } else {
            print("Fall to find 'Records' folder")
        }
        
        
    }
    

}

