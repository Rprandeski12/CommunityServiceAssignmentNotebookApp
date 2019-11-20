//
//  Assignment.swift
//  AssignmentNotebook
//
//  Created by  on 4/12/19.
//  Copyright © 2019 RobertPrandeskiIOS. All rights reserved.
//

import Foundation
import UIKit
struct Assignment: Codable
{
    var assignmentName = ""
    var dueDate = ""
    var image : UIImage?
    
//    enum CodingKeys: String, CodingKey {
//    case latitude
//    case longitude
//    case altitude
//    case horizontalAccuracy
//    case verticalAccuracy
//    case speed
//    case course
//    case timestamp
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
    
    init(from decoder: Decoder) throws {
        print("crash from assignmetn class in decodable")
//        fatalError()
    }
    
    func encode(to encoder: Encoder) throws {
        print("crash from encodable")
//        var container = encoder.container(keyedBy: CodingKey.Protocol.self)
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(coordinate.latitude, forKey: .latitude)
//        try container.encode(coordinate.longitude, forKey: .longitude)
//        try container.encode(altitude, forKey: .altitude)
//        try container.encode(horizontalAccuracy, forKey: .horizontalAccuracy)
//        try container.encode(verticalAccuracy, forKey: .verticalAccuracy)
//        try container.encode(speed, forKey: .speed)
//        try container.encode(course, forKey: .course)
//        try container.encode(timestamp, forKey: .timestamp)
//        fatalError()
    }
    
    
}
