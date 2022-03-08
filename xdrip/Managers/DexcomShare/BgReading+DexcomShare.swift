import Foundation

extension BgReading {
    
    /// dictionary representation for upload to Dexcom Share
   public var dictionaryRepresentationForDexcomShareUpload: [String: Any] {
    
    // date as expected by Dexcom Share
    let date = "/Date(" + Int64(floor(timeStamp.toMillisecondsAsDouble() / 1000) * 1000).description + ")/"
    
    let trendmap = [0 : "", 1 :"DoubleUp", 2 : "SingleUp", 3 : "FortyFiveUp", 4 : "Flat", 5 : "FortyFiveDown", 6 : "SingleDown", 7 : "DoubleDown"]
     
    let trendtext = trendmap[slopeOrdinal(), default: "NotComputable"]
       
    let newReading: [String : Any] = [
        "Trend" : trendtext,
        "ST" : date,
        "DT" : date,
        "Value" : round(calculatedValue),
        "direction" : slopeName
        ]
    
    return newReading
    
    }
     
}
