//
//  HomeViewController.swift
//  Brink - Scan Documents
//
//  Created by Gurjit Singh on 29/03/20.
//  Copyright © 2020 Gurjit Singh. All rights reserved.
//

import UIKit
import VisionKit

class HomeViewController: UIViewController {

    @IBOutlet weak var btnScanDocuments: UIButton!
    @IBOutlet weak var resultImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //function to scan new document
    @IBAction func onBtnNewScanClicked(_ sender: UIButton) {
        let cameraVC = VNDocumentCameraViewController()
        //cameraVC.delegate = self
        present(cameraVC, animated: true)
    }
    
    func documentCameraVC(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        print("Image \(scan.pageCount)")
        for index in 0..<scan.pageCount {
            let resultImage = scan.imageOfPage(at: index)
            
        }
    }
    
}
