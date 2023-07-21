//
//  ViewController.swift
//  ImageZoom
//
//  Created by Николай Игнатов on 21.07.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    private let defaultImageHeight: CGFloat = 270

    private lazy var scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 1500)
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.delegate = self
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: defaultImageHeight))
        imageView.image = UIImage(named: "image")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = scrollView
        scrollView.addSubview(imageView)
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        if offset <= 0 {
            imageView.frame.origin.y = offset
            imageView.frame.size.height = defaultImageHeight - offset
        }
        scrollView.verticalScrollIndicatorInsets.top = defaultImageHeight - offset - view.safeAreaInsets.top
    }
}
