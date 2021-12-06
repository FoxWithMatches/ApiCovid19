//
//  ListCountryViewController.swift
//  ApiCovid19
//
//  Created by Alisa Ts on 06.12.2021.
//

import UIKit

class ListCountryViewController: UITableViewController {

    private var covid: Covid!
    private var filteredRawData: [RawData] = []
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(from: Link.covid.rawValue)
        tableView.rowHeight = 60
        
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        navigationItem.title = "Data on cases of Covid19"
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        covid?.rawData.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CovidViewCell
        let covid = covid.rawData[indexPath.row]
       
        cell.configure(with: covid)
        
        return cell
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchRawData(from: url) { covid in
            self.covid = covid
            self.tableView.reloadData()
            self.activityIndicator.stopAnimating()
           
        }
    }
}


