//
//  DetailViewController.swift
//  WarbaTask
//
//  Created by Mahmoud Nasr on 3/26/19.
//  Copyright © 2019 Mahmoud Nasr. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {

    @IBOutlet weak var artDescription: UILabel!
    
    @IBOutlet weak var artImage: UIImageView!
    
    @IBOutlet weak var artTile: UILabel!
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            
           artTile.text = detail.title!
            artDescription.text = detail.abstract!
            if((detail.media?.count)! > 0)
            {
                let mediaItem = detail.media?.first
                if((mediaItem?.mediametadata?.count)! > 0)
                {
                    let imageOBJ = mediaItem?.mediametadata?.last
                    artImage.dowloadFromlink(link: (imageOBJ?.url)!)
                }
            }
            
            
           
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.rowHeight = UITableView.automaticDimension

    }
    override func viewWillAppear(_ animated: Bool) {
          configureView()
    }
    var detailItem: ArticleResults? {
        didSet {
            // Update the view.
          //  configureView()
        }
    }

    
}

