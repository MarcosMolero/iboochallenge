//
//  ListVC.swift
//  iBooChallenge
//
//  Created by Marcos Molero on 25/2/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

class ListVC :UIViewController, TopViewDelegate, ListViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    let screenW :CGFloat = UIScreen.main.bounds.width
    let screenH :CGFloat = UIScreen.main.bounds.height
    
    var listView    :ListView = ListView()
    
    let instanceAppSingleton = AppSingleton.sharedInstance
    
    // ===================================================================================
    // MARK:                    DRAW SCREEN
    // ===================================================================================
    func drawScreen() {
        
        let topViewW    :CGFloat = screenW
        let topViewH    :CGFloat = screenH*0.1
        let topViewX    :CGFloat = 0
        let topViewY    :CGFloat = 0
        
        let topView     :TopView = TopView(frame: CGRect(x: topViewX, y: topViewY, width: topViewW, height: topViewH))
        topView.delegate = self
        topView.label.text = "iBooChallenge"
        
        let listViewW   :CGFloat = screenW
        let listViewH   :CGFloat = screenH*0.9
        let listViewX   :CGFloat = topViewX
        let listViewY   :CGFloat = topViewY + topViewH
        
        listView        = ListView(frame: CGRect(x: listViewX, y: listViewY, width: listViewW, height: listViewH))
        listView.delegate = self
        listView.tableView.delegate = self
        listView.tableView.dataSource = self

        self.view.addSubview(topView)
        topView.addSubview(topView.label)
        self.view.addSubview(listView)
        listView.addSubview(listView.tableView)
    }
    
    
    // ===================================================================================
    // MARK:                    BUTTON FUNC
    // ===================================================================================
    func didPressBtnLeft(_ button: UIButton) {
        //
    }
    
    // ===================================================================================
    // MARK:                    TABLE VIEW FUNC
    // ===================================================================================
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listView.tableView.dequeueReusableCell(withIdentifier: "ListViewTableViewCell") as! ListViewTableViewCell
       
        let listOfImages = instanceAppSingleton.element[0].images
//        print("\(indexPath.row) " + "\(listOfImages[indexPath.row].display_sizes[0].uri)")
        
//        let imageUrl :URL = URL(string: "http://cache3.asset-cache.net/xt/613254526.jpg?v=1&g=fs1|0|EPL|54|526&s=1&b=RjI4")!
        //cell.photo.image = nil
        cell.photo.af_setImage(withURL: URL(string: "https://httpbin.org/image/png")!)
        cell.label.text = listOfImages[indexPath.row].title
        cell.fav.addTarget(self, action: #selector(switchChanged(_:)), for: UIControlEvents.valueChanged)
        cell.fav.tag = indexPath.row

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tapped")
        self.present(DetailVC(), animated: true, completion: nil)
    }
    
    func switchChanged(_ sender:UISwitch) {
        print("Changed \(sender.tag) !!")
        let listOfImages = instanceAppSingleton.element[0].images
        listOfImages[sender.tag].switched = true
        
    }
    
    // ===================================================================================
    // MARK:                    OVERRIDE FUNC
    // ===================================================================================
    override func viewDidLoad() {
        super.viewDidLoad()
        drawScreen()
        
        
//        OAuthCommunication.downloadImageAlamofire(id: "529992109")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }  
}
