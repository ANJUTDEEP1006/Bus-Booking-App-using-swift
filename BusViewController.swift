//
//  BusViewController.swift
//  Lava Bus
//
//  Created by Vismaya on 12/10/24.
//

import UIKit

class BusViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var busDetailsTblView: UITableView!
    let busNameArray = [
        "Wanderer Express",
        "The Rolling Oasis",
        "Adventure Cruiser",
        "City Hopper",
        "Dreamliner Bus",
        "The Road Runner",
        "Horizon Shuttle",
        "Skyline Voyager",
        "Journey Jamboree",
        "Nature Trekker",
        "Urban Explorer",
        "Freedom Flyer",
        "The Scenic Route",
        "Comfort Coach",
        "Route Rambler",
        "Vista View",
        "The Nomad",
        "Eco Traveler",
        "The Highway Hero",
        "Starlight Shuttle"
    ];
    var randomArray = [String()];

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let randomInt = Int.random(in: 0..<20)
        randomArray = busNameArray[randomPick: randomInt]  // [8, 9, 0]
        return randomArray.count  // Return the number of filtered items
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusDetails", for: indexPath) as! busDetailsTableViewCell
        cell.busName.text = randomArray[indexPath.row]
        cell.busFair.text = String(Int.random(in: 1000..<2000))
        return cell
    }
    
    // MARK: - UITableViewDelegate Method
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Update the corresponding location in HomeViewController
       
    }

}

extension Array {
    /// Picks `n` random elements (partial Fisher-Yates shuffle approach)
    subscript (randomPick n: Int) -> [Element] {
        var copy = self
        for i in stride(from: count - 1, to: count - n - 1, by: -1) {
            copy.swapAt(i, Int(arc4random_uniform(UInt32(i + 1))))
        }
        return Array(copy.suffix(n))
    }
}
