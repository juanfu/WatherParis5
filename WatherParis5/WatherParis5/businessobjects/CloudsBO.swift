//
//  CloudsBO.swift
//  WatherParis5
//
//  Created by juanfu on 23/10/22.
//

import Foundation

struct CloudsBO {
    let all: Int
}

extension CLoudsObject {
    func toBO() -> CloudsBO {
        return CloudsBO(all: self.all)
    }
}
