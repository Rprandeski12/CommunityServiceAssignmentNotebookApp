//
//  Assignment.swift
//  AssignmentNotebook
//
//  Created by  on 4/12/19.
//  Copyright © 2019 RobertPrandeskiIOS. All rights reserved.
//

import Foundation
import UIKit
class Assignment: Codable
{
    var assignmentName = ""
    var dueDate = ""
    var image : UIImage?
    

    
    init(n:String , d:String)
    {
        assignmentName = n
        dueDate = d
        image = #imageLiteral(resourceName: "AssignmentPic")
        
    }
    
    init(theImage: UIImage)
    {
        image = theImage
        assignmentName = "ToDo"
        
        dueDate = "tomorrow"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(assignmentName, forKey: .assignmentName)
        try container.encode(dueDate, forKey: .dueDate)
        try container.encode(image ?? #imageLiteral(resourceName: "AssignmentPic"), forKey: .image)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        assignmentName = try container.decode(String.self, forKey: .assignmentName)
        dueDate = try container.decode(String.self, forKey: .dueDate)
        image = try container.decode(UIImage.self, forKey: .image)
    }
    
    private enum CodingKeys: String, CodingKey {
        case assignmentName
        case dueDate
        case image
    }
    
    
    
//    init(from decoder: Decoder) throws {
//        print("Trying to decode")
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        assignmentName = try values.decode(String.self, forKey: .assignmentName)
//        dueDate = try values.decode(String.self, forKey: .dueDate)
//        image = #imageLiteral(resourceName: "AssignmentPic")
//    }
    
    
    
    
}
