import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, CoinManagerDelegate {

    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinManager.delegate = self
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int { //numero de componentes a ser mostrado por vez
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { //conta quantos elementos existem
        return coinManager.currencyArray.count
    }
    
    func didFailWithError(error: Error) {
            print(error)
        }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? { // retorna os valores da lista
        return coinManager.currencyArray[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) { //le a informacao seleciona na lista(array)
        print(coinManager.currencyArray[row])
        let selectedCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: selectedCurrency)
        coinManager.getURL(currencyName: selectedCurrency)
    }
    
    func didUpdateCoinPrice(_ coinManager: CoinManager, coin: CoinModel){
        DispatchQueue.main.async{
            print("coin")
            print(coin.coinPrice)
            print(coin.currentCripto)
            print(coin.currentCurrency)
            print(coin.timeNow)
            
            self.currencyLabel.text = coin.currentCurrency
            self.bitcoinLabel.text = String(coin.coinPrice)
        }
    }
}

