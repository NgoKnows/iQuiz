//
//  Answer.swift
//  iQuiz
//
//  Created by Alex Ngo on 5/13/16.
//  Copyright © 2016 Alex Ngo. All rights reserved.
//

import UIKit

class AnswerController: UIViewController {
  var data : AnyObject = []
  var question = 0
  var score = 0
  var right = false

  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var answerLabel: UILabel!
  @IBOutlet weak var correctLabel: UILabel!
  @IBOutlet weak var nextButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let q = data["questions"]!![self.question] as! [String: AnyObject]
    let answer = Int((data["questions"]!![self.question]["answer"]! as! NSString).intValue) - 1
    
    questionLabel.text = q["text"]! as! String
    answerLabel.text = "Correct Answer: " + (q["answers"]![answer] as! String)
    correctLabel.text = self.right ? "You got it correct!" : "You got it wrong!"
    nextButton.addTarget(self, action: #selector(AnswerController.next), forControlEvents: .TouchUpInside)
    
    self.question += 1
  }
  
  func next() {
    let q = data["questions"]!! as! [AnyObject]
    if self.question == q.count {
      self.performSegueWithIdentifier("finished", sender: self)
    } else {
      self.performSegueWithIdentifier("question", sender: self)
    }
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
    if (segue.identifier == "question") {
      let vc = segue.destinationViewController as! QuestionController
      vc.data = self.data
      vc.question = self.question
      vc.score = self.score
    } else {
      let vc = segue.destinationViewController as! FinishedController
      vc.score = self.score
      vc.data = self.data
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}
