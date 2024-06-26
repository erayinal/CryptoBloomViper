//
//  Presenter.swift
//  CryptoBloomViper
//
//  Created by Eray İnal on 8.05.2024.
//

import Foundation

//.7 Neredeyse herkesle(Interactor, Router, View) iltişim halinde
//..7 Class ve protocol var

protocol AnyPresenter {
    
    //...7 Presenter bildiğimiz gibi Interactor, Router, View ile iletişim kuruyor ama Router dışında diğer dosyaların içini daha doldurmadık:
    //8 O yüzden şimdi önce Interactor sonra da View içerisine gidip o dosyaları dolduralım
    
    var router : AnyRouter? {get set} //.10 get demek sadece okumak demek set demek değiştirebilmek demek biz ikisini de yapacğımız için get set olarak ayarlıyoruz
    var interactor : AnyInteractor? {get set}
    var view : AnyView? {get set}
    
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>) //..10 Mesela interactor'da Crypto paraları download ettiğimizde Presenter'a şunu dememiz lazım: 'Git View'a söyle kendini güncellesin çünkü yeni veri geldi bana'. İşte bunu yapabilmek için bu fonksiyonu yazıyoruz.
}



class CryptoPresenter : AnyPresenter {
    var router: (any AnyRouter)?
    
    var interactor: (any AnyInteractor)?{
        didSet{
            interactor?.downloadCryptos()
        }
    }
    
    
    var view: (any AnyView)?
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], any Error>) {
        //...10 Şimdi burada bu fonksiyon çalıştığına göre Crypto indirilmiş olacak ve biz ne yapıcaz? View'a kendini güncellemesini söyleyeceğiz ama şuan View içerisinde fonksiyonu yazmadığımız için yazamıyoruz, View'da fonksiyonu yazınca buraya gelip bu fonksiyonun içerisini dolduracağız
        //11 Şimdi Interactor içerisine gidelim
        
        switch result {
        case.success(let cryptos):
            view?.update(with: cryptos)
        case.failure(_):
            view?.update(with: "Try Again Later...")
        }
        
    }
    
    
}

