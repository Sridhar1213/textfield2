//
//  Details.swift
//  textfield
//
//  Created by Erugupally sridhar on 22/01/21.
//

import UIKit

class Details: UIViewController {
    var back = UIButton()
    var firstUserLbl:UILabel!
    var fn:UILabel!
    var nextL = UILabel()
    var lblArr = [UILabel]()
    var arr:[String] = []
    var textView:UITextView!
    var scrollView = UIScrollView()
    var detailsView = UIView()
    var totalUsers = UIView()
    var totalUsersLbl = UILabel()
    var userNumView:UIView!
    var userNumLbl:UILabel!
    var userImage:UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        backBtn()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        
    }
//creating backbtn function
    func backBtn(){
        //creating views,scroll view,button
        var vc = ViewController()
        scrollView.frame = CGRect(x: 0, y: 0, width: ViewController().view.frame.width, height: ViewController().view.frame.height)
        scrollView.contentSize = CGSize(width: 500, height: 1000)
        view.addSubview(scrollView)
        
        detailsView.frame = CGRect(x: 00, y: -30, width: view.frame.width, height: 260)
        detailsView.backgroundColor = .systemGreen
        detailsView.layer.cornerRadius = 50
        scrollView.addSubview(detailsView)
        
        totalUsers.frame = CGRect(x: 100, y: 120, width: 200, height: 200)
        totalUsers.backgroundColor = .systemGreen
        //totalUsers.text = "Total Users"
        totalUsers.layer.cornerRadius = 100
        scrollView.addSubview(totalUsers)
        
        totalUsersLbl.frame = CGRect(x: 20, y: 40, width: 100, height: 80)
        totalUsersLbl.backgroundColor = .systemGreen
        totalUsersLbl.numberOfLines = 0
        totalUsersLbl.textAlignment = .center
        totalUsers.addSubview(totalUsersLbl)
        
        
        back = UIButton(type: .system)
        back.frame = CGRect(x: 60, y: 100, width: 100, height: 30)
        //back.backgroundColor = .black
        back.setTitle("Back", for: .normal)
        back.addTarget(self, action: #selector(backBtnAction), for: .touchUpInside)
        detailsView.addSubview(back)

        nextL.frame = CGRect(x: 30, y: 180, width: view.frame.width, height: 100)
        view.addSubview(nextL)
        lblArr.append(nextL)
    }
    //creating button actioin
    @objc func backBtnAction(){
        var mainVC = ViewController()
        dismiss(animated: true) {
            print("returned to main view controller ")
        }
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
