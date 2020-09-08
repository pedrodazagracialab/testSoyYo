//
//  DatePickerPopOverViewController.swift
//  TestSoyYo
//
//  Created by Pedro Alonso Daza B on 8/09/20.
//  Copyright © 2020 Pedro Alonso Daza B. All rights reserved.
//

import UIKit

func showDatePickerFromPictore(controller: UIViewController, ok: @escaping ((Date) -> Void)) {
    let storyBoard = UIStoryboard(name: "DatePickerPopOver", bundle: nil)
    let datePickerPopOverViewController = storyBoard.instantiateViewController(withIdentifier: "DatePickerPopOverViewController") as! DatePickerPopOverViewController
    datePickerPopOverViewController.modalPresentationStyle = .popover
    datePickerPopOverViewController.ok = ok
    controller.present(datePickerPopOverViewController, animated: true, completion: nil)
}
class DatePickerPopOverViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    var ok: ((Date) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.maximumDate = Date()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func okPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: {
            self.ok?(self.datePicker.date)
        })
    }
    
    @IBAction func closePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
