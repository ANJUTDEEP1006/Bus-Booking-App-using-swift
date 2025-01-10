import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet var table: UITableView!
    @IBOutlet var field: UITextField!
    
    var from = true  // Determine which text field (leaving from or going to) to update
    
    var data = [String]()  // Store all state names
    var filteredData = [String]()  // Store filtered results
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        field.delegate = self
        
        setupData()  // Load state names
        filteredData = data  // Initially, show all data

        setupUI()  // Additional UI setup
    }
    
    // MARK: - Setup Data
    private func setupData() {
        data = [
            "Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chhattisgarh",
            "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jharkhand",
            "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur",
            "Meghalaya", "Mizoram", "Nagaland", "Odisha", "Punjab",
            "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura",
            "Uttar Pradesh", "Uttarakhand", "West Bengal", "Delhi"
        ]
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        // Add a Done button to dismiss the keyboard
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissKeyboard))
        toolbar.setItems([doneButton], animated: false)
        field.inputAccessoryView = toolbar

        // Add a Back button to the navigation bar (optional)
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(dismissView))
        self.navigationItem.leftBarButtonItem = backButton
    }

    // MARK: - Dismiss Keyboard
    @objc private func dismissKeyboard() {
        view.endEditing(true)  // Dismiss the keyboard
    }

    // MARK: - Dismiss View
    @objc private func dismissView() {
        self.dismiss(animated: true, completion: nil)  // Dismiss the view controller
    }

    // MARK: - UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count  // Return the number of filtered items
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = filteredData[indexPath.row]  // Set the text to the filtered data
        return cell
    }
    
    // MARK: - UITableViewDelegate Method
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Update the corresponding location in HomeViewController
        let selectedLocation = filteredData[indexPath.row]
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        if from {
            appDelegate.fromLocation = selectedLocation
        } else {
            appDelegate.toLocation = selectedLocation
        }
        
        dismiss(animated: true, completion: nil)  // Dismiss the view controller
    }

    // MARK: - UITextFieldDelegate Method
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Get the current text after the user types
        let currentText = (textField.text ?? "") as NSString
        let updatedText = currentText.replacingCharacters(in: range, with: string)
        
        // Filter the data based on the user input
        filterData(searchText: updatedText)
        return true
    }

    // MARK: - Filter Data
    private func filterData(searchText: String) {
        if searchText.isEmpty {
            filteredData = data  // Show all data if the search text is empty
        } else {
            filteredData = data.filter { $0.lowercased().contains(searchText.lowercased()) }
        }
        table.reloadData()  // Refresh the table view with the filtered data
    }
}

