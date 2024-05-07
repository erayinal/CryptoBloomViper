//
//  View.swift
//  CryptoBloomViper
//
//  Created by Eray İnal on 7.05.2024.
//


//1 VIPER nedir? Açılımı: View-Interactor-Presenter-Entity-Router
//.1 MVVM gibi bir mimaridir.
//..1 Router: Bu yapının birbiri içerisinde gezinmesini sağlayan bir sınıftır                      Presenter: Interactor ve router'dan aldığı verileri view yani görünüm tarafına iletme ve koordinasyon     Interactor: MVVM'deki ViewModal'a benzetilebilir. Yapılacak işleri yapan sınıftır, bussiness logic       Entity: Bizim modelimiz yani class ya da struct'ımız. Bu zaten ne kullanırsak kullanalım ister MVVM ister Viper bunun zaten olması lazım.

//2 Viper ile çalışırken modül modül çalışılır. Kaç tane ekran varsa o kadar modül oluşturulur
//3 Main'i direkt siliyoruz, tüm yasarım kod ile yapılacak

import Foundation
