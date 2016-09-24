//
//  FileController.swift
//  Day To Dos
//
//  Created by Noemi Quezada on 9/24/16.
//  Copyright © 2016 Noemi Quezada. All rights reserved.
//


import Foundation


class FileController{
    
    
    class func  documentsDirctory() -> URL?{return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first}
    
    class func filePath() -> URL? {
        
        let path =   FileController.documentsDirctory()?.appendingPathComponent("list", isDirectory: false).appendingPathExtension("data")
        
        return path
    }
    
}
