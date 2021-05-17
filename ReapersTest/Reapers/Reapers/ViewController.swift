//
//  ViewController.swift
//  Test
//
//  Created by tk on 14.05.21.
//

import UIKit

class ViewController: UIViewController {
    
    
    let myButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 600, width: 100, height: 50))
        button.backgroundColor = .green
        button.setTitle("Test Button", for: .normal)
        //button.addTarget(self, action: #selector(buttonAction), forControlEvents: .TouchUpInside)

        
        return button
    }()

    let myIV: UIImageView = {
        let image = UIImage(named: "person1.png")
        let iv = UIImageView(image: image!)
        iv.frame = CGRect(x: 100, y: 250, width: 200, height: 200)
        
        return iv
    }()
    
    let myIV2: UIImageView = {
        let image = UIImage(named: "person1.png")
        let iv = UIImageView(image: image!)
        iv.frame = CGRect(x: 100, y: 600, width: 50, height: 50)
        
        return iv
    }()
    
    var timer = Timer()
    var rotationAngle = Double.pi * 2
    var imageInUpperPositon = false
    
    @IBOutlet weak var myTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(myButton)
        self.view.addSubview(myIV)
        self.view.addSubview(myIV2)
        // Do any additional setup after loading the view.
        
        //view.largeContentTitle = "test"
        UIView.animate(withDuration: 2) {
            
            
            //let xOffset = CGFloat(self.view.frame.minX + 100)
            // let yOffset = CGFloat(self.view.frame.minY + 100)
            //self.view.frame = self.view.frame.offsetBy(dx: 0, dy: yOffset)
            let xOffset = CGFloat(0)
            let yOffset = CGFloat(self.myTextLabel.frame.maxY + 400)
            self.myTextLabel.frame = self.myTextLabel.frame.offsetBy(dx: xOffset, dy: yOffset)
            
            let xButtonOffset = CGFloat(self.view.frame.width / 2 - (self.myButton.frame.width/2))
            print(self.view.frame.minY)
            print(self.view.frame.height)
            let yButtonOffset = CGFloat(-100)
            
            self.myButton.frame = self.myButton.frame.offsetBy(dx:xButtonOffset, dy: yButtonOffset)
            
        }
        
        
        UIView.animate(withDuration: 2) {
            self.myIV.frame = self.myIV.frame.offsetBy(dx: 10, dy: 10)
        }
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(rotateImageInClocktimeDirection), userInfo: nil, repeats: true)
        
        _ = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(jumpImage), userInfo: nil, repeats: true)
    }
    
    //image move up/down
    @objc func jumpImage(){
        UIView.animate(withDuration: 0.0) {
            if self.imageInUpperPositon {
                self.myIV2.frame = self.myIV2.frame.offsetBy(dx: 0, dy: -1)
                
            } else {
                self.myIV2.frame = self.myIV2.frame.offsetBy(dx: 0, dy: 1)
            }
            self.imageInUpperPositon = !self.imageInUpperPositon
            
        }
    }
    
    
    //Rotating image
    @objc func rotateImageInClocktimeDirection(){
        
        if rotationAngle  > 0  {
            rotationAngle -= 0.01
        } else {
            rotationAngle = Double.pi * 2 //0.0 bis 6.28
        }
        
        //print(rotationAngle)
        UIView.animate(withDuration: 0.0) {
            self.myIV.transform = CGAffineTransform(rotationAngle: CGFloat(self.rotationAngle))
            
    
        }
    }

    deinit {
        timer.invalidate()
    }

    
}

