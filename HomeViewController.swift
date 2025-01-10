
//  HomeViewController.swift
//  Lava Bus
//
//  Created by Vismaya on 13/09/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var leavingFromTxtFld: UITextField!
    @IBOutlet weak var goingToTxtFld: UITextField!
    @IBOutlet weak var departDateTxtFld: UITextField!
    
    @IBOutlet weak var searchBtn: UIButton!
    var from = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leavingTapGesture = UITapGestureRecognizer(target: self, action: #selector(leavingFromTapped))
        leavingFromTxtFld.addGestureRecognizer(leavingTapGesture)
        
        let goingTapGesture = UITapGestureRecognizer(target: self, action: #selector(goingToTapped))
        goingToTxtFld.addGestureRecognizer(goingTapGesture)
        
        let dateTapGesture = UITapGestureRecognizer(target: self, action: #selector(departDateTapped)) // Tap gesture for the date field
        departDateTxtFld.addGestureRecognizer(dateTapGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        leavingFromTxtFld.text = appDelegate.fromLocation
        goingToTxtFld.text = appDelegate.toLocation
        departDateTxtFld.text = appDelegate.departDate
        
    }
    
    @objc func leavingFromTapped() {
        from = true
        navigateToSearchPage()
    }
    
    @objc func goingToTapped() {
        from = false
        navigateToSearchPage()
    }
    
    @objc func departDateTapped() {
        showDatePicker()
    }
    
    func navigateToSearchPage() {
        if let searchViewController = storyboard?.instantiateViewController(withIdentifier: "SearchViewControllerID") as? SearchViewController {
            searchViewController.modalPresentationStyle = .fullScreen // Present in full screen
            searchViewController.from = from
            self.present(searchViewController, animated: true, completion: nil)
        }
    }
    
    func showDatePicker() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        
        
        let alert = UIAlertController(title: "Select Departure Date", message: "\n\n\n\n\n\n\n\n\n", preferredStyle: .actionSheet)
        
        alert.view.addSubview(datePicker)
        
        
        let doneAction = UIAlertAction(title: "Done", style: .default) { _ in
            self.departDateTxtFld.text = self.formatDate(date: datePicker.date)
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(doneAction)
        
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            datePicker.leadingAnchor.constraint(equalTo: alert.view.leadingAnchor, constant: 8),
            datePicker.trailingAnchor.constraint(equalTo: alert.view.trailingAnchor, constant: -8),
            datePicker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 50),
            datePicker.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        
        if let popoverController = alert.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @objc func datePickerValueChanged(_ datePicker: UIDatePicker) {
        departDateTxtFld.text = formatDate(date: datePicker.date)
    }
    
    func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date)
    }
    @IBAction func searchBtnClicked(_ sender: Any) {
        navigateToBusPage()
    }
    func navigateToBusPage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let nextVC = storyboard.instantiateViewController(withIdentifier: "BusViewControllerID") as? BusViewController {
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}
