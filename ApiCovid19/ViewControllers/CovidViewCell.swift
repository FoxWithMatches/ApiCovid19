//
//  CovidViewCell.swift
//  ApiCovid19
//
//  Created by Alisa Ts on 06.12.2021.
//

import UIKit

class CovidViewCell: UITableViewCell {

    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var deathLabel: UILabel!
    @IBOutlet var imageViewCovid: UIImageView!
    
    func configure(with rawData: RawData) {
        countryLabel.text = rawData.Country_Region ?? nil
        deathLabel.text = rawData.Deaths ?? nil
        imageViewCovid.image = UIImage(systemName: "cross.fill")
        
    }

}
