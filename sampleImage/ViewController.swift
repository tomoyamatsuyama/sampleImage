//
//  ViewController.swift
//  sampleImage
//
//  Created by 松山友也 on 2017/11/22.
//  Copyright © 2017年 Tomoya Matsuyama. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var cameraView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func startCamera(_ sender: Any) {
        let sourceType: UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.camera
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
        } else {
            label.text = "error"
        }
    }
    
    func imagePickerController(_ imagePicker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            cameraView.contentMode = .scaleAspectFit
            let data: Data = UIImagePNGRepresentation(pickedImage)!
            cameraView.image = pickedImage
        }
        imagePicker.dismiss(animated: true, completion: nil)
        label.text = "Tap the [Save] to save a picture"
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        label.text = "Canceled"
    }
    
    @IBAction func savePicture(_ sender: Any) {
        Purse.postBook()
    }
    
    @IBAction func showAlbum(_ sender: Any) {
        let sourceType: UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.photoLibrary
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
            label.text = "Tap the [Start] to save a picture"
        }
        else{
            label.text = "error"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Tap the [Start] to take a picture"
        guard let image: UIImage = UIImage(named: "sample.jpg") else { return }  //シュミレータはカメラを起動できないため、デフォルトで写真をセット。
        cameraView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
