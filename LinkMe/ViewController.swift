//
//  ViewController.swift
//  LinkMe
//
//  Created by Yannick LORIOT on 15/02/16.
//  Copyright © 2016 Swift Tuto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var titleLabel: UILabel!

  deinit {
    NSNotificationCenter.defaultCenter().removeObserver(self)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateTitle",
      name: NSUserDefaultsDidChangeNotification, object: nil)

    updateTitle()
  }

  @IBAction func openSettingsAction(sender: AnyObject) {
    if let settingsUrl = NSURL(string: UIApplicationOpenSettingsURLString) {
      UIApplication.sharedApplication().openURL(settingsUrl)
    }
  }

  private func updateTitle() {
    let userDefaults = NSUserDefaults.standardUserDefaults()

    titleLabel.text = userDefaults.stringForKey("fr.swift-tuto.settings.title")
  }
}

