import TipKit

struct CurrencyTip: Tip {
    var title = Text("Currency Tip")
    
    var message: Text? = Text("You can tap here to change the currency")
    
    var image: Image?
}
