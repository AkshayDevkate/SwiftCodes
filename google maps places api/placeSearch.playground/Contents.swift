import Cocoa

//Required parameters

// Define latitude and longitude around which to retrieve place indormation
var latitude = 51.4556
var longitude = 7.0116

//Radius defines the distance in meters which returns place results. The mazimum allowed radius is 5000 meters
var radius = 1500

//Search term or keyword which should match against all content that google has indexed for this place.
var search = "atm"

//Your appication API key identifies your application and gets results from the request or verifies the transaction
var key = "<get_your_api_key>"  // Your applications api key

let url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(latitude),\(longitude)&radius=\(radius)&type=\(search)&key=\(key)";

//Request Data using URLSession.shared.dataTask

private func getData(from url: String){
    URLSession.shared.dataTask(with: URL(string: url)! ,completionHandler: { data, task, error in
        guard let data = data, error == nil else {
            print("Something went wrong")
            return
        }
        
        // now we have the data we need to do json decoding
        
        var result: Swift?
        let jsonDEcoder = JSONDecoder()
        
        do{
            result = try
                jsonDEcoder.decode(Swift.self, from: data)
        }
        catch{
            print("Error\(error.localizedDescription)")
            
        }
        
        guard let json = result else{
            return
        }
        
       
        print(json)
        
     
    
        }).resume()
    
    
    struct Swift: Decodable{
       
        let results: [Result]
        enum CodingKeys: String, CodingKey {
            
            case results
        }
        
    }
    
    struct Result: Decodable {
        let business_status: String
        let vicinity: String
        let name: String
        let geometry: geometry
        
        
    }
   
    
        struct geometry: Decodable{
            let location: location
           
        }
                struct location: Decodable {
                        let lat: Double
                        let lng: Double
             
                        }
    
}

getData(from:url)
