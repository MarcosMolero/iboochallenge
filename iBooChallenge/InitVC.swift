//
//  InitVC.swift
//  iBooChallenge
//
//  Created by Marcos on 22/2/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import UIKit

class InitVC: UIViewController, InitViewDelegate {
    
    let screenW :CGFloat = UIScreen.main.bounds.width
    let screenH :CGFloat = UIScreen.main.bounds.height
    
    let utilActivityIndicator: UtilActivityIndicator = UtilActivityIndicator()
    
    // ===================================================================================
    // MARK:                    DRAW SCREEN
    // ===================================================================================
    func drawScreen() {
        let initView = InitView(frame: CGRect(x: 0, y: 0, width: screenW, height: screenH))
        initView.delegate = self
        
        self.view.addSubview(initView)
    }
    
    // ===================================================================================
    // MARK:                    BUTTON FUNC
    // ===================================================================================
    func didPressBtnInit(_ sender: UIButton) {
        print("Tapped")
        utilActivityIndicator.startActivityIndicator(utilActivityIndicator.showActivityIndicator(view))
        OAuthCommunication.getImagesAlamofire()
        
        NotificationCenter.default.addObserver(self, selector: #selector(InitVC.connectionError), name: NSNotification.Name(rawValue: connectionFailure), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(InitVC.dataIsAvailable), name: NSNotification.Name(rawValue: dataOk), object: nil)
    }
    
    // ===================================================================================
    // MARK:                    SUPPORT FUNC
    // ===================================================================================
    func dataIsAvailable() {
        NotificationCenter.default.removeObserver(self,name:NSNotification.Name(rawValue: dataOk),object: nil)
        self.utilActivityIndicator.stopActivityIndicator(self.utilActivityIndicator.actInd)

        print("DataAvailable")
        
        self.present(ListVC(), animated: true, completion: nil)
    }
    
    func connectionError() {
        NotificationCenter.default.removeObserver(self,name:NSNotification.Name(rawValue: connectionFailure),object: nil)
        self.utilActivityIndicator.stopActivityIndicator(self.utilActivityIndicator.actInd)

        print("ConnectionError")
    }
    
    // ===================================================================================
    // MARK:                    OVERRIDE FUNC
    // ===================================================================================
    override func viewDidLoad() {
        super.viewDidLoad()
        drawScreen()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
