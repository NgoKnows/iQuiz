//
//  QuizController.swift
//  iQuiz
//
//  Created by Alex Ngo on 5/12/16.
//  Copyright © 2016 Alex Ngo. All rights reserved.
//

import UIKit

class QuizNavigationController: UINavigationController {
  var data : AnyObject = []
  var question = 0
  var score = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print(data)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  
}

