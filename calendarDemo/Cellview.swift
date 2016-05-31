//
//  cellview.swift
//  calendarDemo
//
//  Created by iBodyRecog on 31/05/16.
//  Copyright © 2016 antonijapek. All rights reserved.
//

import Foundation
import JTAppleCalendar

class CellView: JTAppleDayCellView {
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet weak var selectedView: UIView!
    
    var blackColor = UIColor.blackColor()
    var greyColor = UIColor.grayColor()
    var whiteColor = UIColor.whiteColor()
    
    
    func setupCellBeforeDisplay(cellState: CellState, date: NSDate) {
        // Setup Cell text
        dateLabel.text =  cellState.text
        
        // Setup text color
        configureTextColor(cellState)
    }
    
    func configureTextColor(cellState: CellState) {
        if cellState.dateBelongsTo == .ThisMonth {
            dateLabel.textColor = blackColor
        } else {
            dateLabel.textColor = greyColor
        }
    }
    
    func cellSelectionChanged(cellState: CellState) {
        if cellState.isSelected {
            selectedView.hidden = false
            dateLabel.textColor = whiteColor
        } else {
            selectedView.hidden = true
            dateLabel.textColor = blackColor
        }
    }
}