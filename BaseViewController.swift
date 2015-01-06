//
//  BaseViewController.swift
//  SlideNavDemo
//
//  Created by Lynn Smith on 12/10/14.
//  Copyright (c) 2014 Lynn Smith. All rights reserved.
//

import UIKit
import QuartzCore

class BaseViewController: UIViewController {

  @IBOutlet weak var menuButton: UIButton!
  @IBOutlet weak var monitorButton: UIButton!
  
  let screenSize: CGRect = UIScreen.mainScreen().bounds
  let topMenuHeight :CGFloat = 60.0
  var menuOpen = false  
  var menuWidth = 160
  var statusHeight = 20
  
  var mainActivityVC  :MainActivityViewController
  var TwoVC           :TwoViewController
  var ThreeVC         :ThreeViewController
  var FourVC          :FourViewController

  required init(coder aDecoder: NSCoder) {
    
    mainActivityVC = MainActivityViewController(nibName: "MainActivityViewController", bundle: nil)
    mainActivityVC.view.frame = CGRectMake(0, topMenuHeight, screenSize.width, screenSize.height - topMenuHeight)
    
    TwoVC = TwoViewController(nibName: "TwoViewController", bundle: nil)
    TwoVC.view.frame = CGRectMake(0, topMenuHeight, screenSize.width, screenSize.height - topMenuHeight)

    ThreeVC = ThreeViewController(nibName: "ThreeViewController", bundle: nil)
    ThreeVC.view.frame = CGRectMake(0, topMenuHeight, screenSize.width, screenSize.height - topMenuHeight)
    
    FourVC = FourViewController(nibName: "FourViewController", bundle: nil)
    FourVC.view.frame = CGRectMake(0, topMenuHeight, screenSize.width, screenSize.height - topMenuHeight)
    
    super.init(coder: aDecoder)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  
    // add view controllers with the one you want initially displayed added last
    self.view.addSubview(TwoVC.view)
    self.view.addSubview(ThreeVC.view)
    self.view.addSubview(FourVC.view)
    self.view.addSubview(mainActivityVC.view)
  }

  
  @IBAction func menuButtonToggle(sender: AnyObject) {
    if (menuOpen) { // close
      animateCenterPanelXPosition(targetPosition: 0)
      menuOpen = false
    } else {        // open
      animateCenterPanelXPosition(targetPosition: 150)
      menuOpen = true
    }
  }

  @IBAction func menuBtn1(sender: AnyObject) {
    self.view.bringSubviewToFront(mainActivityVC.view)
    self.menuButtonToggle(self)
  }
  
  @IBAction func TwoButtonPressed(sender: AnyObject) {
    self.view.bringSubviewToFront(TwoVC.view)
    self.menuButtonToggle(self)
  }

  @IBAction func ThreeButtonPressed(sender: AnyObject) {
    self.view.bringSubviewToFront(ThreeVC.view)
    self.menuButtonToggle(self)
  }
  
  @IBAction func FourButtonPressed(sender: AnyObject) {
    self.view.bringSubviewToFront(FourVC.view)
    self.menuButtonToggle(self)
  }

  func animateCenterPanelXPosition(#targetPosition: CGFloat, completion: ((Bool) -> Void)! = nil) {
    UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .CurveEaseInOut, animations: {
      self.mainActivityVC.view.frame.origin.x = targetPosition
      self.TwoVC.view.frame.origin.x = targetPosition
      self.ThreeVC.view.frame.origin.x = targetPosition
      self.FourVC.view.frame.origin.x = targetPosition
      }, completion: completion)
  }
  
}

