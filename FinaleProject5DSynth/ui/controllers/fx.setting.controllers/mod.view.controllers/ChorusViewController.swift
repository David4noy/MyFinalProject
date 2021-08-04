//
//  ChorusViewController.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 02/08/2021.
//

import UIKit

class ChorusViewController: UIViewController {

    @IBOutlet weak var chorusScrollView: UIScrollView!
    @IBOutlet weak var chorusInView: UIView!
    
    @IBOutlet weak var chorusFrequencyLabel: UILabel!
    @IBOutlet weak var chorusDepthLabel: UILabel!
    @IBOutlet weak var chorusFeedbackLabel: UILabel!
    @IBOutlet weak var chorusDryWetLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chorusScrollView.translatesAutoresizingMaskIntoConstraints = false

        if (UIDevice.current.userInterfaceIdiom == .pad) {
            print("We are in a ipad device")
         //   chorusScrollView.contentSize = CGSize(width: chorusScrollView.frame.width, height: 480)

            chorusScrollView.frame.size.height = 480
        } else {
            print("We are in a phone device")
         //   chorusScrollView.contentSize = CGSize(width: chorusScrollView.frame.width, height: 240)
            chorusScrollView.frame.size.height = 240
        }
        
        print("************************")
        print(self.view.frame.width)
        print("************************")

    }
    
    @IBAction func chorusFrequencySlider(_ sender: UISlider) {
    }
    
    @IBAction func chorusDepthSlider(_ sender: UISlider) {
    }
    
    @IBAction func chorusFeedbackSlider(_ sender: UISlider) {
    }
    
    @IBAction func chorusDryWetSlider(_ sender: UISlider) {
    }
    
    
    
    
}
