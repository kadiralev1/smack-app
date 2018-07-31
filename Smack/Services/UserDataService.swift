//
//  UserDataService.swift
//  Smack
//
//  Created by Kadir Kutluhan Alev on 31.07.2018.
//  Copyright © 2018 Kadir Kutluhan Alev. All rights reserved.
//

import Foundation


class UserDataService {
    
    static let instance = UserDataService()
    
    
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    func setUserData(id:String,color:String,avatarName:String,email:String,name:String){
        self.id=id
        self.avatarColor=color
        self.avatarName=avatarName
        self.email=email
        self.name=name
    }
    func setAvatarName(avatarName:String) {
        self.avatarName = avatarName
    }
    
    func returnUIColor(components:String) -> UIColor {
        
        let scanner = Scanner(string: components)
        let skipped = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skipped
        var r,g,b,a : NSString?
        
        scanner.scanUpToCharacters(from: comma, into: &r)
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma, into: &a)
        
        let defaultColor = UIColor.lightGray
        guard let rUnwarraped = r else {return defaultColor}
        guard let gUnwarraped = g else {return defaultColor}
        guard let bUnwarraped = b else {return defaultColor}
        guard let aUnwarraped = a else {return defaultColor}
        
        let rFloat = CGFloat(rUnwarraped.doubleValue)
        let gFloat = CGFloat(gUnwarraped.doubleValue)
        let bFloat = CGFloat(bUnwarraped.doubleValue)
        let aFloat = CGFloat(aUnwarraped.doubleValue)
        let newUIColor = UIColor(red: rFloat, green: gFloat, blue: bFloat, alpha: aFloat)
        return newUIColor
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
