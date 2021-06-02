//
//  DetailViewController.swift
//  Milestone-Projects-1-3
//
//  Created by Baris Karalar on 2.06.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let img = selectedImage {
            imageView.image = UIImage(named: img)
        }

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))

    }
    
    @objc func shareTapped() {
        guard let img = imageView.image else {
            print("No image found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [img], applicationActivities: [])
        //For ipad this is required
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true, completion: nil)
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
