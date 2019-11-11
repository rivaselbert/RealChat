//
//  LabelHelper.swift
//  RealChat
//
//  Created by Elbert Rivas on 11/11/2019.
//  Copyright © 2019 Elbert. All rights reserved.
//

import UIKit

extension UILabel {
    
    func setLineSpacing(lineSpacing: CGFloat = 0.0) {
        
        guard let labelText = self.text else { return }
        
        let attributed = NSMutableAttributedString(string: labelText)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        attributed.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributed.length))
        
        self.attributedText = attributed
    }
}
