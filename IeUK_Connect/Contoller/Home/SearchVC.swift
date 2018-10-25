//
//  SearchVC.swift
//  IeUK_Connect
//
//  Created by PS on 18/10/18.
//  Copyright © 2018 PS. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {

    @IBOutlet var backView: UIView!
    @IBOutlet var searchBarBackView: UIView!
    @IBOutlet var tblList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        backView.layer.cornerRadius = 8
        backView.clipsToBounds = true
        searchBarBackView.layer.cornerRadius = 8
        searchBarBackView.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnCancleaction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
extension SearchVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchListCell") as! SearchListCell
        cell.selectionStyle = .none
        cell.backView.layer.shadowOpacity = 0.20
        cell.backView.layer.shadowOffset = CGSize(width: 0, height: 4)
        cell.backView.layer.shadowRadius = 2
        cell.backView.layer.shadowColor = UIColor.black.cgColor
        cell.backView.layer.masksToBounds = false
        cell.backView.layer.cornerRadius = 8
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
