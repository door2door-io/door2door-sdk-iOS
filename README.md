[![Build Status](https://travis-ci.com/door2door-io/mobility-analytics-sdk-ios.svg?token=mxhR6CvH5qpkhU4ysi1n&branch=develop)](https://travis-ci.com/door2door-io/mobility-analytics-sdk-ios)

# D2DEventCollectionKit
A **dependency free** plug and play API wrapper to send event data to the Door2Door event collection backend for mobility events.
	
##Table of contents

1. [Technical requirements](#1.Technical Requirements)
2. [Setup](#1.Setup)
3. [Guide](#2.Guide)
4. [Reference](#3.Reference)
5. [Support](#4.Support) 
6. [Todo](Documentation/todo.md)


## 1. Technical Requirements

The event collection API wrapper can be used with ``swift 3.x`` and higher as well as with ``Objective-C``. We also made it usale with your most beloved dependecy manager. You have the choice. 

 * ``Swift 3.x``
 * ``Objective-C``
 * ``Cocoapods``
 * ``Carthage``
 * Use the ``Xcode project`` directly in your project


## 2 Setup

**Manual Setup** <br>
If you use our sdk without any dependency manager please drag the ``D2DEventCollectionKit.xcodeproj`` file into your project where you want to make use of the provided functionality. Go to your project settings and add set the ``Target Dependecy`` and ``Link Binary with Libraries`` like in the images shown beneath. Please set this for all the targets. 

*Link Binary with Libraries*
![Link Binary](Documentation/img/Link-Binary.png)

*Target Dependecy*
![Target Dependecy](Documentation/img/Target-Dependecy.png)

In Build Settings, you can add user-defined variable like this: 
*Framework Path Mapping*
![Target Dependecy](Documentation/img/Mapping.png)
This step is needed if your environment variables are not using the xcode defaults. We recommend this step. 

Next step is to go to your ``Framework Search Path`` and add following entry: ``$(BUILD_DIR)/$(FRAMEWORK_PATH_MAPPING)$(EFFECTIVE_PLATFORM_NAME)`` Thats it! 

**Happy integrating!**
## 3. Guide

Ones you are done with the integration of the sdk with your most beloved dependecy manager its time to use the sdk. Setting it up is pretty easy. The same applies for the use of the sdk when using Objective-C. The ``D2DEventCollectionKitDemoObjc`` demo shows you the integration process for Objective-C. 

###Setup
 
In your application delegate implement the following: 

	 EventCollectionKit.register(applicationToken: "YOUR_APP_TOKEN_GOES_HERE",
                            	 applicationName: "Your application name",
                             	 applicationVersion: "1.0")
                             	 
Once this is done you can enable/disable debug output. The debug output is disabled by default. 
	
	EventCollectionKit.enable(logging: true)
	
### Create Events
Creating and sending an event is pretty straight forward. To create an event for a ``route`` with its action ``search`` you use the convenience method on the ``TripEvent`` object like in the example beneath. 

	let tripSearchEvent  = TripEvent.tripSearchEvent(modesOfTransportation:[.train, .taxi],
                                                     departureTime: Date(),
                                                     originLatitude: 52.5230554,
                                                     originLongitude: 13.4122575,
                                                     originName: "Alexanderplatz",
                                                     originStreet: "Alexanderplatz",
                                                     originCity: "Berlin",
                                                     originPostalCode: "10119",
                                                     originCountry: "Germany",
                                                     arrivalTime: nil,
                                                     destinationLatitude: 52.5300641,
                                                     destinationLongitude: 13.4008385,
                                                     destinationName: "Door2Door HQ",
                                                     destinationStreet: "Torstrasse 109",
                                                     destinationCity: "Berlin",
                                                     destinationPostalCode: "10178",
                                                     destinationCountry: "Germany")

### Sending events
Once you have created an event like this you just need to send it by using the ``EventCollectionKit`` ``send:`` function. Thats it. You can see the list of events and its parameter definitions in the sdk itself or you will find it in the [Reference section](#Reference) section

        EventCollectionKit.send(event: tripSearchEvent)

	
## 4. Reference
To make the SDK as easy to use as possible we have mapped the possible event types to class functions of type ``TripEvent``. A ``TripEvent`` can have multiple actions attached to it which defines the state for a trip. The list beneath shows the existing actions and their corresponding class functions for convenience.    
<br>
Since the SDK supports ``Swift`` and ``Objective-C`` there are two convinience class functions per event implemented. One for ``Swift`` and one for ``Objective-C``. When using ``Swift`` you can potentially choose which one to use but we encourage to use the function with the typed signature where the ``modesOfTransportation`` is of type ``[ModesOfTransportation]``. The ``Objective-C`` implementation uses the signaturer ``modesOfTransportation`` with its type ``[NSNumber]`` 
<br>
The ``ModesOfTransportation`` swift enum defines the available modes of transportation and can be mapped into values from ``0 - 8`` which should be used as ``NSNumbers`` if you are using the SDK in ``Objective-C`` 
<br>

**For example** ``ModesOfTransportation.taxi`` in swift would map to the ``NSNumber`` ``@(ModesOfTransportationTaxi)`` using Objective-C
<br>    

	public enum ModesOfTransportation: Int {
		case train // 0
 		case walk // 1
	 	case publicTransport // 2
    	case carSharing // 3
    	case bikeSharing // 4
    	case taxi // 5
    	case privateBike // 6
    	case rideSharing // 7
    	case other // 8
    }
You can find the corresponding method signatures for``TripEvent`` events at ``Source/Events/Trip`` in the project. 
<br>  

#### Trip Search
A user is searching how to get from A to B. 

	TripEvent.tripSearchEvent(...)

#### Trip Begin
A user starts getting from A to B.

	TripEvent.tripBeginEvent(...)
	
#### Trip Book
A user Books a trip from A to B.
		
	TripEvent.tripBookEvent(...)

#### Trip Cancel
A user cancels a booked trip.
	
	TripEvent.tripCancelEvent(...)
	
#### Trip End
A user reached his destination. 
		
	TripEvent.tripEndEvent(...)
	
#### Trip Interest
A user examins the details of search result. This happens if a search ends up with multiple results.

	TripEvent.tripInterestEvent(...)
	
#### Trip Pay
A user pays for a getting from A to B.
		
	TripEvent.tripPayEvent(...)


## 5. Support

**Mail**: tech@door2door.io (Or something like that.) <br>
**Web**: www.door2door.io