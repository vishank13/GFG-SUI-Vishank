//
//  String.swift
//  GFGVishank

import Foundation

extension String {
    func getDate() -> String {
        if self.isEmpty {
            return ""
        }
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = df.date(from: self)
        df.dateFormat = "MMM d, yyyy"
        if let parsedDate = date {
            let serverDate = df.string(from: parsedDate)
            return serverDate
        }
        return ""
    }
    
    func getTime() -> String {
        if self.isEmpty {
            return ""
        }
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = df.date(from: self)
        df.dateFormat = "h:mm a"
        if let parsedDate = date {
            let serverDate = df.string(from: parsedDate)
            return serverDate
        }
        return ""
    }
}
