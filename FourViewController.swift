//
//  FourViewController.swift
//  SlideNavDemo
//
//  Created by Lynn Smith on 12/14/14.
//  Copyright (c) 2014 Lynn Smith. All rights reserved.
//

import UIKit

class FourViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
  @IBAction func BananaButtonPressed(sender: AnyObject) {
    //let app =  UIApplication.sharedApplication()
    //app.openURL(URLWithString:@"https://www.youtube.com/watch?v=wky5H1xC6-I")
    UIApplication.sharedApplication().openURL(NSURL(string:"https://www.youtube.com/watch?v=wky5H1xC6-I")! )
  }
  
}
