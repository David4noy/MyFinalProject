//
//  FlangerViewController.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 04/08/2021.
//

import UIKit

class FlangerViewController: UIViewController {

    @IBOutlet weak var itemsView: UIView!
    @IBOutlet weak var frequencyLabel: UILabel!
    @IBOutlet weak var depthLabel: UILabel!
    @IBOutlet weak var feedbackLabel: UILabel!
    @IBOutlet weak var dryWetLabel: UILabel!
        var scrollView:UIScrollView  = {
            let scrollView = UIScrollView()
            scrollView.contentSize = CGSize(width: 410, height: 200)
            return scrollView
        }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (UIDevice.current.userInterfaceIdiom == .phone) {
            loadScrollView()
        }
        
    }
    @IBAction func frequencySlider(_ sender: UISlider) {
    }
    
    @IBAction func depthSlider(_ sender: UISlider) {
    }
    
    @IBAction func feedbackSlider(_ sender: UISlider) {
    }
    @IBAction func dryWetSliderSlider(_ sender: UISlider) {
    }
    
    func loadScrollView(){
        
        self.view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.bounds = self.view.bounds
       // scrollView.contentSize = CGSize(width: 410, height: 200)
        scrollView.addSubview(itemsView)
      //  itemsView.translatesAutoresizingMaskIntoConstraints = false
        itemsView.bounds = scrollView.bounds
        
        
    }
    
    
}
