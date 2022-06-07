//
//  ViewController.swift
//  ikid
//
//  Created by iguest on 5/19/22.
//

import UIKit

class ViewController: UIViewController {
    var QuestionViewController: QuestionViewController! = nil
    var AnswerViewController: AnswerViewController! = nil
    var jokes = ["Why did the football coach go to the bank?", "I can't tell if this fish is lying", "Why do we tell actors to break a leg"]
    var answer = ["To get his quarter back.", "she's being so koi.", "Because every play has a cast."]
    var jokeType = ["dad", "pun", "good"]
    var currJoke = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        if (jokeType[currJoke] != self.restorationIdentifier!) {
            if (self.restorationIdentifier == "dad") {
                currJoke = 0
            } else if (self.restorationIdentifier == "pun") {
                currJoke = 1
            } else if (self.restorationIdentifier == "good") {
                currJoke = 2
            } else {
                currJoke = 0
            }
        }
        if (QuestionViewController == nil) {
            QuestionBuilder(currJoke)
        }
        
        if(AnswerViewController == nil) {
            AnswerBuilder(currJoke)
        }
    }
    
    @IBAction func switchViews(_ sender: Any) {
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if QuestionViewController != nil &&
            QuestionViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            AnswerViewController!.view.frame = self.view.frame
            switchViewController(QuestionViewController, to: AnswerViewController)
        }
        else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            QuestionViewController.view.frame = view.frame
            switchViewController(AnswerViewController, to: QuestionViewController)
        }
        UIView.commitAnimations()
    }
    
    fileprivate func switchViewController(_ from: UIViewController?, to: UIViewController?) {
        if (jokeType[currJoke] != self.restorationIdentifier!) {
            if (self.restorationIdentifier == "dad") {
                currJoke = 0
            } else if (self.restorationIdentifier == "pun") {
                currJoke = 1
            } else if (self.restorationIdentifier == "good") {
                currJoke = 2
            } else {
                currJoke = 0
            }
        }
        if (QuestionViewController == nil) {
            QuestionBuilder(currJoke)
        }
        
        if(AnswerViewController == nil) {
            AnswerBuilder(currJoke)
        }
        if from != nil {
            from!.willMove(toParent: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParent()
        }
        
        if to != nil {
            self.addChild(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParent: self)
        }
    }

    fileprivate func QuestionBuilder(_ index: Int) {
        if QuestionViewController == nil {
            QuestionViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "Question")
                as! QuestionViewController
            QuestionViewController!.data = jokes[index]
        }
    }
    
    fileprivate func AnswerBuilder(_ index: Int) {
        if AnswerViewController == nil {
            AnswerViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "Answer")
                as! AnswerViewController
            AnswerViewController!.data = answer[index]
        }
    }
    
    
    


}

