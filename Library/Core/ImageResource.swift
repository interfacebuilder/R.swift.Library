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
    self.name = ImageResource.existsImageResource(forImageNamed: name)
  }
  
  // 画像名-Locale.current.languageCode のフォーマットで画像があるかどうかを確認。
  // 画像がなければ引数を返し、あればそちらを使う
  static func existsImageResource(forImageNamed name: String) -> String {
    
    let languageCode = Locale.current.languageCode ?? ""
    let localedName = "\(name)-\(languageCode)"

    let fileManager = FileManager.default
    let cacheDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)[0]
    let url = cacheDirectory.appendingPathComponent("\(localedName).png")
    let path = url.path

    guard fileManager.fileExists(atPath: path) else {
      guard let image = UIImage(named: localedName), let data = UIImagePNGRepresentation(image) else {
        return name
      }
      fileManager.createFile(atPath: path, contents: data, attributes: nil)
      return localedName
    }
    return localedName
  }
  
}

