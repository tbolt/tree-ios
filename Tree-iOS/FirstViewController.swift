//
//  FirstViewController.swift
//  Tree-iOS
//
//  Created by Ty Bolchoz on 12/6/19.
//  Copyright © 2019 Ty Bolchoz. All rights reserved.
//

import UIKit
import Alamofire

class FirstViewController: UIViewController {

  @IBOutlet weak var textBlock: UITextView?
  @IBOutlet weak var toggleText: UIButton?
  
  var myText = "bahhhhhh this is my text."
  var myAltText = "this is some other text now...."
  
  func updateTextBlock(count:Int) {
    print("made it to updateTextBlock")
    let newString = String(count)
    textBlock?.text = newString
  }
  
  @IBAction func updateTextButtonPressed(_ sender: Any) {
    print("button triggered....")
//    textBlock?.text = myAltText
    
    AF.request("https://swapi.co/api/films/").responseJSON { response in
      
      switch response.result {
      case .success(let value as [String: Any]):
          print("value of count: \(value["count"] ?? 0)")
          self.updateTextBlock(count: value["count"] as! Int)
//          for (key, val) in value {
//              print("The value to '\(key)' is '\(val)'.")
//          }
      case .failure(let error):
          print("failure: \(error)")
      default:
          fatalError("received non-dictionary JSON response")
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
}
