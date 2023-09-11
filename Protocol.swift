//
//  ListProtocol.swift
//  VIPER
//
//  Created by Aravind on 11/09/23.
//

import Foundation
import UIKit

// MARK: VIPER - Protocol for single V I P E R. 🐍

protocol PresenterProtocol: AnyObject{
    var view: ViewProtocol? {get set}
    var interactor: InteractorProtocol? {get set}
    var router: RouterProtocol? {get set}
}

protocol ViewProtocol: AnyObject{
    func updateUI<Model>(array: Array<Model>)
    func showError(_ error: AppError)
}

protocol RouterProtocol: AnyObject {
    static func createModule()
    func pushToScreen(viewControllerID: String, navigationConroller: UINavigationController)
    func performSegue(segueID: String)
}

protocol InteractorProtocol: AnyObject {
    var presenter: PresenterProtocol? {get set}
    func fetchData()
}

// MARK: Delegates
protocol InteractoDelegate: AnyObject {
    func fetchDataSuccess<Model>(noticeModelArray:Array<Model>)
    func fetchDataFailed(_ error: InteractorError)
}

// MARK: Error
enum InteractorError: Error {
    case internet(String)
    case runTime(String)
    case dataCorrupted(String)
    case unknown(String)
}

// Common App Error
enum AppError: Error {
    case memory(String)
    case runTime(String)
    case internet(String)
    case custom(String)
    case permission(String)
    case unknown(String)
}
