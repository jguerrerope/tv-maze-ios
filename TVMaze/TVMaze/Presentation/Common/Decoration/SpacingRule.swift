import Foundation
import UIKit

public struct SpacingRule {
    
    // MARK: - Default size
    static let defaultRadius: CGFloat = 8.0
    static let defaultCardRadius: CGFloat = 10.0
    static var dividerSize: CGFloat  = 2.0
    
    // MARK: - Spaces
    private static let defaultSpace: CGFloat = 4.0
    
    static var space4: CGFloat {
        return SpacingRule.defaultSpace
    }

    static var space8: CGFloat {
        return (SpacingRule.space4 * CGFloat(2.0))
    }
    static var space12: CGFloat {
        return (SpacingRule.space4 * CGFloat(3.0))
    }
    
    static var space16: CGFloat {
        return (SpacingRule.space4 * CGFloat(4.0))
    }
    
    static var space20: CGFloat {
        return (SpacingRule.space4 * CGFloat(5.0))
    }
    
    static var space24: CGFloat {
        return (SpacingRule.space4 * CGFloat(6.0))
    }
    
    static var space28: CGFloat {
        return (SpacingRule.space4 * CGFloat(7.0))
    }
    
    static var space32: CGFloat {
        return (SpacingRule.space4 * CGFloat(8.0))
    }
    
    static var space36: CGFloat {
        return (SpacingRule.space4 * CGFloat(9.0))
    }
    
    static var space40: CGFloat {
        return (SpacingRule.space4 * CGFloat(10.0))
    }
    
    static var space44: CGFloat {
        return (SpacingRule.space4 * CGFloat(11.0))
    }
    
    static var space48: CGFloat {
        return (SpacingRule.space4 * CGFloat(12.0))
    }
}
