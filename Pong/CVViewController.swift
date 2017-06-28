//
//  CVViewController.swift
//  Pong
//
//  Created by Tom Ben Ari on 30/01/2017.
//  Copyright © 2017 Tom Ben Ari. All rights reserved.
//

import UIKit

class CVViewController: UIViewController {

    
    @IBAction func backAction(_ sender: Any) {
           _ = self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
