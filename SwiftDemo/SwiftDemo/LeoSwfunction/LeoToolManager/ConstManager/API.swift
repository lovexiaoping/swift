//
//  API.swift
//  SwiftDemo
//
//  Created by admin on 2021/4/9.
//

import Foundation


private struct API {
    static let base         = URL(string: "https://git.oschina.net/api/v3/")!
    static let host         = URL(string: "https://git.oschina.net/")!
    static let projects     = "projects"
    
    static let featured     = "projects/featured"
    static let popular      = "projects/popular"
    static let latest       = "projects/latest"
    

    static let userProjects   = "user/%lld/projects"
    static let staredProjects = "user/%lld/stared_projects"
    static let watchedProjects = "user/%lld/watched_projects"

}
