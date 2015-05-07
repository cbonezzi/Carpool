//
//  ClassProjects.swift
//  Carpooling
//
//  Created by Aashay on 5/2/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import Foundation

class Project {
    var name: String
    var urlString: String
    
    init(name: String, urlString: String) {
        self.name = name
        self.urlString = urlString
    }
    
}

class ClassProjects {
    var theProjects: [Project] = []
    
    init() {
        var project: Project
        project = Project(name: "Wells Fargo", urlString: "https://m.wellsfargo.com/mba/")
        theProjects.append(project)
        project = Project(name: "Bank of America", urlString: "https://www.bankofamerica.com/mobile/banking.go")
        theProjects.append(project)
        project = Project(name: "Chase Bank", urlString: "https://mobilebanking.chase.com/Public/Home/LogOn?qp_landing=False")
        theProjects.append(project)
        project = Project(name: "Citibank", urlString: "https://online.citibank.com/US/Welcome.c")
        theProjects.append(project)
        project = Project(name: "Hills Bank", urlString: "https://www.hillsbank.com/p-online-mobile.htm")
        theProjects.append(project)
        project = Project(name: "US Bank", urlString: "https://m.usbank.com/mobile-web/index.asp?msg=")
        theProjects.append(project)

        project = Project(name: "HSBC", urlString: "https://www.security.us.hsbc.com/gsa/SaaS30Resource/")
        theProjects.append(project)

        project = Project(name: "Capital One Bank", urlString: "https://m.capitalone.com/worklight/apps/services/www/EnterpriseMobileBanking/mobilewebapp/default/EnterpriseMobileBanking.html#www")
        theProjects.append(project)

        project = Project(name: "Bank of the West", urlString: "https://www.bankofthewest.com/personal-banking/mobile-banking/mobile-web.html")
        theProjects.append(project)

    }
    
    func numberOfProjects() -> Int {
        return theProjects.count
    }
    
    func projectNameForIndex(index: Int) -> String {
        let project: Project = theProjects[index]
        return project.name
    }
    
    
    func projectURLForIndex(index: Int) -> String {
        let project: Project = theProjects[index]
        return project.urlString
    }
}
