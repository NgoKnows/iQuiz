//
//  FinishedController.swift
//  iQuiz
//
//  Created by Alex Ngo on 5/14/16.
//  Copyright © 2016 Alex Ngo. All rights reserved.
//

import UIKit

class FinishedController: UIViewController {
  var data : AnyObject = []
  var score = 0
  
  @IBOutlet weak var messageLabel: UILabel!
  @IBOutlet weak var correctLabel: UILabel!
  @IBOutlet weak var Done: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let length = self.data["questions"]!!.count
    correctLabel.text = String(score) + " out of " + String(length) + " correct!"
    
    if Double(score) / Double(length) > 0.5 {
      messageLabel.text = "Good Job"
    } else {
      messageLabel.text = "Try harder next time"
    }
    
    Done.addTarget(self, action: #selector(FinishedController.done), forControlEvents: .TouchUpInside)
  }
  
  func done() {
    self.performSegueWithIdentifier("done", sender: self)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}
