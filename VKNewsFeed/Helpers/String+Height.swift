//
//  String+Height.swift
//  VKNewsFeed
//
//  Created by Veaceslav Chirita on 11/30/19.
//  Copyright © 2019 Veaceslav Chirita. All rights reserved.
//

import UIKit

extension String {
    
    func height(width: CGFloat, font: UIFont) -> CGFloat {
        let textSize = CGSize(width: width, height: .greatestFiniteMagnitude)
        
        let size = self.boundingRect(with: textSize,
                                     options: .usesLineFragmentOrigin,
                                     attributes: [NSAttributedString.Key.font : font],
                                     context: nil)
        return size.height
    }
    
}
