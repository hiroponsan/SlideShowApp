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
    
    let images = [UIImage(named: "apple1"), UIImage(named: "apple2"), UIImage(named: "apple3")]

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
    
    
    
    var num = 0
    @IBAction func slidestart(sender: AnyObject) {
        num += 1
        if num % 1 == 0 {
         var timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: Selector("nextpath:"), userInfo: nil, repeats: true)
        start.setTitle("停止", forState: .Normal)
        }
        if num % 2 == 0{
        start.setTitle("再生", forState: .Normal)
        }
        print(num)
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

