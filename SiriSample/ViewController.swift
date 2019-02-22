//
//  ViewController.swift
//  SiriSample
//
//  Created by coco j on 2019/02/22.
//  Copyright © 2019 amaocha. All rights reserved.
//

import UIKit
import Intents

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let intent = DoSomethingIntent()
        intent.taskName = "イライラ"
        intent.suggestedInvocationPhrase = "うれしい"
        let interaction = INInteraction(intent: intent, response: nil)
        interaction.donate { error in
            // エラーハンドリング
            print("\(error)")
        }
        
    }
}

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any? {
        switch intent {
        case is DoSomethingIntent:
            return DoSomethingIntentHandler()
        default:
            return nil
            
        }
    }
}

