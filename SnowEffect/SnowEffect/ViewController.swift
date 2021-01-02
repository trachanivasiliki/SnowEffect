//
//  ViewController.swift
//  SnowEffect
//
//  Created by Vasiliki Trachani on 2/1/21.
//

import UIKit

class ViewController: UIViewController {

    private var snowLayer = SnowEffectLayer()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    fileprivate func setUp() {
        snowLayer.yAcceleration = 20.0
        snowLayer.effectImage = UIImage(named: "snowFlake")
        snowLayer.injectSnowLayer(into: self.view)
    }
    
    @IBAction func stopSnowing(_ sender: Any) {
        snowLayer.removeSnowLayer(from: self.view)
    }

}

