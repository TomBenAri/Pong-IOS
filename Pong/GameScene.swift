//
//  GameScene.swift
//  Pong
//
//  Created by Tom Ben Ari on 06/12/2016.
//  Copyright © 2016 Tom Ben Ari. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

protocol GameSceneDelegate {
    func gameSceneGameDidEnd(_ scene : GameScene)
}

class GameScene: SKScene {
    
    var gameDelegate: GameSceneDelegate?
    
    var level : Int?
    
    var diffecol : [Float] = [0.6, 0.3 , 0.2]

    var ball = SKSpriteNode()
    
    var enemy = SKSpriteNode()
    var main = SKSpriteNode()
    
    var topLbl = SKLabelNode()
    var btmLbl = SKLabelNode()
    var timeLbl = SKLabelNode()
    var enemyTimeLbl = SKLabelNode()
    var winLoseLbl = SKLabelNode()
    
    var count : Int = 30
    
    var timer : Timer?
    
    var mainS : String = ""
    var enemyS : String = ""
    
    
    var score = [Int]()
    
    override func didMove(to view: SKView) {
        
        //let labelNode = SKLabelNode(text: level.description)
        //labelNode.position = CGPoint(x: 30, y: 30)
       // addChild(labelNode)
        ball.position = CGPoint(x: 0, y: 0)
        
        startGame() 
        
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        enemy = self.childNode(withName: "enemy") as! SKSpriteNode
        main = self.childNode(withName: "main") as! SKSpriteNode
        
        timeLbl = self.childNode(withName: "Time") as! SKLabelNode
        enemyTimeLbl = self.childNode(withName: "enemyTime") as! SKLabelNode
        
        
        timeLbl.text = "00:30"
        enemyTimeLbl.text = "00:30"
        
        if level != nil {
            enemyTimeLbl.isHidden = true
        }
        topLbl = self.childNode(withName: "top_label") as! SKLabelNode
        btmLbl = self.childNode(withName: "buttom_label") as! SKLabelNode
        winLoseLbl = self.childNode(withName: "winLose") as! SKLabelNode
        
         ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
        
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
        
    }
    
    deinit {
        timer?.invalidate()
        timer = nil
    }
    
    
    func countDown() {
        
        if(count >= 0){
        //    let minutes = String(count / 60)
            let seconds = String(count % 60)
            timeLbl.text = "00:" + seconds
            enemyTimeLbl.text = "00:" + seconds
            count = count - 1
        }else {
            endGame()
        }
        
    }
    
    func startGame(){
        // main score[0] enemy score[1]
        // main buttom enemy top
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(GameScene.countDown) , userInfo: nil, repeats: true)
        
       
        score = [0,0]
        btmLbl.text = score[0].description
        topLbl.text = score[1].description
        //timer?.fire()
    }
   
    
    func endGame(){
        
        timer?.invalidate()
        timer = nil
        if level != nil {
        if score[0] > score[1] {
            winLoseLbl.text = "You Win"
        }
        if score[0] < score[1] {
            winLoseLbl.text = "You Loose"
        }
        if score[0] == score[1] {
            winLoseLbl.text = "Tie" 
        }
        
        winLoseLbl.isHidden = false
        }
        enemyTimeLbl.isHidden = true
        ball.position = CGPoint(x: 0, y: 0)
        ball.isHidden = true
        topLbl.isHidden = true
        btmLbl.isHidden = true
        enemy.isHidden = true
        main.isHidden = true
        
        timeLbl.position = CGPoint(x: 0, y: +500)
        
        timeLbl.text = "Game Over"
        mainS = score[0].description
        enemyS = score[1].description
        
        print("main" + mainS.description)
        print("enemy" + enemyS.description)
        
        
        gameDelegate?.gameSceneGameDidEnd(self)
        
        
        
        
    }
    
    func addScore(playerWhoWon : SKSpriteNode) {
        
        ball.position = CGPoint(x: 0, y: 0)
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        if playerWhoWon == main {
            score[0] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
        }
        else if playerWhoWon == enemy{
            score[1] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: -20, dy: -20))
        }
        
        btmLbl.text = score[0].description
        topLbl.text = score[1].description
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if location.y < 0{
            main.run(SKAction.moveTo(x: location.x, duration: 0.2))
            }
            
            
            if  level == nil &&  location.y > 0{
                enemy.run(SKAction.moveTo(x: location.x, duration: 0.2))
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
          
            if location.y < 0{
            main.run(SKAction.moveTo(x: location.x, duration: 0.2))
            }
            
            if  level == nil &&  location.y > 0{
                enemy.run(SKAction.moveTo(x: location.x, duration: 0.2))
            }
        }
    }
    
 
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        if level != nil{
        enemy.run(SKAction.moveTo(x: ball.position.x , duration: TimeInterval(diffecol[level!])))
        }
    if(count >= 0){
        if (ball.position.y <= main.position.y - 70) {
         
            addScore(playerWhoWon: enemy)
        }
         if (ball.position.y >= enemy.position.y + 70) {
         
            addScore(playerWhoWon: main)
        }
      }
    }
    
}
