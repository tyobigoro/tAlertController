//
//  ViewController.swift
//  tAlertController
//
//  Created by tyobigoro on 2020/04/13.
//  Copyright © 2020 tyobigoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var alert: UIAlertController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnDidTap(_ sender: Any) {
        
        let alert = UIAlertController(title: "title", message: "message", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: { (tf) in
            tf.delegate = self
        })
        
        alert.addTextField(configurationHandler: { (tf) in
            tf.delegate = self
        })
        
        let okAction = UIAlertAction(title: "OK" ,style: .default, handler: nil)
        okAction.isEnabled = false
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        self.alert = alert
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            let existsFirstText: Bool = !(self.alert?.textFields?.first?.text?.isEmpty ?? true)
            let existsSecondText: Bool = !(self.alert?.textFields?.last?.text?.isEmpty ?? true)
            
            self.alert?.actions.first?.isEnabled = existsFirstText && existsSecondText ? true : false
        }
        
        return true
    }

}

