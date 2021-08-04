//
//  ModViewController.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 31/07/2021.
//

import UIKit

class ModViewController: UIViewController {
    
    let mySynth = Synth.shared

    @IBOutlet weak var chorusVC: UIView!
    @IBOutlet weak var flangerVC: UIView!
    @IBOutlet weak var tremoloVC: UIView!
    @IBOutlet weak var chorusScrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chorusVC.isHidden = false
        flangerVC.isHidden = true
        tremoloVC.isHidden = true
        
        chorusVC.backgroundColor = .clear
        flangerVC.backgroundColor = .clear
        tremoloVC.backgroundColor = .clear
    }

    @IBAction func selectModSegment(_ sender: UISegmentedControl) {
        
        chorusVC.isHidden = true
        flangerVC.isHidden = true
        tremoloVC.isHidden = true
        
        switch sender.selectedSegmentIndex {
        case 0:
            chorusVC.isHidden = false
        case 1:
            flangerVC.isHidden = false
        case 2:
            tremoloVC.isHidden = false
        default:
            break
        }
    }
    
    @IBAction func chorusFreqSlider(_ sender: UISlider) {
        mySynth.setModFrequency(sender.value)
    }
    
    @IBAction func chorusFreqET(_ sender: UITextField) {
        guard let frequncy = (sender.text as NSString?)?.floatValue else {
            return
        }

        mySynth.setModFrequency(frequncy)
    }
    
    
}
