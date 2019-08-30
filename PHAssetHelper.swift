//
//  File.swift
//  
//
//  Created by Daljeet Singh on 30/08/19.
//

import Foundation


extension PHAsset {
    
    static let imageSize = CGSize(width: 400, height: 400)
    
    class func getImageFrom(url : String, completion : @escaping (_ image : UIImage?) -> ()) {
        
        // retrieve the list of matching results for your asset url
        let assetUrl = URL(string: url)!
        
        let fetchResult = PHAsset.fetchAssets(withALAssetURLs: [assetUrl], options: nil)
        
        if let photo = fetchResult.firstObject {
            
            // retrieve the image for the first result
            let option = PHImageRequestOptions()
            option.isSynchronous = true
            PHImageManager.default().requestImage(for: photo, targetSize: imageSize, contentMode: .aspectFill, options: option) {
                image, info in
                
                if let myImage = image {
                    completion(myImage)
                } else {
                    completion(nil)
                }
            }
        }
    }
    
    class func getImageFromAsset(asset:PHAsset, imageSize:CGSize, callback:@escaping (_ result: UIImage) -> Void) -> Void{
        let requestOptions = PHImageRequestOptions()
        requestOptions.resizeMode = PHImageRequestOptionsResizeMode.fast
        requestOptions.deliveryMode = PHImageRequestOptionsDeliveryMode.highQualityFormat
        requestOptions.isNetworkAccessAllowed = true
        requestOptions.isSynchronous = true
        PHImageManager.default().requestImage(for: asset, targetSize: imageSize, contentMode: PHImageContentMode.default, options: requestOptions, resultHandler: { (currentImage, info) in
            callback(currentImage!)
        })
    }
}
