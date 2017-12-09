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
        print("5")
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            print("6")
            cameraView.contentMode = .scaleAspectFit
            let data: Data = UIImagePNGRepresentation(pickedImage)!
            print("7")
            let token = Data()
            
            print(token)
            cameraView.image = pickedImage
        }
        //閉じる処理
        imagePicker.dismiss(animated: true, completion: nil)
        label.text = "Tap the [Save] to save a picture"
        
    }
    
    // 撮影がキャンセルされた時に呼ばれる
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        label.text = "Canceled"
    }
    
    @IBAction func savePicture(_ sender: Any) {
//        let image:UIImage! = cameraView.image
//        if image != nil {
//            UIImageWriteToSavedPhotosAlbum(image, self,#selector(ViewController.image(_:didFinishSavingWithError:contextInfo:)), nil)
//        }
//        else{
//            label.text = "image Failed !"
//        }
//    }
//
//    @objc func image(_ image: UIImage, didFinishSavingWithError error: NSError!, contextInfo: UnsafeMutableRawPointer) {
//        if error != nil {
//            print(error.code)
//            label.text = "Save Failed !"
//        }
//        else{
//            print(image)
//            label.text = "Save Succeeded"
//        }
        Purse.postBook()
    }
    
    
    @IBAction func showAlbum(_ sender: Any) {
        let sourceType: UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.photoLibrary
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            print("1")
            cameraPicker.sourceType = sourceType
            print("2")
            cameraPicker.delegate = self
            print("3")
            self.present(cameraPicker, animated: true, completion: nil)
            print("4")
            label.text = "Tap the [Start] to save a picture"
        }
        else{
            label.text = "error"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Tap the [Start] to take a picture"
        guard let image: UIImage = UIImage(named: "sample.jpg") else { return }
        cameraView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
