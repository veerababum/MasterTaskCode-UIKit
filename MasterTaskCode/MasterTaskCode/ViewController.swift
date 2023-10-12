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
    
    var schoolModel = SchoolViewModel()
    
    override func viewDidLoad() {
        schoolModel = SchoolViewModel()
        super.viewDidLoad()
        title = "NYC School"
        searchBar.placeholder = "Search"
        
        Task {
            await schoolModel.fetchSchools()
            schooltableView.reloadData()
        }
    }
}


extension ViewController: UITableViewDataSource {
    
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
        schooltableView.reloadData()
    }
    
}
