//
//  AnswerViewController.swift
//  ikid
//
//  Created by Victoria Shepard on 6/7/22.
//

import UIKit

class AnswerViewController: UIViewController {

    @IBOutlet weak var Answer: UILabel!
    
    var _data : String? = nil
    var data : String? {
        get { return self._data }
        set(value) {
            self._data = value
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Answer.text = data
    }
    


}
