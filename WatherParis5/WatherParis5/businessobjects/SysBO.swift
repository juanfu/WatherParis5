//
//  SysBO.swift
//  WatherParis5
//
//  Created by juanfu on 23/10/22.
//

import Foundation

struct SysBO {
    let pod: String
}

extension SysObject {
    func toBO() -> SysBO {
        return SysBO(pod: self.pod)
    }
}
