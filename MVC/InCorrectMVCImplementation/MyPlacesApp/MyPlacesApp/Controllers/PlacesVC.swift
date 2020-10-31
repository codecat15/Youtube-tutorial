//
//  NearByPlacesVC.swift
//  MyPlacesApp
//
//  Created by CodeCat15 on 10/31/20.
//

import UIKit
import MapKit
import CoreLocation

class PlacesVC: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

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
        The token I used during the demo is removed for security reasons, I request you to please create your own token by following the steps mentioned in the given link

        Places API: https://developers.google.com/maps/documentation/javascript/get-api-key?utm_source=google&utm_medium=cpc&utm_campaign=FY20-Q3-global-demandgen-displayonnetworkhouseads-cs-GMP_maps_contactsal_saf_v2&utm_content=text-ad-none-none-DEV_c-CRE_315916117565-ADGP_Hybrid%20%7C%20AW%20SEM%20%7C%20BKWS%20~%20Google%20Maps%20Places%20API-KWID_43700039136946099-aud-581578347266%3Akwd-22859391737-userloc_9024585&utm_term=KW_google%20places%20api-ST_google%20places%20api&gclid=Cj0KCQjwlvT8BRDeARIsAACRFiXUU1g-HOhQLNHMqwBcwpAqZRSgow4G4JWv2a987k1Gs8msBFPRtMsaAil9EALw_wcB

        """)

    func displayNearByPlaces(){

        // 1. Formatting the user location for API query string
        let userLocation = "\(locationManager.location!.coordinate.latitude),\(locationManager.location!.coordinate.longitude)"

        // 2. Creating the google places API query string
        let apiUrl = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(userLocation)&radius=1500&type=\(placeType)&sensor=true&key=\(API.key)"

        // 3. Create the URLRequest object
        var urlRequest = URLRequest(url: URL(string: apiUrl)!)
        urlRequest.httpMethod = "get"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")

        // 4. Making the API call
        URLSession.shared.dataTask(with: urlRequest) { (responseData, urlResponse, networkError) in
            if(networkError == nil && responseData != nil){

                // 5. Decoding the response
                let result = try! JSONDecoder().decode(PlacesResponse.self, from: responseData!)
                if(result.results != nil){

                    // 6. Making the pin annotation array
                    var placeAnnotations : [PlaceAnnotation] = [PlaceAnnotation]()

                    result.results?.forEach({ (locationPlace) in
                        let latitude = locationPlace.geometry?.location?.lat
                        let longitude = locationPlace.geometry?.location?.lng

                        let placeAnnotation = PlaceAnnotation(_title: locationPlace.name!, _coordinate: CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!))
                        placeAnnotations.append(placeAnnotation)
                    })

                    //7. Display the response on the screen via pin annotations
                    DispatchQueue.main.async {
                        // code to show annotations for places
                        self.placesMap.addAnnotations(placeAnnotations)
                    }
                }
            }else{
                //8. Display network error alert
                self.displayAlert(alertMessage: "Network error, please try again")
            }
        }.resume()
    }

    // MARK: - map view delegate for pin annotations
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is PlaceAnnotation else { return nil }

        let identifier = "placesAnnotations"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }

        return annotationView
    }

    // MARK: - location manager delegate method for location updates to the map
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            placesMap.setRegion(region, animated: true)
            displayNearByPlaces()
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
