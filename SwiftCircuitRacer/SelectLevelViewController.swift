//
//  SelectLevelViewController.swift
//  SwiftCircuitRacer
//
//  Created by Shayne Meyer on 10/4/14.
//  Copyright (c) 2014 Maynesoft LLC. All rights reserved.
//

import UIKit

class SelectLevelViewController: UIViewController {

    var carType: CarType!
    override func viewDidLoad() {
        super.viewDidLoad()

        // like doesn't need to load anything because he's added button
        // to the story board, or several buttons. 
        // i think, car viewcontroller button has 4 color choices. 
        // level choices equal easy, medium, or hard. 
        // once you've made those choices, 
        // the game starts
        
        // i like font game style more.
        // set difficulty in settings. more rapid game play. 
        
        // i'll likely jump right from "home screen controller" or equivalent
        // to game view controller or equivalent
        // and will have to load whatever variables need loading into game. 
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: IBAction Methods
    @IBAction func backButtonPressed(sender: UIButton) {
        navigationController!.popViewControllerAnimated(true)
        SKTAudio.sharedInstance().playSoundEffect("button_press.wav")
    }
    
    @IBAction func levelButtonPressed(sender: UIButton) {
        SKTAudio.sharedInstance().playSoundEffect("button_press.wav")
        
        let levelType = LevelType.fromRaw(sender.tag)
        
        let gameViewController = self.storyboard!.instantiateViewControllerWithIdentifier("GameViewController") as GameViewController
        
        gameViewController.carType = carType
        gameViewController.levelType = levelType
        
        navigationController!.pushViewController(gameViewController, animated: true)
    }

}
