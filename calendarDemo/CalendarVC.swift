//
//  ViewController.swift
//  calendarDemo
//
//  Created by iBodyRecog on 31/05/16.
//  Copyright © 2016 antonijapek. All rights reserved.
//

import UIKit
import JTAppleCalendar
import SwiftDate
import RealmSwift

class CalendarVC: UIViewController {
    
    let userData = UserData()
    let today = NSDate.today()
    
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var monthNameLabel: UILabel!
    @IBOutlet weak var calendarView: JTAppleCalendarView!

    override func viewDidLoad() {
        super.viewDidLoad()
        calendarView.registerCellViewXib(fileName: "CellView")
        calendarView.dataSource = self
        calendarView.delegate = self
        calendarView.cellInset = CGPoint(x: 0, y: 0)
        calendarView.firstDayOfWeek = .Monday
        calendarView.allowsMultipleSelection = true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        calendarView.scrollToDate(today)
    }
}

extension CalendarVC: JTAppleCalendarViewDataSource, JTAppleCalendarViewDelegate  {
    
    // Setting up manditory protocol method
    func configureCalendar(calendar: JTAppleCalendarView) -> (startDate: NSDate, endDate: NSDate, calendar: NSCalendar) {
        // You can set your date using NSDate() or NSDateFormatter. Your choice.
        let firstDate = "1/1/2016".toDate(DateFormat.Custom("dd/MM/YY"))
        let secondDate = NSDate()
        let aCalendar = NSCalendar.currentCalendar() // Properly configure your calendar to your time zone here
        return (startDate: firstDate!, endDate: secondDate, calendar: aCalendar)
    }
    
    func calendar(calendar: JTAppleCalendarView, isAboutToDisplayCell cell: JTAppleDayCellView, date: NSDate, cellState: CellState) {
        let cell = (cell as! CellView)
        cell.setupCellBeforeDisplay(cellState, date: date)
    }
    
    func calendar(calendar: JTAppleCalendarView, didSelectDate date: NSDate, cell: JTAppleDayCellView?, cellState: CellState) {
        let cell = (cell as! CellView)
        cell.cellSelectionChanged(cellState)
    }
    
    func calendar(calendar: JTAppleCalendarView, didDeselectDate date: NSDate, cell: JTAppleDayCellView?, cellState: CellState) {
        let cell = (cell as! CellView)
        cell.cellSelectionChanged(cellState)
    }
    
    func calendar(calendar: JTAppleCalendarView, didScrollToDateSegmentStartingWithdate startDate: NSDate, endingWithDate endDate: NSDate) {
        let monthName = startDate.monthName
        let year = startDate.year
        monthNameLabel.text = monthName
        yearLabel.text = "\(year)"
    }
}
