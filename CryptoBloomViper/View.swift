//
//  View.swift
//  CryptoBloomViper
//
//  Created by Eray İnal on 7.05.2024.
//


//0         Router                                                                                                                                               ⬍                                                                                                                                      View ⬌ Presenter                                                                                                                                             ⬍                                                                                                                                             Interactor ⬌ CoreData Service/Network Service ⬌ Entity


//1 VIPER nedir? Açılımı: View-Interactor-Presenter-Entity-Router
//.1 MVVM gibi bir mimaridir.
//..1 Router: Bu yapının birbiri içerisinde gezinmesini sağlayan bir sınıftır                      Presenter: Interactor ve router'dan aldığı verileri view yani görünüm tarafına iletme ve koordinasyon     Interactor: MVVM'deki ViewModal'a benzetilebilir. Yapılacak işleri yapan sınıftır, bussiness logic       Entity: Bizim modelimiz yani class ya da struct'ımız. Bu zaten ne kullanırsak kullanalım ister MVVM ister Viper bunun zaten olması lazım.

//2 Viper ile çalışırken modül modül çalışılır. Kaç tane ekran varsa o kadar modül oluşturulur
//3 Main'i direkt siliyoruz, tüm yasarım kod ile yapılacak. ViewController'da siliyoruz kendi sayfamızı kullanacağız.
//.3 Bunları silmek uygulama ayarlarında sıkıntı çıkartabilir, o  yüzden 'Info'ya gidip oradan 'Item 0' altında 'Storyboard Name' yazan satırı da silmemiz gerekiyor. Bir de yanda proje ismine tıklayarak proje ayarlarına gidiyoruz. İşte şuan mimari tamam sadece zamanla AppDelegate ve SceneDelegate sınıfınlarında da hata çıkmasın diye bazı ayarlamalar yapmamız gerekecek, o kadar.

//4 Şimdi kodlamaya geçelim
//.4 View nedir? Kullanıcının göreceği şeyler bulunan sınıftır. View bildiğimiz gibi 'Presenter' ile iletişim halinde olacak. Class ve Protocol kullanacağız, içerisinde ViewController olacak.

//5 Şimdi Entity içerine gidip orayı kodlayalım

import Foundation
import UIKit //.9

protocol AnyView {
    
}


class CryptoViewController : UIViewController, AnyView{  //..9 Önce UIViewController'ı sonra AnyView'ı protocol olarak almalıyız, sıra önemli
    
}
//10 Şimdi Presenter içerisine geri dönelim ve devam edelim
