//
//  ViewController.swift
//  SlideShowApp
//
//  Created by 田中　博成 on 2016/02/22.
//  Copyright © 2016年 hiropon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var nextbutton: UIButton!
    @IBOutlet weak var backbutton: UIButton!
    @IBOutlet weak var showphoto: UIButton!
    @IBOutlet weak var zoombutton: UIButton!
    
    let images = [UIImage(named: "ema1"), UIImage(named: "ema2"), UIImage(named: "ema3"),
                  UIImage(named: "ema4"), UIImage(named: "ema5"), UIImage(named: "ema6"),
                  UIImage(named: "ema7"), UIImage(named: "ema8"), UIImage(named: "ema9"),
                  UIImage(named: "ema10")]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        image.image = images[0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destinationViewController as! ResultViewController
        // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
        resultViewController.photo = image.image!
    }
    

    var num = 2
    weak var timer: NSTimer?
    @IBAction func slidestart(sender: AnyObject) {
        num += 1
        if num % 2 == 1 {
        start.setTitle("停止", forState: .Normal)
            nextbutton.enabled = false
            backbutton.enabled = false
            showphoto.enabled = false
            zoombutton.enabled = false
            timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "nextpath:", userInfo: nil, repeats: true)
        }
        else if num % 2 == 0{
        timer?.invalidate()
        start.setTitle("再生", forState: .Normal)
            nextbutton.enabled = true
            backbutton.enabled = true
            showphoto.enabled = true
            zoombutton.enabled = true
        }
    }
    
    
    var i = 0
    @IBAction func nextpath(sender: AnyObject) {
        var count = images.count
        i += 1
        if i == count{
            i = 0
    }
        image.image = images[i]
    }
    
    @IBAction func backpath(sender: AnyObject) {
        var count = images.count
        if i == 0{
            i = count
        }
         i -= 1
        image.image = images[i]
    }

    @IBAction func unwind(segue: UIStoryboardSegue) {
        
    }

}

