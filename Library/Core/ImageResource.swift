//
//  ImageResource.swift
//  R.swift.Library
//
//  Created by Mathijs Kadijk on 11-01-16.
//  From: https://github.com/mac-cain13/R.swift.Library
//  License: MIT License
//

import Foundation

public protocol ImageResourceType {
  
  /// Bundle this image is in
  var bundle: Bundle { get }
  
  /// Name of the image
  var name: String { get }
}

public struct ImageResource: ImageResourceType {
  
  /// Bundle this image is in
  public let bundle: Bundle
  
  /// Name of the image
  public let name: String
  
  public init(bundle: Bundle, name: String) {
    self.bundle = bundle
    self.name = name
    print( "画像名 :\(name) \( existsImageResource(forImageNamed: name) ? "ファイルがある" : "ファイルはない" )" )
  }
  
  
  func existsImageResource(forImageNamed name: String) -> Bool {
    
    let fileManager = FileManager.default
    let cacheDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)[0]
    let url = cacheDirectory.appendingPathComponent("\(name).png")
    let path = url.path
    
    return fileManager.fileExists(atPath: path)
    
//    guard fileManager.fileExists(atPath: path) else {
//      guard
//        let image = UIImage(named: name),
//        let data = UIImagePNGRepresentation(image)
//        else { return false }
//
//      fileManager.createFile(atPath: path, contents: data, attributes: nil)
//      return true
//    }
//
//    return true
    
  }
  
}

