//
//  MenuViewController.swift
//  Pong
//
//  Created by Tom Ben Ari on 14/12/2016.
//  Copyright © 2016 Tom Ben Ari. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    
    
    enum gameType {
        case singelPlayer
        case multiPlayer
    }
    
    
    @IBOutlet weak var mainPaddelBtn: UIButton!
    @IBOutlet weak var enemyPaddelBtn: UIButton!
    @IBOutlet weak var singelBtn: UIButton!
    @IBOutlet weak var enemyLabel: UILabel!
    @IBOutlet weak var mainLable: UILabel!
    @IBOutlet weak var levelSegmented: UISegmentedControl!
    @IBOutlet weak var multiplayerBtn: UIButton!
   
    
    
    func startGame(type : gameType , level : Int?)  {
        resetMain()
        
        if level != nil {
            guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "GameViewController") as? GameViewController
                ,let level = level
                
                else {
                    return
            }
            
            nextVC.level = level
            navigationController?.show(nextVC, sender: self )
        }else{
            guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "GameViewController") as? GameViewController
                
                
                else {
                    return
            }
            
            nextVC.level = nil
            navigationController?.show(nextVC, sender: self )
        }
        
    
    }
    
    
    @IBAction func singelBtnAction(_ sender: UIButton) {
        resetMain()
        enemyLabel.text = "Ready"
        enemyLabel.isHidden = false
        levelSegmented.isHidden = false
        mainLable.isHidden = false
        mainPaddelBtn.isEnabled = true
        singelBtn.isSelected = true
    
        
    }
    
    
  
    
    @IBAction func multiplayerBtnAction(_ sender: UIButton) {
         resetMain()
        
        //TODO: rotat 180 enemylabel
        enemyLabel.isHidden = false
        mainLable.isHidden = false
        mainPaddelBtn.isEnabled = true
        multiplayerBtn.isSelected = true
        enemyPaddelBtn.isEnabled = true
    }
   
    
    
    @IBAction func levelAction(_ sender: UISegmentedControl) {
        
        let enemyLevel = sender.selectedSegmentIndex
        print(enemyLevel)
        
    }
    
    @IBAction func enemyPaddelAction(_ sender: UIButton) {
        enemyPaddelBtn.isSelected = true
        enemyLabel.text = "ready"
        chackIfMultyIsReady()
    }
    
    @IBAction func mainPaddelAction(_ sender: UIButton) {
        
        
        
       
        if singelBtn.isSelected == true {
             mainLable.text = "Ready"
            let type = gameType.singelPlayer
            let level = levelSegmented.selectedSegmentIndex
            startGame(type: type, level: level)
        }else if multiplayerBtn.isSelected{
            mainPaddelBtn.isSelected = true
            mainLable.text = "Ready"
            chackIfMultyIsReady()
           
        }
    }
    
    func chackIfMultyIsReady() {
        if mainPaddelBtn.isSelected && enemyPaddelBtn.isSelected {
            let type = gameType.multiPlayer
            startGame(type: type , level: nil)
        }
        
        
    }

    func resetMain() {
        
        enemyLabel.isHidden = true
        mainLable.isHidden = true
        mainLable.text = "Tap Paddel when ready"
        enemyLabel.text = "Tap Paddel when ready"
        levelSegmented.isHidden = true
        mainPaddelBtn.isEnabled = false
        enemyPaddelBtn.isEnabled = false
        mainPaddelBtn.isSelected = false
        enemyPaddelBtn.isSelected = false
        singelBtn.isSelected = false
        multiplayerBtn.isSelected = false
        _ = DBManager.manager
    }
    
    
    @IBAction func wallOfFameAction(_ sender: Any) {
        
        
        
             guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "WallViewControler") as? WallTableViewController
                else{
                    return
        }
         navigationController?.show(nextVC, sender: self )
        
    }
    

    
    @IBAction func tomAction(_ sender: UIButton) {
        
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "CVViewController") as? CVViewController
            else{
                return
        }
        navigationController?.show(nextVC, sender: self )
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       resetMain()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
