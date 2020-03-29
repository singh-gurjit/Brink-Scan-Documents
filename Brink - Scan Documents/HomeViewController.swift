//
//  HomeViewController.swift
//  Brink - Scan Documents
//
//  Created by Gurjit Singh on 29/03/20.
//  Copyright © 2020 Gurjit Singh. All rights reserved.
//

import UIKit
import VisionKit
import PDFKit

class HomeViewController: UIViewController, VNDocumentCameraViewControllerDelegate {

    @IBOutlet weak var btnScanDocuments: UIButton!
    @IBOutlet weak var resultImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //function to scan new document
    @IBAction func onBtnNewScanClicked(_ sender: UIButton) {
        //create an instance of VNDocumentCameraViewController
        let cameraVC = VNDocumentCameraViewController()
        //cameraVC.delegate = self
        present(cameraVC, animated: true)
    }
    
    //call when document scan will be complete
    func documentCameraVC(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        print("Image \(scan.pageCount)")
        let pdfDocs = PDFDocument()
        for index in 0..<scan.pageCount {
            let image = scan.imageOfPage(at: index)
            let pdfPage = PDFPage(image: image)
            pdfDocs.insert(pdfPage!, at: index)
            //set image to imageview
            resultImage.image = image
        }
    }
    
}
