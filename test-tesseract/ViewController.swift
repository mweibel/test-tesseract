//
//  ViewController.swift
//  test-tesseract
//
//  Created by Michael on 06.11.15.
//  Copyright © 2015 Michael Weibel. All rights reserved.
//

import UIKit
import TesseractOCR

class ViewController: UIViewController, G8TesseractDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tesseract = G8Tesseract.init(language: "eng")
        tesseract.delegate = self;
        tesseract.charWhitelist = "0123456789";
        tesseract.image = UIImage.init(named: "image_sample.jpg")!.g8_blackAndWhite()
        tesseract.rect = CGRectMake(20, 20, 100, 100);
        tesseract.maximumRecognitionTime = 2.0;
        tesseract.recognize()

        print(tesseract.recognizedText)
    }

    func progressImageRecognitionForTesseract(tesseract: G8Tesseract!) {
        print("Progress \(tesseract.progress)")
    }

    func shouldCancelImageRecognitionForTesseract(tesseract: G8Tesseract!) -> Bool {
        return false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

