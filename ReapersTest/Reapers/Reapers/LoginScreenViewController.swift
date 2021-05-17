//
//  LoginScreenViewController.swift
//  Test
//
//  Created by tk on 15.05.21.
//

import UIKit

class LoginScreenViewController: UIViewController {
    
    //imageview for splashScreen animation
    var splashToLoginScreenAnimationIV: UIImageView?
    
    //reapers circle imageview
    @IBOutlet weak var reapersIV: UIImageView!
    
    //background
    @IBOutlet weak var bloodBackgroundIV: UIImageView!
    
    
    @IBOutlet weak var textLabel: UILabel!

    @IBOutlet weak var signInButton: RoundButton!
    
    
    
    var alphaValue = 50
    var countUp = true
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // mainStackView.backgroundColor = UIColor(patternImage: UIImage(named: "bloodBackground.png")!)
       
        //bloodBackgroundIV.alpha = 0.5
        createImageView()
        
        self.textLabel.text = " "
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(animateTextLabel), userInfo: nil, repeats: false)
        
        
        configurateReaperIV()
        
        //Setup timer for background animation
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(animateBackground), userInfo: nil, repeats: true)
         
        
    }
    
    //add and animate TextLabel to view
    @objc func animateTextLabel(){
        let myText = "Lets get them all..."
        
        var charIndex = 0.0
        for letter in myText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex , repeats:  false) { (timer) in
                self.textLabel.text?.append(letter)
            }
            charIndex += 1
        }
    }
    
    func createImageView(){
         
        let image = UIImage(named: "reaperLogoCircle.png")
        let iv = UIImageView(image: image!)
        
        iv.frame = CGRect(x: 0, y: self.view.frame.height / 50, width: self.view.frame.width, height: self.view.frame.height)
        iv.contentMode = .scaleAspectFit
         
        splashToLoginScreenAnimationIV = iv
        self.view.addSubview(splashToLoginScreenAnimationIV!)
        
        UIView.animate(withDuration: 2) {
             
            //let yOffset = (self.reapersIV!.layer.frame.maxY + 120) * -1
            //self.splashToLoginScreenAnimationIV!.frame = self.splashToLoginScreenAnimationIV!.frame.offsetBy(dx:0, dy: yOffset)
            
            //change alpha value + scale up imageview
            self.splashToLoginScreenAnimationIV!.alpha = CGFloat(Float(0))
            self.splashToLoginScreenAnimationIV?.transform = CGAffineTransform(scaleX: 5.0, y: 5.0)
                
            
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        //hide navigationBar
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //keep navigationbar at other screens showing
        navigationController?.isToolbarHidden = false
    }
    
    deinit {
        //invalidate timer
        timer?.invalidate()
    }
    
    
    //Configure Reaper ImageView as Circle
    func configurateReaperIV(){
        reapersIV.layer.borderWidth = 1
        reapersIV.layer.borderColor = UIColor.black.cgColor
        reapersIV.layer.cornerRadius = reapersIV.frame.size.height / 2
    }
    
    //Background animation
    @objc func animateBackground(){
        
        if countUp {
            if (alphaValue < 100){
                alphaValue += 1
            } else {
                alphaValue = 99
                countUp = false
            }
        } else {
            if (alphaValue > 50){
                alphaValue -= 1
            } else {
                countUp = true
            }
        }
        
         //Change alpha value for background animation
        UIView.animate(withDuration: 0.2) {
            self.bloodBackgroundIV.alpha = CGFloat(Float(self.alphaValue) / Float(100.0) )
             
        }
        
    }
    
}
