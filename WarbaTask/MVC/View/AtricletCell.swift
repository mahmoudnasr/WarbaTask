//
//  AtricletCell.swift
//  WarbaTask
//
//  Created by Mahmoud Nasr on 3/27/19.
//  Copyright © 2019 Mahmoud Nasr. All rights reserved.
//

import UIKit

class AtricletCell: UITableViewCell {

    @IBOutlet weak var articleDate: UILabel!
    @IBOutlet weak var articleDescription: UILabel!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setData(data : ArticleResults)
    {
     articleDate.adjustsFontSizeToFitWidth = true
     articleDate.text = data.published_date
     articleTitle.text = data.title
     articleDescription.text = data.byline
        let media  = data.media?.first
        let imageurlObj  = media?.mediametadata?.last
        articleImage.dowloadFromlink(link: (imageurlObj?.url)!)
        articleImage.setCircle()
        
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
