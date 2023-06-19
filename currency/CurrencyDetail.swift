//
//  CurrencyDetail.swift
//  currency
//
//  Created by Roman Dovgii on 6/16/23.
//

import SwiftUI
import Alamofire

struct CurrencyDetail: View {
    @State var currencyList = [String]()
    
    var money: String
    
    var body: some View {
        VStack() {
            Text(money.prefix(3))
            AsyncImage(url: URL(string: "https://flagsapi.com/\(money.prefix(2))/flat/64.png"))
            
            List {
                ForEach(currencyList, id: \.self) { currency in
                    Text(currency)
                }
            }
            .scrollContentBackground(.hidden)
            
        }
        .background(Color.background)
        .onAppear() {
            Task {
                await makeRequest(showAll: true)
            }
        }
    }
    
    private func makeRequest(
        showAll: Bool = false,
        currencies: [String] = ["USD", "RUB", "EUR", "JPY", "GBP", "AUD", "CAD", "CHF", "CNH", "CZK"]
    ) async {
        do {
            let request = try await apiRequest(url: "https://api.exchangerate.host/latest?base=\(money.prefix(3))&amount=\(1)")
            var tempList = [String]()
            
            for currency in request.rates {
                
                if showAll {
                    tempList.append("\(currency.key) \(String(format: "%.2f",currency.value))")
                } else if currencies.contains(currency.key)  {
                    tempList.append("\(currency.key) \(String(format: "%.2f",currency.value))")
                }
                tempList.sort()
            }
            currencyList = tempList
        } catch {
            VStack {
                Text("Error")
                Text(error.localizedDescription)
            }
        }
    }
}

struct CurrencyDetail_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyDetail(money: "None")
    }
}
