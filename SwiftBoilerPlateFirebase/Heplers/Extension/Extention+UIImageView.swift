//
//  Extention+UIImageView.swift
//  Squeezee
//
//  Created by AKASH on 07/08/23.
//

import Kingfisher
import UIKit

extension UIImageView {
    func setImage(from urlStr: String, placeholderImage: UIImage = UIImage(), complition: ((UIImage) -> Void)? = nil) {
        guard let url = URL(string: urlStr) else {
            return
        }
        kf.indicatorType = .activity
        kf.setImage(
            with: url,
            placeholder: placeholderImage,
            options: [
                .transition(.fade(1)),
                .processor(DefaultImageProcessor()),
                .cacheOriginalImage,
                .scaleFactor(UIScreen.main.scale)
            ]
        ) { result in
            switch result {
            case let .success(value):
                complition?(value.image)
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }

    func blur(withStyle style: UIBlurEffect.Style = .light) {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        addSubview(blurEffectView)
        clipsToBounds = true
    }

    func blurred(withStyle style: UIBlurEffect.Style = .light) -> UIImageView {
        let imgView = self
        imgView.blur(withStyle: style)
        return imgView
    }
}
