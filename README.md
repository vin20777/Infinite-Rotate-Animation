# Infinite-rotate-animation
## Swift 3 Infinite Rotation Animation Practice

### Eazy to use in Swift 3

[Universiade Taipei 2017](https://www.2017.taipei/home) is an colossal and fantastic event in Taiwan.

Give some example of different usage in presenting infinite rotatate animation.

Feel free to pick one & use it!

<p align="center" >
  <img src="https://user-images.githubusercontent.com/31400661/30192677-77839fee-947b-11e7-9f5f-534875d93483.gif" width="300">
</p>

#### CABasicAnimation Infinity Style

```Swift 3
func rotate1(imageView: UIImageView, aCircleTime: Double) { //CABasicAnimation
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = -Double.pi * 2 //Minus can be Direction
        rotationAnimation.duration = aCircleTime
        rotationAnimation.repeatCount = .infinity
        imageView.layer.add(rotationAnimation, forKey: nil)
}   
```

#### UIView Closure Style

```Swift 3
func rotate2(imageView: UIImageView, aCircleTime: Double) { //UIView
        
        UIView.animate(withDuration: aCircleTime/2, delay: 0.0, options: .curveLinear, animations: {
            imageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        }, completion: { finished in
            UIView.animate(withDuration: aCircleTime/2, delay: 0.0, options: .curveLinear, animations: {
                imageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi*2))
            }, completion: { finished in
                self.rotate2(imageView: imageView, aCircleTime: aCircleTime)
            })
        })
}
```

#### Practice For Different Key Moment Customize

```Swift 3    
func rotate3(imageView: UIImageView, aCircleTime: Double) { //CAKeyframeAnimation
        
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        animation.duration = aCircleTime
        animation.fillMode = kCAFillModeForwards
        animation.repeatCount = .infinity
        animation.values = [0, Double.pi/2, Double.pi, Double.pi*3/2, Double.pi*2]
        //Percentage of each key frame
        animation.keyTimes = [NSNumber(value: 0.0), NSNumber(value: 0.1),
                              NSNumber(value: 0.3), NSNumber(value: 0.8), NSNumber(value: 1.0)]
        
        imageView.layer.add(animation, forKey: "rotate")
}
```

#### Single Circle Usage (No Infinity)

```Swift 3  
func rotate4(imageView: UIImageView, aCircleTime: Double) { //Transform (Failed to be infinite)
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(aCircleTime)
        UIView.setAnimationCurve(.linear)
        imageView.transform = imageView.transform.rotated(by: CGFloat(Double.pi))
        UIView.commitAnimations()
}
```

## Credits

This demo project is owned and maintained by the <a href="mailto:vin20777@gmail.com">vin20777</a>.

Demo Images were originally created by [Doctor KoWJ](https://www.facebook.com/DoctorKoWJ/).
