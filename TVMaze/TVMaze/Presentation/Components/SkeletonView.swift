import Foundation
import UIKit

public class SkeletonView: UIView {
    
    private var startLocations: [NSNumber] = [-1.0, -0.5, 0.0]
    private var endLocations: [NSNumber] = [1.0, 1.5, 2.0]
    
    private var gradientBackgroundColor: CGColor = AppColor.lightMidnightBlue.cgColor
    private var gradientMovingColor: CGColor = AppColor.sand30.cgColor
    
    private var movingAnimationDuration: CFTimeInterval = 0.8
    private var delayBetweenAnimationLoops: CFTimeInterval = 1.0
    
    private var gradientLayer: CAGradientLayer?
    private var hasMaskViews: Bool = false
    private var delayStartToDraw: Bool = false
    
    private(set) var playing: Bool = false
    
    public init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if delayStartToDraw {
            setSubviewsAsMasking()
            startSkeletonAnimating()
            delayStartToDraw = false
        }
    }
    
    public override func didMoveToWindow() {
        super.didMoveToWindow()
        
        if self.window != .none {
            if !playing {
                startSkeletonAnimating()
            }
        } else {
            stopSkeletonAnimating()
        }
    }
    
    private func startSkeletonAnimating() {
        if playing {
            return
        }
        
        setSubviewsAsMasking()
        
        if !hasMaskViews {
            delayStartToDraw = true
        } else if let gradientLayer = self.gradientLayer {
            adddAnimation(to: gradientLayer)
            
        } else {
            let newGradientLayer = createGradientLayer()
            
            self.layer.addSublayer(newGradientLayer)
            adddAnimation(to: newGradientLayer)
            
            self.gradientLayer = newGradientLayer
            playing = true
        }
        
    }
    
    private func stopSkeletonAnimating() {
        playing = false
        gradientLayer?.removeAllAnimations()
    }
    
    private func setSubviewsAsMasking() {
        for view in subviews {
            let size = view.frame.size
            if size.width == 0 || size.height == 0 {
                hasMaskViews = false
                return
            }
        }
        setMaskingViews(subviews)
    }
    
    private func setMaskingViews(_ views: [UIView]) {
        let mutablePath = CGMutablePath()
        
        //Append path for each subview
        for view in views {
            //Check if ellipse
            let conerRadiusInt = Int(view.layer.cornerRadius)
            let circleRadiusInt = Int(view.frame.size.height / 2)
            
            if conerRadiusInt == circleRadiusInt, view.layer.masksToBounds {
                //Ellipse
                mutablePath.addEllipse(in: view.frame)
            } else {
                //Rect
                mutablePath.addRect(view.frame)
            }
        }
        
        hasMaskViews = true
        //Create layer
        let maskLayer = CAShapeLayer()
        maskLayer.path = mutablePath
        
        //Apply layer as a mask
        self.layer.mask = maskLayer
    }
    
    private func createGradientLayer() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.colors = [
            gradientBackgroundColor,
            gradientMovingColor,
            gradientBackgroundColor
        ]
        gradientLayer.locations = self.startLocations
        
        return gradientLayer
    }
    
    private func adddAnimation(to gradientLayer: CAGradientLayer) {
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = self.startLocations
        animation.toValue = self.endLocations
        animation.duration = self.movingAnimationDuration
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = self.movingAnimationDuration + self.delayBetweenAnimationLoops
        animationGroup.animations = [animation]
        animationGroup.repeatCount = .infinity
        
        gradientLayer.add(animationGroup, forKey: animation.keyPath)
    }
}
