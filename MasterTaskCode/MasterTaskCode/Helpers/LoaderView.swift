//
//  LoaderView.swift
//  AlbumApp
//
//  Created by Ratnesh Kumar Singh on 5/22/19
//  Copyright © 2019 Ratnesh Kumar Singh. All rights reserved.
//

import Foundation
import UIKit

class LoaderView {
    internal static var spinner: UIActivityIndicatorView?

    static var style: UIActivityIndicatorView.Style = .whiteLarge
    static var baseBackColor = UIColor.red
    static var baseColor = UIColor.blue

    static func start(style: UIActivityIndicatorView.Style = style, backColor: UIColor = baseBackColor, baseColor: UIColor = baseColor) {
        if spinner == nil, let window = UIApplication.shared.keyWindow {
            let frame = UIScreen.main.bounds
            spinner = UIActivityIndicatorView(frame: frame)
            spinner!.backgroundColor = backColor
            spinner!.style = style
            spinner?.color = baseColor
            window.addSubview(spinner!)
            spinner!.startAnimating()
        }
    }

    static func stop() {
        DispatchQueue.main.async {
            if spinner != nil {
                spinner!.stopAnimating()
                spinner!.removeFromSuperview()
                spinner = nil
            }
        }
    }

}
