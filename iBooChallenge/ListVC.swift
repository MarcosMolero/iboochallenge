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

        cell.photo.af_setImage(withURL: getCorrectURLFrom(imageString: listOfImages[indexPath.row].display_sizes[0].uri))
        
        cell.label.text = listOfImages[indexPath.row].title
        
        cell.fav.addTarget(self, action: #selector(switchChanged(_:)), for: UIControlEvents.valueChanged)
        cell.fav.tag = indexPath.row
        
        if listOfImages[indexPath.row].switched {
            cell.fav.setOn(true, animated: false)
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.present(DetailVC(), animated: true, completion: nil)
    }
    
    // ===================================================================================
    // MARK:                    SUPPORT FUNC
    // ===================================================================================
    func switchChanged(_ sender:UISwitch) {
        let listOfImages = instanceAppSingleton.element[0].images
        listOfImages[sender.tag].switched = true
    }
    
    func getCorrectURLFrom(imageString:String) -> URL {
        let escapedString = imageString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        let url :URL = URL(string: escapedString!)!
        
        return url
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
