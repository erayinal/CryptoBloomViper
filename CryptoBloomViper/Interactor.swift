//
//  Interactor.swift
//  CryptoBloomViper
//
//  Created by Eray İnal on 7.05.2024.
//

import Foundation


//.8 'Presenter' ile iletişim halinde olacak
//..8 İçerisinde Class olacak Protocol olacak. Ana işler burada olacak, gitHub'tan indireceğimiz verileri de buradan indireceğiz yani cryprolar burada indirilecek

protocol AnyInteractor{
    //.11:
    var presenter : AnyPresenter? {get set}
    
    func downloadCryptos()
}


enum NetworkError : Error {
    case NetworkFailed
    case ParsingFailed
}

class CryptoInteractor : AnyInteractor{
    var presenter: AnyPresenter?
    
    func downloadCryptos() {
        guard let url = URL(string:"raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")
        else{
            self.presenter?.interactorDidDownloadCrypto(result: .failure(NetworkError.NetworkFailed))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil
            else{
                return
            }
            
            do{
                let cryptos = try JSONDecoder().decode([Crypto].self, from: data)
                self?.presenter?.interactorDidDownloadCrypto(result: .success(cryptos))
            }catch{
                self?.presenter?.interactorDidDownloadCrypto(result: .failure(NetworkError.ParsingFailed))
            }
        }
        task.resume()
    }
    
    
}

//9 Şimdi View içerisine gidelim ve orayı dolduralım
    
