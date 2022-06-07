//
//  QuestionViewController.swift
//  ikid
//
//  Created by Victoria Shepard on 6/7/22.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var Question: UILabel!
    
    var _data : String? = nil
    var data : String? {
        get { return self._data }
        set(value) {
            self._data = value
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Question.text = data
    }
    

}
