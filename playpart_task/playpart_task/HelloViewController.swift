//
//  HelloViewController.swift
//  playpart_task
//
//  Created by Vlad Koval on 24.08.2021.
//

import UIKit

class HelloViewController: UIViewController {

   
    @IBAction func logOutButton(_ sender: Any) {
        print("touch")
        if
            let navController = self.navigationController, let viewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController{
            navController.pushViewController(viewController, animated: true)
        }
    }
    
    override func viewDidLoad() {
        let label = UILabel(frame: CGRect( x: 157, y: 423, width: 100, height: 50))
        label.text = "Hello World!"
        label.textColor = .black
        self.view.addSubview(label)
        super.viewDidLoad()
      //  self.navigationController = label
        

}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
