//
//  ViewModelDelegate.swift
//  iOS Jobsity Challenge
//
//  Created by Cristian Carlassare on 18/05/2022.
//

import Foundation


protocol ViewModelDelegate: AnyObject {
    
    func updateWithResults<ResultType>(result: ResultType)
    func handleError(error: LocalizedError?)
}
