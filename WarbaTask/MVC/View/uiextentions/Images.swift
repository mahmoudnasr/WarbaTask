//
//  Images.swift
//  WarbaTask
//
//  Created by Mahmoud Nasr on 3/27/19.
//  Copyright © 2019 Mahmoud Nasr. All rights reserved.
//
import UIKit
import Foundation
extension UIImageView {
    func dowload(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        let spinner = UIActivityIndicatorView(style: .gray)
       spinner.center = self.center
        self.addSubview(spinner)
        spinner.startAnimating()
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
                spinner.removeFromSuperview()
            
            }
            }.resume()
    }
    func dowloadFromlink(link: String, contentMode mode: UIView.ContentMode = .scaleToFill) {
        guard let url = URL(string: link) else { return }
        dowload(url: url, contentMode: mode)
    }
    func setCircle()
    {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
    }
}
