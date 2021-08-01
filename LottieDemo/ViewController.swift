//
//  ViewController.swift
//  LottieDemo
//
//  Created by VanJay on 2021/8/1.
//

import Lottie
import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        view.backgroundColor = .gray
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for subView in self.view.subviews {
            subView.removeFromSuperview()
        }

        let manager = FileManager.default

        let width = self.view.bounds.size.width * 0.25, height = width
        let columnCount = 4

        let dirPath = Bundle.main.path(forResource: "Lottie", ofType: nil)
        if let dirPath = dirPath {
            let contentsOfPath = try? manager.contentsOfDirectory(atPath: dirPath)
            if let contentsOfPath = contentsOfPath {
                for subPath in contentsOfPath {
                    let jsonPath = dirPath + "/" + subPath + "/" + subPath + ".json"
                    let index = contentsOfPath.firstIndex(of: subPath)

                    if let index = index {
                        let column = index % columnCount
                        let row = index / columnCount

                        let view = AnimationView(filePath: jsonPath)
                        view.frame = CGRect(x: CGFloat(column) * width, y: 100.0 + CGFloat(row) * height, width: width, height: height)
                        self.view.addSubview(view)
                        view.loopMode = .loop
                        view.play()
                    }
                }
            }
        }
    }
}
