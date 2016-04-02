//
//  ViewController.swift
//  Python Quiz
//
//  Created by Langtao Huang on 4/1/16.
//  Copyright © 2016 hlt04. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var input: UITextField!
    
    @IBOutlet weak var response: UILabel!
    
    @IBOutlet weak var submit: UIButton!
    
    @IBOutlet weak var next: UIButton!
    
    var correctAnswer = String();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayQuestion() {
        question.text = "What is 1 + 1?"
        correctAnswer = "2"
        hideResponse()
    }
    
    func hideResponse() {
        response.hidden = true
    }
    
    func showResponse() {
        response.hidden = false
    }

    @IBAction func submitaction(sender: AnyObject) {
        let inputText = input.text;
        if inputText == correctAnswer {
            response.text = "Correct answer!"
        } else {
            response.text = "Wrong answer"
        }
        showResponse()
    }
    
    

}

