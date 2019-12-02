//
//  NewsfeedCellLayoutCalculator.swift
//  VKNewsFeed
//
//  Created by Алексей Пархоменко on 27/03/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import Foundation
import UIKit

struct Sizes: FeedCellSizes {
    var postLabelFrame: CGRect
    var attachmentFrame: CGRect
    var bottomViewFrame: CGRect
    var totalHeight: CGFloat
}

struct Constants {
    static let cardInsets = UIEdgeInsets(top: 0, left: 8, bottom: 12, right: 8)
    static let topViewHeight: CGFloat = 36
    static let postLabelInsets = UIEdgeInsets(top: 8 + Constants.topViewHeight + 8, left: 8, bottom: 8, right: 8)
    static let postLabelFont = UIFont.systemFont(ofSize: 15)
}

protocol FeedCellLayoutCalculatorProtocol {
    func sizes(postText: String?, photoAttachment: FeedCellPhotoAttachementViewModel?) -> FeedCellSizes
}

final class FeedCellLayoutCalculator: FeedCellLayoutCalculatorProtocol {
    
    private let screenWidth: CGFloat
    
    init(screenWidth: CGFloat = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)) {
        self.screenWidth = screenWidth
    }

    func sizes(postText: String?, photoAttachment: FeedCellPhotoAttachementViewModel?) -> FeedCellSizes {
        
        let cardViewWidth = screenWidth - Constants.cardInsets.left - Constants.cardInsets.right
        
    
        // MARK: Работа с postLabelFrame
        
        var postLabelFrame = CGRect(origin: CGPoint(x: Constants.postLabelInsets.left, y: Constants.postLabelInsets.top),
                                    size: CGSize.zero)
        
        if let text = postText, !text.isEmpty {
            let width = cardViewWidth - Constants.postLabelInsets.left - Constants.postLabelInsets.right
            let height = text.height(width: width, font: Constants.postLabelFont)
            
            postLabelFrame.size = CGSize(width: width, height: height)
        }
        
        // MARK: Работа с attachmentFrame
        
        
        var attachmentFrame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize.zero)
        
        
        return Sizes(postLabelFrame: postLabelFrame,
                     attachmentFrame: CGRect.zero,
                     bottomViewFrame: CGRect.zero,
                     totalHeight: 300)
    }
    

}
