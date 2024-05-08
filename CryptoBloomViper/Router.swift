//
//  Router.swift
//  CryptoBloomViper
//
//  Created by Eray İnal on 7.05.2024.
//

import Foundation

//.6 İçerisinde bütün öğeleri barındırıyor ve onları koordine ediyor                                                Uygulama açıldığında hangi ekranın gözükeceğini(EntryPoint) falan burada ayarlamamız lazım                     Class var, Protocol var


protocol AnyRouter{ //..6 'AnyRouter' bir syntax'tır ve genelde bu isimle kurulur
    
    static func startExecution() -> AnyRouter
    
}



class CryptoRouter : AnyRouter {
    
    static func startExecution() -> any AnyRouter {
        let router = CryptoRouter()
        return router       //...6 CryptoRouter zaten bir AnyRouter o yüzden bunu return edebiliriz
        //7 Burada devam edeilmemiz için gidip 'Presenter' sınıfını kodlamamız lazım
    }
    
    
}


