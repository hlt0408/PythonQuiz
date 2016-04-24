//
//  ViewController.swift
//  Python Quiz
//
//  Created by Langtao Huang on 4/1/16.
//  Modified by Degan Hao on 4/22/16.
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
        displayQuestion()
        //let urlString = "file:///Users/deganhao/Desktop/quoted.json"//this is local json file which is manualluy quoted
        let urlString = "http://adapt2.sis.pitt.edu/aggregate/GetContentLevels?usr=adl01&grp=ADL&sid=generate_a_session_id&cid=23&mod=all&models=0"// this is the file from knowledge tree
        
        if let url = NSURL(string: urlString) {
            if let jsonData = try? NSData(contentsOfURL: url, options: []) {
                
                print(jsonData)
                do {
                    if let jsonResult = try NSJSONSerialization.JSONObjectWithData(jsonData, options: []) as? NSDictionary {
                        print(jsonResult)
                        //parseJSON(jsonResult)
                    }
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
                
                
                
                
            }
        }
    }//end if let url = NSURL(string: urlString)
    
    
    
    func parseJSON(json: JSON) {
        var labels = [String: UILabel]()
        var strings = [String]()
        var objects = [[String: String]]()
        for result in json["results"].arrayValue {
            let title = result["title"].stringValue
            let body = result["body"].stringValue
            let sigs = result["signatureCount"].stringValue
            let obj = ["title": title, "body": body, "sigs": sigs]
            objects.append(obj)
        }
        
        print(title)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    func displayQuestion() {
        question.text = "2+1"
        correctAnswer = "3"
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

