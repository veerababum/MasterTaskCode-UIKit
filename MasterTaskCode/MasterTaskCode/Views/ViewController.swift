//
//  ViewController.swift
//  MasterTaskCode
//
//  Created by Veerababu Mulugu on 9/28/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var schooltableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    private var loadingIndicator: UIActivityIndicatorView?

    var schoolModel = SchoolViewModel()
    
    override func viewDidLoad() {
        schoolModel = SchoolViewModel()
        super.viewDidLoad()
        title = "NYC School"
        configureSearchBar()
        fetchAndReloadData()
        
    }
    // Configure the search bar
    private func configureSearchBar() {
        // searchBar.delegate = self
        searchBar.placeholder = "Search"
    }
    
    // Fetch and reload data asynchronously
    fileprivate func loaderView() {
        // Create and start the loading indicator
        loadingIndicator = UIActivityIndicatorView(style: .large)
        loadingIndicator?.center = view.center
        loadingIndicator?.startAnimating()
        view.addSubview(loadingIndicator!)
    }
    
    private func fetchAndReloadData() {
        loaderView()
        Task {
            await schoolModel.fetchSchools()
            // Remove the loading indicator when the response is received
            self.loadingIndicator?.stopAnimating()
            self.loadingIndicator?.removeFromSuperview()
            updateTableView()
        }
    }
    // Update the table view data
    private func updateTableView() {
        DispatchQueue.main.async {
            self.schooltableView.reloadData()
        }
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? schoolModel.filteredSchools.count : schoolModel.schools.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        let school = isSearching ? schoolModel.filteredSchools[indexPath.row] : schoolModel.schools[indexPath.row]
        
        cell.textLabel?.text = school.schoolName
        cell.detailTextLabel?.text = school.dbn
        let image = UIImage(systemName: "photo")
        cell.imageView?.image = image
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        `
`        // Instantiate the DetailsViewController using the identifier
        if let detailsViewController = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController {
            detailsViewController.selectedDbn = schoolModel.schools[indexPath.row].dbn
            navigationController?.pushViewController(detailsViewController, animated: true)
        }
        
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterSchools(for: searchText)
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        filterSchools(for: "")
        
    }
    
    var isSearching: Bool {
        return searchBar.text != ""
    }
    
    func filterSchools(for searchText: String) {
        if searchText.isEmpty {
            schoolModel.filteredSchools = schoolModel.schools
        } else {
            schoolModel.filteredSchools = schoolModel.schools.filter {
                $0.schoolName.lowercased().contains(searchText.lowercased()) || $0.dbn.lowercased().contains(searchText.lowercased())
            }
        }
        updateTableView()
    }
    
}
