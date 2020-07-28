//
//  ViewController.swift
//  Weekday Finder
//
//  Created by Kirill Kostarev on 26.07.2020.
//  Copyright © 2020 Kostarev Kirill Pavlovich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dayLabel: UITextField!
    @IBOutlet weak var monthLabel: UITextField!
    @IBOutlet weak var yearLabel: UITextField!
    @IBOutlet weak var weekDayLabel: UILabel!
    @IBOutlet weak var findButtonLayout: UIButton! {
        didSet {
            findButtonLayout.layer.cornerRadius = 5
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    @IBAction func findDayButton(_ sender: UIButton) {
        if let dayLabel = Int(dayLabel.text!), let monthLabel = Int(monthLabel.text!), let yearLabel = Int(yearLabel.text!) {
            let dateLabel: String = "\(yearLabel)-\(monthLabel)-\(dayLabel)T00:00:00"
            weekDayLabel.text = getDay(dateLabel)
        } else {
            weekDayLabel.text = "Oops, you didn't fill the fields!"
        }
    }
    func getDay(_ timeLabel: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        guard let date = dateFormatter.date(from: timeLabel) else {
            return "Sorry but that's wrong date format"
        }
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: date)
    }
}
