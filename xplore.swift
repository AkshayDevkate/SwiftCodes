import Cocoa

//Code is working

// Code three

// API Endpoint
var key = "Enter your API key Here"
let urlString = "http://ieeexploreapi.ieee.org/api/v1/search/articles?abstract=Machine_learning&apikey=\()"
let url = URL(string: urlString)

let session = URLSession.shared
let dataTask = session.dataTask(with: url!){ ( data, response, error) in

    
    if error == nil && data != nil {
        
        // parse JSON
        
        let decoder = JSONDecoder()
        do{
            let Search = try decoder.decode(First.self, from: data!)
            print(Search)
            
           
            
        } catch {
            print(error)
        }
    }


struct First: Codable{

    var  total_records : Int = 0
    var  total_searched : Int = 0
   var articles: [Article]
}

struct Article : Codable{
   var pdf_url: String
    var title: String
    var abstract: String
    
    
}
 
    
}
dataTask.resume()
