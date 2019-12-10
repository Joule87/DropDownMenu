//
//  Colors.swift
//  DropDownMenu
//
//  Created by Julio Collado on 12/10/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

enum Colors: Int, CaseIterable {
    case Purple, Black, Pink
    
    var description: String {
        switch self {
        case .Purple:
            return "Purple"
        case .Black:
            return "Black"
        case .Pink:
            return "Pink"
        }
    }
    
    var color: UIColor {
        switch self {
            
        case .Purple:
            return .purple
        case .Black:
            return .black
        case .Pink:
            return .systemPink
        }
    }
}
