//
//  ViewController.swift
//  Milestone-Projects-1-3
//
//  Created by Baris Karalar on 2.06.2021.
//

import UIKit

class ViewController: UITableViewController {

    var flags = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      flags = loadCountryImagesFromDisk()
        
    }
    
    func loadCountryImagesFromDisk() -> [String] {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        
        let items = try! fm.contentsOfDirectory(atPath: path)
        var flags = [String]()
        
        for item in items {
            if item.hasSuffix("@3x.png") {
//                flags.append(item.replacingOccurrences(of: "@3x.png", with: "").uppercased())
                flags.append(item)
            }
        }
        
        return flags
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Flag", for: indexPath)
        cell.textLabel?.text = flags[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            vc.selectedImage = flags[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}



