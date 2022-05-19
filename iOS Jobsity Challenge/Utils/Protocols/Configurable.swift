//
//  Configurable.swift
//  iOS Jobsity Challenge
//
//  Created by Cristian Carlassare on 18/05/2022.
//


import UIKit

// Configurable Cell
typealias ConfigurableTableViewCell = UITableViewCell & Configurable
typealias ConfigurableTableViewHeaderFooterView = UITableViewHeaderFooterView & Configurable


protocol Configurable {
    associatedtype T
    
    var model: T? { get set }
    func config(object: T)
}
