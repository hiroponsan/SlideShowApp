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
    
    let images = [UIImage(named: "apple1"), UIImage(named: "apple2"), UIImage(named: "apple3")]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var image1 = images[0]
        var image2 = images[1]
        var image3 = images[2]
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
    

    @IBAction func unwind(segue: UIStoryboardSegue) {
        
    }

}

