//
//  MultyGameViewController.swift
//  Pong
//
//  Created by Tom Ben Ari on 03/01/2017.
//  Copyright © 2017 Tom Ben Ari. All rights reserved.
//

import UIKit

import UIKit
import SpriteKit
import GameplayKit

class MultyGameViewController: UIViewController {
    
    
    public var level : Int? = nil
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let level = self.level
        
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = GameScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                //scene.gameDelegate = self
                
                scene.level = level ?? 1
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

/*extension MulyGameViewController: GameSceneDelegate{
    func gameSceneGameDidEnd(_ scene: GameScene) {
        
        
        func handler(_ action: UIAlertAction){
            
            
            //TODO:  uplod to firebase
            _ = self.navigationController?.popToRootViewController(animated: true)
            
            
            
        }
        func configortionhandler(_ text : UITextField){
            text.placeholder = "wrie your name"
        }
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        let date = formatter.string(from: Date())
        let alert = UIAlertController(title: scene.mainS + " : " + scene.enemyS , message: date, preferredStyle: .alert)
        alert.addTextField(configurationHandler: configortionhandler)
        
        let action = UIAlertAction(title: "submit", style: .default, handler: handler)
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}*/
