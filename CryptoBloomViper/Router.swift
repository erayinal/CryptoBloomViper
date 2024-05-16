//
//  Router.swift
//  CryptoBloomViper
//
//  Created by Eray İnal on 7.05.2024.
//

import Foundation
import UIKit

//.6 İçerisinde bütün öğeleri barındırıyor ve onları koordine ediyor                                                Uygulama açıldığında hangi ekranın gözükeceğini(EntryPoint) falan burada ayarlamamız lazım                     Class var, Protocol var


typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter{ //..6 'AnyRouter' bir syntax'tır ve genelde bu isimle kurulur
    
    var entry : EntryPoint? {get}
    static func startExecution() -> AnyRouter
    
}



class CryptoRouter : AnyRouter {
    
    var entry: EntryPoint?
    
    static func startExecution() -> any AnyRouter {
        let router = CryptoRouter()
        
        var view: AnyView = CryptoViewController()
        var presenter : AnyPresenter = CryptoPresenter()
        var interactor : AnyInteractor = CryptoInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.entry = view as? EntryPoint
        
        return router       //...6 CryptoRouter zaten bir AnyRouter o yüzden bunu return edebiliriz
        //7 Burada devam edeilmemiz için gidip 'Presenter' sınıfını kodlamamız lazım
    }
    
    
}


