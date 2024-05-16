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
    var presenter : AnyPresenter?{get set}
    
    func update(with cryptos: [Crypto])
    func update(with error: String)
    
}


class CryptoViewController : UIViewController, AnyView, UITableViewDelegate, UITableViewDataSource{ //..9 Önce UIViewController'ı sonra AnyView'ı protocol olarak almalıyız, sıra önemli
    //12:
    var presenter : AnyPresenter?
    
    var cryptos: [Crypto] = []
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.isHidden = true
        return table
    }()
    
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.isHidden = false
        label.text = "Downloading..."
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = cryptos[indexPath.row].currency
        content.secondaryText = cryptos[indexPath.row].price
        cell.contentConfiguration = content
        cell.backgroundColor = .yellow

        return cell
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        messageLabel.frame = CGRect(x: view.frame.width/2-100, y: view.frame.height/2-25, width: 200, height: 50)
    }
    
    
    func update(with cryptos: [Crypto]) {
        DispatchQueue.main.async {
            self.cryptos = cryptos
            self.messageLabel.isHidden = true
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
    
    func update(with error: String) {
        DispatchQueue.main.async {
            self.cryptos = []
            self.tableView.isHidden = true
            self.messageLabel.text = error
            self.messageLabel.isHidden = false
        }
    }
    
}
//10 Şimdi Presenter içerisine geri dönelim ve devam edelim
