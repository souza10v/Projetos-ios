import Foundation

protocol WeatherManagerDelegate{ //codigo principal que le a api, faz as verificacoes e envia para viewcontroller
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=3c8246aef52cf04bd4496b934b9ca273&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func fetchWeatherLocation(latitute: Double, longitude: Double){
        let latRound = String(format: "%.1f", latitute)
        let longRound = String(format: "%.1f", longitude)
        let urlString = "\(weatherURL)&lat=\(latRound)&lon=\(longRound)"
        performRequest(with: urlString)
    }
    
    //lendo dados fornecidos pela api de maneira geral
    func performRequest(with urlString: String){
        //1. Create URL
        if let url = URL(string: urlString){
        //2. Create a URLSession
        let session = URLSession(configuration: .default)
        //3. Give the session task
            let task = session.dataTask(with: url) {data, response, error in
                if error != nil{
                    delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    //let dataString = String(data:safeData, encoding: .utf8)
                    if let weather = self.parseJSON(safeData){ //chamando parsejson que separa os dados da api
                        self.delegate?.didUpdateWeather(self, weather: weather) //enviar dados para tela principal// self porque se refere a classe acima
                    }
                }
            }
        //let task = session.dataTask(with: url, completionHandler: handle(data: response: error: ))
        //4. Stark the task
        task.resume()
        }
    }
    //dados da api lidos separadamente 
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
           let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            //print(decodeData.name)
            //print(decodedData.main.temp)
            //print(decodedData.weather[0].description)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
            //print(temp)
            //print(weather.conditionName)
            //print(weather.temperatureString)
            return weather
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    

}
