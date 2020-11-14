//
//  NearByPlacesVC.swift
//  MyPlacesApp
//
//  Created by CodeCat15 on 10/31/20.
//

import UIKit
import MapKit
import CoreLocation

class PlacesVC: UIViewController {

    @IBOutlet weak var placesMap: MKMapView!
    var placeType: String = String()
    fileprivate let locationManager: CLLocationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self

        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
        // Do any additional setup after loading the view.

    }

    #warning ("""
        The token I used during the demo is removed for SECURITY reasons, I request you to please create your own token by following the steps mentioned in the given link, Apologies for any inconvinience caused

        Places API: https://developers.google.com/maps/documentation/javascript/get-api-key?utm_source=google&utm_medium=cpc&utm_campaign=FY20-Q3-global-demandgen-displayonnetworkhouseads-cs-GMP_maps_contactsal_saf_v2&utm_content=text-ad-none-none-DEV_c-CRE_315916117565-ADGP_Hybrid%20%7C%20AW%20SEM%20%7C%20BKWS%20~%20Google%20Maps%20Places%20API-KWID_43700039136946099-aud-581578347266%3Akwd-22859391737-userloc_9024585&utm_term=KW_google%20places%20api-ST_google%20places%20api&gclid=Cj0KCQjwlvT8BRDeARIsAACRFiXUU1g-HOhQLNHMqwBcwpAqZRSgow4G4JWv2a987k1Gs8msBFPRtMsaAil9EALw_wcB

        """)

    /*Hey there, thanks for downloading the code, if you have any questions then please do ask them via comments or email.
     Do support the channel by sharing the content with your iOS group on facebook or whatsapp*/

    func displayNearByPlaces(){

        // 1. Formatting the user location for API query string
        let userLocation = "\(locationManager.location!.coordinate.latitude),\(locationManager.location!.coordinate.longitude)"
        let request = PlacesRequest(radius: 1500, type: placeType, key: API.key, location: userLocation)
        let placesResource = PlaceResource()

        placesResource.getNearByPlaces(request: request) { (placesResponse) in
            if(placesResponse != nil)
            {
                // create pin annotations
                var placeAnnotations : [PlaceAnnotation] = [PlaceAnnotation]()
                
                placesResponse?.results?.forEach({ (locationPlace) in
                    placeAnnotations.append(locationPlace.toPlaceAnnotation())
                })

                //7. Display the response on the screen via pin annotations
                DispatchQueue.main.async {
                    // code to show annotations for places
                    self.placesMap.addAnnotations(placeAnnotations)
                }
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
