//
//  Finished.swift
//  iQuiz
//
//  Created by Alex Ngo on 5/14/16.
//  Copyright © 2016 Alex Ngo. All rights reserved.
//

import UIKit

class FinishedController: UIViewController {
  var data : AnyObject = []
  var score = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let q = data["questions"]!![self.question] as! [String: AnyObject]
    
    questionLabel.text = q["text"]! as! String
    answerLabel.text = "hi"
    correctLabel.text = self.right ? "Correct!" : "Wrong!"
    nextButton.addTarget(self, action: #selector(AnswerController.next), forControlEvents: .TouchUpInside)
    
  }
    
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}

