//
//  SelectCarViewController.swift
//  SwiftCircuitRacer
//
//  Created by Shayne Meyer on 10/4/14.
//  Copyright (c) 2014 Maynesoft LLC. All rights reserved.
//

import UIKit

class SelectCarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        SKTAudio.sharedInstance().playBackgroundMusic("circuitracer.mp3")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func carButtonPressed(sender: UIButton) {
        SKTAudio.sharedInstance().playSoundEffect("button_press.wav")
        
        let levelViewController = self.storyboard!.instantiateViewControllerWithIdentifier("SelectLevelViewController") as SelectLevelViewController
        
        // likely in this view, you're choosing which car you want to use
        // would make sense as "selectCarViewController" lolz. 
        levelViewController.carType = CarType.fromRaw(sender.tag)!
        
        // pattern, when he wants to push new controller, he instantiates as a constant first
        // then, he uses navigation controller to push. 
        // i wonder what this looks like
        // and it's difficult to keep track of the ? and !s
        
        // i know it's obvious, but so far, each different screen of this game has
        // had it's own view controller. and the code has been tight and focused, and 
        // short. I'm trying to remember how we did it in class. 
        navigationController!.pushViewController(levelViewController, animated: true)
    }
    
    

}
