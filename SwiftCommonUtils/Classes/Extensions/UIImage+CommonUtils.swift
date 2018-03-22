//
//  UIImage+CommonUtils.swift
//  Join
//
//  Created by Bhavna on 3/9/18.
//  Copyright © 2018 SkillupJapan Corp. All rights reserved.
//

import Foundation

public extension UIImage{
  public func resizeImage(boundingSize:CGSize) -> UIImage {
    
    let image = self.setImageOrientation()

    let actualSize = image.size
    var newSize = actualSize
    
    let hRatio = boundingSize.height/actualSize.height
    let wRatio = boundingSize.width/actualSize.width
    
    guard (actualSize.width < boundingSize.width && actualSize.height < boundingSize.height) else {
      
      if wRatio < hRatio {
        newSize = CGSize(width: boundingSize.width, height: actualSize.height*wRatio)
      }else{
        newSize = CGSize(width: actualSize.width*hRatio, height: boundingSize.height)
      }
      
      UIGraphicsBeginImageContextWithOptions(newSize, true, self.scale)
      image.draw(in: CGRect(origin: CGPoint(x: 0, y: 0), size: newSize))
      let newImage = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()
      return newImage!
    }
    return image
  }
  
  public func setImageOrientation() -> UIImage {
    
    guard imageOrientation != .up else {
      return self
    }
    
    var transform = CGAffineTransform.identity
    
    switch imageOrientation {
    case .down, .downMirrored:
      transform = transform.translatedBy(x: size.width, y: size.height)
      transform = transform.rotated(by: CGFloat.pi)
      break
    case .left, .leftMirrored:
      transform = transform.translatedBy(x: size.width, y: 0)
      transform = transform.rotated(by: CGFloat.pi/2)
      break
    case .right, .rightMirrored:
      transform = transform.translatedBy(x: 0, y: size.height)
      transform = transform.rotated(by: -CGFloat.pi/2)
      break
      
    default:
      break
    }
    
    switch imageOrientation {
      
    case .upMirrored, .downMirrored:
      
      transform.translatedBy(x: size.width, y: 0)
      transform.scaledBy(x: -1, y: 1)
      
    case .leftMirrored, .rightMirrored:
      
      transform.translatedBy(x: size.height, y: 0)
      transform.scaledBy(x: -1, y: 1)
      
    default:
      break
    }
    
    let context = CGContext(data: nil, width: Int(size.width), height: Int(size.height), bitsPerComponent: cgImage!.bitsPerComponent, bytesPerRow: 0, space: cgImage!.colorSpace!, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!
    context.concatenate(transform)
    
    if (imageOrientation == .left || imageOrientation == .right) {
      context.draw(cgImage!, in: CGRect(x: 0, y: 0, width: size.height, height: size.width))
    }
    else{
      context.draw(cgImage!, in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
    }
    
    let cgimage = context.makeImage()
    
    return UIImage(cgImage: cgimage!)
  }
}
