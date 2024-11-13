//
//  AppViewsService.swift
//  Fighting Fantasy Tracker
//
//  Created by Mike Hall on 07/10/2024.
//

//import Foundation
//import SwiftUI
//
///**
// *
// * AppViewsService - determines the app's state including bottom tabs, any alerts or spinners to be shown etc
// *
// */
//@Observable
//public class AppViewsService {
//    @MainActor static let shared = AppViewsService()
//    
//   public var showAlert = false
//    public var showSpinner = false
//
//    public var overlay: (any View)? = nil
//
//    public var alertItem: Alert? = nil
//    
//    func setBadgeCount(count: Int) {
//        if #available(iOS 16.0, *) {
//            UNUserNotificationCenter.current().setBadgeCount(count)
//        }
//    }
//    
//    public func spin(_ value: Bool) {
//            showSpinner = value
//    }
//
//    func alertView() -> Alert {
//        if let alertItem {
//            return alertItem
//        } else {
//            return Alert(title: Text("FF Tracker"),
//                         message: Text("An unknown error has occurred"),
//                         dismissButton: .default(Text("OK")){
//                self.dismissAlert()
//            }
//            )
//        }
//    }
//
//    func alert(title: String?, body: String){
//        alertItem = Alert(title: Text(title ?? "FF Tracker"), message: Text(body), dismissButton: .default(Text("OK")){
//            self.dismissAlert()
//        })
//        showAlert = true
//    }
//
//    func alert(body: String){
//            self.alertItem = Alert(title: Text("FF Tracker"), message: Text(body), dismissButton: .default(Text("OK")){
//            self.dismissAlert()
//        })
//        showAlert = true
//    }
//    
//    func alert(title: String?, body: String, positiveText: String? = nil, negativeText: String? = nil, negativeAction: (() -> Void)? = nil, positiveAction:@escaping () -> Void){
//
//        if let negativeAction {
//            alertItem = Alert(title: Text(title ?? "FF Tracker"), message: Text(body), primaryButton: .default(Text(positiveText ?? "OK")){
//                positiveAction()
//            }  , secondaryButton: .cancel(Text(negativeText ?? "Cancel")){
//                negativeAction()
//            })
//        } else {
//            alertItem = Alert(title: Text(title ?? "FF Tracker"), message: Text(body), dismissButton: .default(Text(positiveText ?? "OK")){
//                positiveAction()
//            })
//        }
//        showAlert = true
//    }
//
//    func alert(alert: Alert) {
//        alertItem = alert
//        showAlert = true
//    }
//
//    func dismissAlert(){
//        alertItem = nil
//    }
//    
//   
//}
