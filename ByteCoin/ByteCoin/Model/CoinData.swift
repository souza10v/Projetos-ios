import Foundation

struct CoinData: Decodable{
    let rate : Float
    let time : String
    let asset_id_base : String
    let asset_id_quote : String
}
