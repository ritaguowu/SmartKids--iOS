//
//  CameraSevices.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-13.
//

import Foundation
import AVFoundation

class CameraService{
    
    var session: AVCaptureSession?
    var delegate: AVCapturePhotoCaptureDelegate?
    
    let output = AVCapturePhotoOutput()
    let previewLayer = AVCaptureVideoPreviewLayer()
    
    func start(delegate: AVCapturePhotoCaptureDelegate, completion: @escaping(Error?) ->()){
        self.delegate = delegate
    }
}
