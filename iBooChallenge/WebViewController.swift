//
//  WebViewController.swift
//  iBooChallenge
//
//  Created by Marcos on 27/2/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {
    
    var webView                 :UIWebView!
    let utilActivityIndicator   :UtilActivityIndicator = UtilActivityIndicator()
    
    let api_key         = "API_KEY"
    let redirect_uri    = "https://api.gettyimages.com?"
    let authorize       = "https://api.gettyimages.com/oauth2/auth?"
    
    // ===================================================================================
    // MARK:                    OVERRIDE FUNC
    // ===================================================================================
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLogin()
        
        NotificationCenter.default.addObserver(self, selector: #selector(WebViewController.tokenIsSaved), name: NSNotification.Name(rawValue: tokenSaved), object: nil)
    }
    
    // ===================================================================================
    // MARK:                    WEBVIEW FUNC DELEGATES
    // ===================================================================================
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let url = request.url!
        
        if url.absoluteString.contains("#access_token") {
            let urlParts        = url.absoluteString.components(separatedBy: "#")
            let access_token    = urlParts[1].components(separatedBy: "&")[0].components(separatedBy: "=")[1]
            let token_type      = urlParts[1].components(separatedBy: "&")[1].components(separatedBy: "=")[1]
            let expires_in      = urlParts[1].components(separatedBy: "&")[2].components(separatedBy: "=")[1]
            
            // Comprobar el Access_token.
            
            saveToken(access_token, token_type, expires_in)
        }
        
        return true
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        utilActivityIndicator.startActivityIndicator(utilActivityIndicator.showActivityIndicator(view))
        if UserDefaults.standard.object(forKey: "access_token") != nil {
            utilActivityIndicator.stopActivityIndicator(self.utilActivityIndicator.actInd)
            
            self.present(InitVC(), animated: true, completion: nil)
        }
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        utilActivityIndicator.stopActivityIndicator(self.utilActivityIndicator.actInd)
    }
    
    // ===================================================================================
    // MARK:                    SUPPORT FUNC
    // ===================================================================================
    func loadLogin(){
        webView = UIWebView(frame: UIScreen.main.bounds)
        webView.delegate = self
        view.addSubview(webView)
        
        var urlAuthorize = authorize
        urlAuthorize += "client_id="+api_key
        urlAuthorize += "&response_type=token"
        urlAuthorize += "&redirect_uri=\(redirect_uri)"
        
        // Wwh-u6e-ADW-USe
        if let url = URL(string: urlAuthorize) {
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        }
    }
    
    func saveToken(_ access_token:String, _ token_type:String, _ expires_in:String) {
        UserDefaults.standard.set(access_token, forKey: "access_token")
        UserDefaults.standard.set(token_type, forKey: "token_type")
        UserDefaults.standard.set(expires_in, forKey: "expires_in")
        UserDefaults.standard.synchronize()
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: tokenSaved), object: self)
    }
    
    func tokenIsSaved() {
        NotificationCenter.default.removeObserver(self,name:NSNotification.Name(rawValue: tokenSaved),object: nil)
        if UserDefaults.standard.object(forKey: "access_token") != nil {
            utilActivityIndicator.stopActivityIndicator(self.utilActivityIndicator.actInd)
            print("Token: \(UserDefaults.standard.object(forKey: "access_token"))")
            self.present(InitVC(), animated: true, completion: nil)
        }
    }
}
