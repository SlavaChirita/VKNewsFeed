//
//  UIViewController + StoryBoard.swift
//  VKNewsFeed
//
//  Created by Veaceslav Chirita on 11/12/19.
//  Copyright © 2019 Veaceslav Chirita. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    class func loadFromStoryBoard<T: UIViewController>() -> T {
        
        let name = String(describing: T.self)
        let storyBoard = UIStoryboard(name: name, bundle: nil)
        if let viewController = storyBoard.instantiateInitialViewController() as? T {
            return viewController
        } else {
            fatalError("SMTH went wrong")
        }
    }
    
}
