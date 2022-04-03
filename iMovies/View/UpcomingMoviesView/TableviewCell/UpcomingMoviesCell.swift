//
//  UpcomingMoviesCell.swift
//  iMovies
//
//  Created by Mac on 02/04/2022.
//

import UIKit

class UpcomingMoviesCell: UITableViewCell {

    @IBOutlet weak var MovieTitleLbl: UILabel!
    @IBOutlet weak var ThumbImg: lazyImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.layer.cornerRadius = 10
       
    }
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
