//
//  ViewController.swift
//  AnimationLogin
//
//  Created by Glaphi on 04/01/2018.
//  Copyright © 2018 Glaphi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let backgroundImageView: UIImageView = {
        let imgView: UIImageView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.image = #imageLiteral(resourceName: "bg-sunny")
        return imgView
    }()
    
    let cloudImageView1: UIImageView = {
        let imgView: UIImageView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.image = #imageLiteral(resourceName: "bg-sunny-cloud-1")
        return imgView
    }()
    
    let cloudImageView2: UIImageView = {
        let imgView: UIImageView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.image = #imageLiteral(resourceName: "bg-sunny-cloud-2")
        return imgView
    }()
    
    let cloudImageView3: UIImageView = {
        let imgView: UIImageView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.image = #imageLiteral(resourceName: "bg-sunny-cloud-3")
        return imgView
    }()
    
    let cloudImageView4: UIImageView = {
        let imgView: UIImageView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.image = #imageLiteral(resourceName: "bg-sunny-cloud-4")
        return imgView
    }()
    
    let header: UILabel = {
        let label: UILabel = UILabel()
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 40)
        label.text = "Banana Login"
        return label
    }()
    
    let usernameTextField: UITextField = {
        let txtField: UITextField = UITextField()
        txtField.placeholder = " Username"
        txtField.backgroundColor = UIColor.white
        return txtField
    }()
    
    let passwordTextField: UITextField = {
        let txtField: UITextField = UITextField()
        txtField.placeholder = " Password"
        txtField.backgroundColor = UIColor.white
        return txtField
    }()
    
    let loginButton: UIButton = {
        let btn: UIButton = UIButton()
        btn.backgroundColor = UIColor.green
        btn.setTitle("Log In", for: .normal)
        btn.setTitleColor(UIColor.brown, for: .normal)
        btn.tag = -1
        btn.addTarget(self, action: #selector(moveClouds(button:)), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubviews(backgroundImageView, cloudImageView1, cloudImageView2, cloudImageView3, cloudImageView4)
        view.addSubviews(header, usernameTextField, passwordTextField,loginButton)
        
        usernameTextField.layer.cornerRadius = 5
        usernameTextField.clipsToBounds = true
        
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.clipsToBounds = true
        
        loginButton.layer.cornerRadius = 5
        loginButton.clipsToBounds = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let width: CGFloat = 3*view.bounds.width/4
        let height: CGFloat = max(view.bounds.height/20, 25)
        let heightBig: CGFloat = max(view.bounds.height/15, 35)
        let heightCloud: CGFloat = max(view.bounds.height/10, 50)
        let xOffset: CGFloat = view.center.x - (width/2)
        var yOffset: CGFloat = view.bounds.height/7
        let gap: CGFloat = view.bounds.height/35
        
        let sizeCloud: CGSize = CGSize(width: view.bounds.width/3, height: heightCloud)
        let originCloud1: CGPoint = view.center
        let originCloud2: CGPoint = CGPoint(x: view.center.x - sizeCloud.width, y: 2 * view.bounds.height/3)
        let originCloud3: CGPoint = CGPoint(x: view.bounds.width/50, y: view.bounds.height/30)
        let originCloud4: CGPoint = CGPoint(x: view.bounds.width - sizeCloud.width, y: view.center.y + view.bounds.height/6)
        
        backgroundImageView.frame = view.bounds
        cloudImageView1.frame = CGRect(origin: originCloud1, size: sizeCloud)
        cloudImageView2.frame = CGRect(origin: originCloud2, size: sizeCloud)
        cloudImageView3.frame = CGRect(origin: originCloud3, size: sizeCloud)
        cloudImageView4.frame = CGRect(origin: originCloud4, size: sizeCloud)
        
        header.frame = CGRect(x: xOffset, y: yOffset, width: width, height: heightBig)
        yOffset += header.frame.height + gap
        
        usernameTextField.frame = CGRect(x: xOffset, y: yOffset, width: width, height: height)
        yOffset += usernameTextField.frame.height + gap/3
        
        passwordTextField.frame = CGRect(x: xOffset, y: yOffset, width: width, height: height)
        yOffset += passwordTextField.frame.height + gap
        
        loginButton.frame = CGRect(x: xOffset, y: yOffset, width: width, height: heightBig)
        yOffset += loginButton.frame.height + gap
        
        header.center.x  -= view.bounds.width
        usernameTextField.center.x -= view.bounds.width
        passwordTextField.center.x -= view.bounds.width
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        animateSubviews()
    }
    
    func animateSubviews() {
        UIView.animate(withDuration: 0.8) {
            self.header.center.x += self.view.bounds.width
        }
        UIView.animate(withDuration: 0.5) {
            self.usernameTextField.center.x += self.view.bounds.width
        }
        UIView.animate(withDuration: 0.3) {
            self.passwordTextField.center.x += self.view.bounds.width
        }
    }
    
    @objc func moveClouds(button: UIButton) {
        
        let isOnRepeat: () -> Bool = {
            return (button.tag % 2) == 0
        }
        
        if (button.tag % 2) != 0 {
            cloudImageView1.moveEdgeToEdge(duration: 2, direction: .right, isOnRepeat: isOnRepeat)
            cloudImageView2.moveEdgeToEdge(duration: 3, direction: .left, isOnRepeat: isOnRepeat)
            cloudImageView3.moveEdgeToEdge(duration: 5, direction: .left, isOnRepeat: isOnRepeat)
            cloudImageView4.moveEdgeToEdge(duration: 4, direction: .right, isOnRepeat: isOnRepeat)
        }
        else {
            [cloudImageView1, cloudImageView2, cloudImageView3, cloudImageView4].forEach {
                $0.layer.pause()
                $0.frame = $0.layer.presentation()!.frame
                print($0.layer.presentation()!.frame)
                //$0.layer.removeAllAnimations()
            }
        }
        
        button.tag += 1
        
    }
    
}

enum Direction {
    case right
    case left
}

extension UIView {
    
    var animationFrame: CGRect? {
        return self.layer.presentation()?.frame
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach { (view) in
            self.addSubview(view)
        }
    }
    
    func moveEdgeToEdge(duration: TimeInterval, direction: Direction, isOnRepeat: @escaping () -> Bool ) {
        
        guard let superview = self.superview else { return }
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveLinear, animations: {
            self.frame.origin.x = direction == .right ? superview.bounds.width : (-self.frame.width)
        }, completion: { (true) in
            if direction == .right {
                self.frame.origin.x = (superview.bounds.origin.x - self.frame.width)
            }
            else {
                self.frame.origin.x = superview.bounds.width
            }
            if isOnRepeat() {
                self.moveEdgeToEdge(duration: duration, direction: direction, isOnRepeat: isOnRepeat)
            }
        })
    }
}

extension CALayer {
    
    func pause() {
        let pausedTime: CFTimeInterval = convertTime(CACurrentMediaTime(), from: nil)
        speed = 0.0
        timeOffset = pausedTime
    }
    
    func resume() {
        let pausedTime: CFTimeInterval = timeOffset
        speed = 1.0
        timeOffset = 0.0
        beginTime = 0.0
        let timeSincePause: CFTimeInterval = convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        beginTime = timeSincePause
    }
}



