//
//  QuestionController.swift
//  iQuiz
//
//  Created by Alex Ngo on 5/12/16.
//  Copyright © 2016 Alex Ngo. All rights reserved.
//

import UIKit

class QuestionController: UIViewController {
  var data : AnyObject = []
  var question = 0
  var score = 0
  var right = false

  @IBOutlet weak var button1: UIButton!
  @IBOutlet weak var button2: UIButton!
  @IBOutlet weak var button3: UIButton!
  @IBOutlet weak var button4: UIButton!
  @IBOutlet weak var questionLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let q = data["questions"]!![self.question] as! [String: AnyObject]

    questionLabel.text = q["text"]! as! String
    
    button1.setTitle(q["answers"]![0] as! String, forState: .Normal)
    button1.addTarget(self, action: #selector(QuestionController.pickAnswer), forControlEvents: .TouchUpInside)
    
    button2.setTitle(q["answers"]![1] as! String, forState: .Normal)
    button2.addTarget(self, action: #selector(QuestionController.pickAnswer), forControlEvents: .TouchUpInside)
    
    button3.setTitle(q["answers"]![2] as! String, forState: .Normal)
    button3.addTarget(self, action: #selector(QuestionController.pickAnswer), forControlEvents: .TouchUpInside)
    
    button4.setTitle(q["answers"]![3] as! String, forState: .Normal)
    button4.addTarget(self, action: #selector(QuestionController.pickAnswer), forControlEvents: .TouchUpInside)
  }
  
  
  func pickAnswer(sender: UIButton) {
    var a = 0
    if sender === button1 {
      a = 1
    } else if sender === button2 {
      a = 2
    } else if sender === button3 {
      a = 3
    } else {
      a = 4
    }
    
    let answer = Int((data["questions"]!![self.question]["answer"]! as! NSString).intValue)
    if answer == a {
      self.score += 1
      self.right = true
    }
    
    print(self.score)
    
    self.performSegueWithIdentifier("answer", sender: self)
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
    let vc = segue.destinationViewController as! AnswerController
    vc.data = self.data
    vc.question = self.question
    vc.score = self.score
    vc.right = self.right
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}
