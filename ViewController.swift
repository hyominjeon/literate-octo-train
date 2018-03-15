//
//  ViewController.swift
//  first
//
//  Created by Hyomin Jeon on 03/07/18.
//  Copyright © 2018 Hyomin Jeon. All rights reserved.
//

import UIKit
import YelpAPI
import Darwin

class ViewController: UIViewController {
    
    let apiKey:String = "myApiKey"
    var label: UILabel = UILabel(frame: CGRect.init(x: 10, y: 100, width: 300, height: 20))
    var button: UIButton = UIButton(frame: CGRect.init(x: 10, y: 140, width: 70, height: 20))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let client:YLPClient = YLPClient.init(apiKey: apiKey)
        client.search(withLocation: "San Francisco, CA", completionHandler: {(search, error) -> Void in
            DispatchQueue.main.async {
                let randomIndex: Int = Int(arc4random_uniform(UInt32.init(Double((search?.businesses.count)!))))
                self.label.text = search?.businesses[randomIndex].name
            }
        })
        button.setTitle("Button", for: UIControlState.normal)
        button.setTitleColor(UIColor.blue, for: UIControlState.normal)
        view.addSubview(label)
        view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

