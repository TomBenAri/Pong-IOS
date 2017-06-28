//
//  GameViewController.swift
//  Pong
//
//  Created by Tom Ben Ari on 06/12/2016.
//  Copyright © 2016 Tom Ben Ari. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    

   public var level : Int? = nil
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       let level = self.level
        
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = GameScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                scene.gameDelegate = self
                
                scene.level = level ?? nil
                
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

extension GameViewController: GameSceneDelegate{
    func gameSceneGameDidEnd(_ scene: GameScene) {
        
      
        
  
        
     

        func configortionhandler(nam text : UITextField){
            text.placeholder = "wrie your name"
        }
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        let date = formatter.string(from: Date())
          let winBy = scene.score[0] - scene.score[1]
        let alert = UIAlertController(title: "downe - " + scene.mainS + " : " + scene.enemyS + " - up"  , message: date, preferredStyle: .alert)
        
        func handler(_ action: UIAlertAction){
            
           guard let textFields = alert.textFields,
            let name = textFields[0].text
            else{
                return
            }
            
           
            
            if name.isEmpty || name == " "{
                // להיפטר מרווחים
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            DBManager.manager.creatNewReacord(name: name, date: date, winBy: winBy)
            
            
            //TODO:  uplod to firebase
            _ = self.navigationController?.popToRootViewController(animated: true)
        }
        

        if level != nil && scene.score[0] > scene.score[1]{
            alert.addTextField(configurationHandler: configortionhandler)
        let action = UIAlertAction(title: "submit", style: .default, handler: handler)
            alert.addAction(action)
        }
        
        let back = UIAlertAction(title: "back to main", style: .cancel) { (UIAlertAction) in
             _ = self.navigationController?.popToRootViewController(animated: true)
        }
        
        alert.addAction(back)
        
        let rematch = UIAlertAction(title: "rematch", style: .default) { (UIAlertAction) in
            self.viewDidLoad()
        }
        alert.addAction(rematch)
        self.present(alert, animated: true, completion: nil)
    }
}
