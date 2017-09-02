//
//  TextCell.swift
//  macaron
//
//  Created by Ryosuke Hayashi on 2017/08/27.
//  Copyright © 2017年 yagra. All rights reserved.
//

import UIKit

public class TextCell: MacaronCell, MacaronCellType {
    private var height: CGFloat = 50.0
    @IBOutlet weak var label: UILabel!
    
    public func getRowHeight() -> CGFloat {
        return height
    }

    public func assign(data: inout MacaronCellDataType) {
        if let data = data as? TextCellData {
            label.text = data.text
            label.textColor = data.textColor
            if let font = data.font {
                label.font = font
            }
            label.sizeToFit()
            contentView.backgroundColor = data.backgroundColor
            height = label.frame.height
        }
    }
}

public class TextCellData: MacaronCellData<TextCell> {
    public var text: String
    public var textColor: UIColor
    public var font: UIFont?
    public var backgroundColor: UIColor

    public init(text: String, textColor: UIColor=UIColor.black, font: UIFont?=nil,
                backgroundColor: UIColor=UIColor.white) {
        self.text = text
        self.textColor = textColor
        self.font = font
        self.backgroundColor = backgroundColor
        super.init()
    }
}
