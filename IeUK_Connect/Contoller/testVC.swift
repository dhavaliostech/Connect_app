//
//  testVC.swift
//  IeUK_Connect
//
//  Created by PS on 17/10/18.
//  Copyright © 2018 PS. All rights reserved.
//

import UIKit

class testVC: UIViewController {

    @IBOutlet var tbltest: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension testVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell") as! testCell
        
        //cell.backView.backgroundColor = UIColor.black
        cell.backView.layer.shadowOpacity = 0.18
        cell.backView.layer.shadowOffset = CGSize(width: 0, height: 2)
        cell.backView.layer.shadowRadius = 2
        cell.backView.layer.shadowColor = UIColor.black.cgColor//UIColor.init(red: 189.0/255, green: 193.0/255, blue: 194/255, alpha: 0.25).cgColor
        cell.backView.layer.masksToBounds = false
      
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
