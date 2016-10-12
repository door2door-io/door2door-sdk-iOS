//
//  Event+Route.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 12/10/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import Foundation

extension Event {
    
    class func routeEvent() -> Event? {
        
        let event = Event()
        
        guard var jsonDict = event.jsonDict else {
            
            return nil
        }
        
        // Find a nice and clean solution to this one. 
        jsonDict["route"] = "route"
        
        d
        
        return event
    }
}
