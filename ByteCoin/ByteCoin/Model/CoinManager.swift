
import Foundation

protocol CoinManagerDelegate{
    func didUpdateCoinPrice(_ coinManager: CoinManager, coin: CoinModel)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "00D9D43F-4C8F-4926-B1E0-C5DD73C31D2E"
    
    var delegate: CoinManagerDelegate?
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String){
        //print("here \(currency)")
    }
    
    func getURL(currencyName: String){
        let urlString = "\(baseURL)/\(currencyName)?apikey=\(apiKey)"
        perfomanceRequest(with: urlString)
    }
    
    func perfomanceRequest(with urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data{
                    if let price = self.parseJSON(coinData: safeData) {
                        self.delegate?.didUpdateCoinPrice(self, coin: price)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(coinData: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(CoinData.self, from: coinData)
            let actualCoinPrice = decodeData.rate
            let actualCripto = decodeData.asset_id_base
            let actualCurrency = decodeData.asset_id_quote
            let actualTime = decodeData.time
            let actualData = CoinModel(coinPrice: actualCoinPrice, currentCripto: actualCripto, currentCurrency: actualCurrency, timeNow: actualTime)
            return actualData
        } catch {
            print(error)
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}

// o codigo esta pegando o preco da moeda, continuar dessa parte. Agora a moeda escolhida deve vir dos controles de selecao e o preco atualizado abaixo
