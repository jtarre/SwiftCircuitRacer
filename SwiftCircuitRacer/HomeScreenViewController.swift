//
//  HomeScreenViewController.swift
//  SwiftCircuitRacer
//
//  Created by Shayne Meyer on 10/11/14.
//  Copyright (c) 2014 Maynesoft LLC. All rights reserved.
//

import UIKit
import GameKit

class HomeScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBAction Methods
    @IBAction func playGame(sender: UIButton) {
        SKTAudio.sharedInstance().playSoundEffect("button_press.wav")
        
        if let storyboard = storyboard {
            let carViewController = storyboard.instantiateViewControllerWithIdentifier("SelectCarViewController") as SelectCarViewController
            
            navigationController?.pushViewController(carViewController, animated: true)
        }
    }
    
    @IBAction func gameCenter(sender: UIButton) {
        SKTAudio.sharedInstance().playSoundEffect("button_press.wav")
        GameKitHelper.sharedInstance.showGKGameCenterViewController(self)
    }
    
    @IBAction func playMultiplayerGame(sender: UIButton) {
        if !GKLocalPlayer.localPlayer().authenticated {
            return
        }
        SKTAudio.sharedInstance().playSoundEffect("button_press.wav")
        
        // storyboard = main storyboard in app? 
        // if it exists, set to constant, then instantiate the GameViewController as type GameViewController
        // without the "as", what would the code think was the type? 
        if let storyboard = storyboard {
            let gameViewController = storyboard.instantiateViewControllerWithIdentifier("GameViewController") as GameViewController
            
            // sets number of cars, I imagine it means the number competing
            gameViewController.noOfCars = 2
            
            // navigationControlle could be nil. if it's not, pushViewController
            // what happens when you want to go back to home screen? 
            // how do we know the gameViewController was not already on the stack? 
            navigationController?.pushViewController(gameViewController, animated: false)
        }
    }
}
