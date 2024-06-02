//
//  TBTorch.swift
//
//
//  Created by Ken Ishimoto on 2023/05/01.
//

import SwiftUI
import AVFoundation

public struct TBTorch {
    
    /// Wrapper around `AVCaptureTorchMode`.
    public enum TorchMode {
        case on
        case off
    }
    
#if os(iOS)
    private static var backCameraDevice: AVCaptureDevice? {
        return AVCaptureDevice.default(for: .video)
    }
    
    public static func isTorchLightOn() -> TorchMode {
#if targetEnvironment(simulator)
        return .off
#else
        
        // Camera is always nil on Simulator
        // Optional([Back Camera][com.apple.avfoundation.avcapturedevice.built-in_video:0])
        
        guard let backCamera = backCameraDevice else {
            return .off
        }
        
        if backCamera.hasTorch && backCamera.isTorchAvailable {
            return backCamera.isTorchActive ? .on : .off
        }
        return .off
        
#endif
    }
    
#endif
}
