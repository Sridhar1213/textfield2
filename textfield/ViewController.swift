//
//  ViewController.swift
//  textfield
//
//  Created by Erugupally sridhar on 22/01/21.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    var firstNameLbl = UILabel()
    var firstNameTf = UITextField()
    var lastNameLbl = UILabel()
    var lastNameTf = UITextField()
    var ageLbl = UILabel()
    var ageTf = UITextField()
    var emailLbl = UILabel()
    var emailTf = UITextField()
    var mNoLbl = UILabel()
    var mNoTf = UITextField()
    var saveBtn = UIButton()
    var showBtn = UIButton()
    var arrFn:[String] = []
    var arrLn:[String] = []
    var arrAge:[String] = []
    var arrEmail:[String] = []
    var arrMNo:[String] = []
    var saveVal = 0
    var firstNameTfCaLyr = CALayer()
    var lastNameTfCaLyr = CALayer()
    var componentsView = UIView()
    var ageTfCaLyr = CALayer()
    var emailTfCaLyr = CALayer()
    var mNoTfCaLyr = CALayer()
    var marritalLbl = UILabel()
    var genderLbl = UILabel()
    var maritalSeg = UISegmentedControl()
    var genderSeg = UISegmentedControl()
    var scroolViewCV = UIScrollView()
    var dateOfBirthTF = UITextField()
    var dateOfBirthLbl = UILabel()
    var dateOfBirthCaLyr = CALayer()
    var removeSeg = [UISegmentedControl]()
    var datePickerView = UIDatePicker()
    var genderImage:UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemGreen
        display()
        segmentsCreation()
        firstNameTf.delegate = self
        lastNameTf.delegate = self
        ageTf.delegate = self
        emailTf.delegate = self
        mNoTf.delegate = self
        dateOfBirthTF.delegate = self
        
    
    }
    //removing segment
    func removeSegment(){
        for i in 0..<removeSeg.count{
            removeSeg[i].removeFromSuperview()
        }
    }
    //creating components to display
    func display(){
        //UIDatePickerView
        
        datePickerView = UIDatePicker()
        datePickerView.datePickerMode = UIDatePicker.Mode.date
        datePickerView.addTarget(self, action: #selector(dobAction), for: UIControl.Event.valueChanged)
        
        //creating view
        componentsView.frame = CGRect(x: 20, y: 200, width: 370, height: 730)
        componentsView.layer.cornerRadius = 50
        componentsView.layer.shadowColor = UIColor.lightGray.cgColor
        componentsView.layer.shadowRadius = 2.0
        componentsView.layer.shadowOpacity = 2.0
        componentsView.backgroundColor = .white
        view.addSubview(componentsView)
        //creating frame for scrollviewcv
        scroolViewCV.frame = CGRect(x: 0, y: 0, width: componentsView.frame.width, height: componentsView.frame.height)
        scroolViewCV.contentSize = CGSize(width: componentsView.frame.width, height: componentsView.frame.height+200)
        componentsView.addSubview(scroolViewCV)
        //creating text fields and labels
        firstNameTf.frame = CGRect(x: 40, y: 70, width: 300, height: 40)
        firstNameTf.borderStyle = .none
        firstNameTf.backgroundColor = .white
        firstNameTf.keyboardType = .asciiCapable
        firstNameTf.keyboardAppearance = .dark
        firstNameTf.clearButtonMode = .always
        scroolViewCV.addSubview(firstNameTf)
        
        
        firstNameTfCaLyr.frame = CGRect(x: 0, y: 40, width: 290, height: 1)
        firstNameTfCaLyr.backgroundColor = UIColor.black.cgColor
        firstNameTf.layer.addSublayer(firstNameTfCaLyr)
        firstNameLbl.frame = CGRect(x: 50, y: 75, width: view.frame.width, height: 30)
        firstNameLbl.text = "First Name"
        firstNameLbl.textColor = .gray
        scroolViewCV.addSubview(firstNameLbl)
        
        lastNameTf.frame = CGRect(x: 40, y: 170, width: 300, height: 40)
        lastNameTf.borderStyle = .none
        lastNameTf.backgroundColor = .white
        lastNameTf.keyboardType = .asciiCapable
        lastNameTf.keyboardAppearance = .dark
        lastNameTf.clearButtonMode = .always
        scroolViewCV.addSubview(lastNameTf)
        
        
        lastNameTfCaLyr.frame = CGRect(x: 0, y: 40, width: 290, height: 1)
        lastNameTfCaLyr.backgroundColor = UIColor.black.cgColor
        lastNameTf.layer.addSublayer(lastNameTfCaLyr)
        
        lastNameLbl.frame = CGRect(x: 50, y: 175, width: view.frame.width, height: 30)
        lastNameLbl.textColor = .gray
        lastNameLbl.text = "Last Name"
        scroolViewCV.addSubview(lastNameLbl)
        
        //creating textfield for dateofBirth
        dateOfBirthTF.frame = CGRect(x: 40, y: 270, width: 300, height: 50)
        dateOfBirthTF.borderStyle = .none
        dateOfBirthTF.backgroundColor = .white
        dateOfBirthTF.keyboardType = .asciiCapable
        dateOfBirthTF.clearButtonMode = .always
        dateOfBirthCaLyr.frame = CGRect(x: 0, y: 40, width: 290, height: 1)
        dateOfBirthCaLyr.backgroundColor = UIColor.black.cgColor
        dateOfBirthTF.inputView = datePickerView
        dateOfBirthTF.layer.addSublayer(dateOfBirthCaLyr)
        scroolViewCV.addSubview(dateOfBirthTF)
        
        dateOfBirthLbl.frame = CGRect(x: 50, y: 275, width: view.frame.width, height: 30)
        dateOfBirthLbl.text = "Date Of Birth"
        dateOfBirthLbl.textColor = .gray
        scroolViewCV.addSubview(dateOfBirthLbl)
        
        ageTf.frame = CGRect(x: 40, y: 370, width: 300, height: 40)
        ageTf.borderStyle = .none
        ageTf.backgroundColor = .white
        
        ageTfCaLyr.frame = CGRect(x: 0, y: 40, width: 290, height: 1)
        ageTfCaLyr.backgroundColor = UIColor.black.cgColor
        ageTf.layer.addSublayer(ageTfCaLyr)
        ageTf.clearButtonMode = .always
        ageTf.keyboardType = .numberPad
        ageTf.keyboardAppearance = .dark
       
        scroolViewCV.addSubview(ageTf)
        
        ageLbl.frame = CGRect(x: 50, y: 375, width: view.frame.width, height: 30)
        ageLbl.textColor = .gray
        ageLbl.text = "Age"
        scroolViewCV.addSubview(ageLbl)
        
        emailTf.frame = CGRect(x: 40, y: 470, width: 300, height: 40)
        emailTf.borderStyle = .none
        emailTf.backgroundColor = .white
        emailTf.clearButtonMode = .always
        emailTfCaLyr.frame = CGRect(x: 0, y: 40, width: 290, height: 1)
        emailTfCaLyr.backgroundColor = UIColor.black.cgColor
        emailTf.layer.addSublayer(emailTfCaLyr)
        emailTf.autocapitalizationType = .none
        emailTf.keyboardType = .emailAddress
        emailTf.keyboardAppearance = .dark
        scroolViewCV.addSubview(emailTf)
        
        emailLbl.frame = CGRect(x: 50, y: 475, width: view.frame.width, height: 30)
        emailLbl.text = "Email"
        emailLbl.textColor = .gray
        scroolViewCV.addSubview(emailLbl)
        
        mNoTf.frame = CGRect(x: 40, y: 570, width: 300, height: 50)
        mNoTf.borderStyle = .none
        mNoTf.backgroundColor = .white
        mNoTf.clearButtonMode = .always
        mNoTfCaLyr.frame = CGRect(x: 0, y: 40, width: 290, height: 1)
        mNoTfCaLyr.backgroundColor = UIColor.black.cgColor
        mNoTf.layer.addSublayer(mNoTfCaLyr)
        mNoTf.keyboardType = .phonePad
        mNoTf.keyboardAppearance = .dark
        scroolViewCV.addSubview(mNoTf)
        
        mNoLbl.frame = CGRect(x: 50, y: 575, width: view.frame.width, height: 30)
        mNoLbl.text = "Mobile Number"
        mNoLbl.textColor = .gray
        scroolViewCV.addSubview(mNoLbl)
        //creating buttons
        saveBtn = UIButton(type: .system)
        saveBtn.frame = CGRect(x: 130, y: 850, width: 150, height: 40)
        saveBtn.setTitle("Save", for: .normal)
        saveBtn.addTarget(self, action: #selector(save), for: .touchUpInside)
        saveBtn.backgroundColor = .systemGreen
        saveBtn.tintColor = .black
        saveBtn.layer.cornerRadius = 15
        saveBtn.layer.shadowColor = UIColor.gray.cgColor
        saveBtn.layer.shadowRadius = 1.0
        saveBtn.layer.shadowOpacity = 1.0
        saveBtn.isEnabled = false
        
        scroolViewCV.addSubview(saveBtn)
        
        showBtn = UIButton(type: .system)
        showBtn.frame = CGRect(x: 250, y: 100, width: 130, height: 40)
        showBtn.setTitle("Show Saved", for: .normal)
        showBtn.backgroundColor = .white
        showBtn.tintColor = .systemGreen
        showBtn.layer.cornerRadius = 20
        showBtn.layer.shadowColor = UIColor.gray.cgColor
        showBtn.layer.shadowRadius = 1.0
        showBtn.layer.shadowOpacity = 1.0
        showBtn.addTarget(self, action: #selector(saveBtnAction), for: .touchUpInside)
        view.addSubview(showBtn)
        
    }
    func segmentsCreation(){
        removeSegment()
        //creating marrital status label
        marritalLbl.frame = CGRect(x: 40, y: 650, width: 150, height: 30)
        marritalLbl.text = "Marrital Status"
        marritalLbl.textColor = .black
        scroolViewCV.addSubview(marritalLbl)
        removeSegment()
        //creating marital status segmented control
        maritalSeg = UISegmentedControl(items: ["Single","Married"])
        maritalSeg.frame = CGRect(x: 190, y: 660, width: 150, height: 40)
        maritalSeg.backgroundColor = .systemGreen
        maritalSeg.isEnabled = false
        maritalSeg.addTarget(self, action: #selector(maritalSegAction), for: .valueChanged)
        scroolViewCV.addSubview(maritalSeg)
        //creating gender status label
        genderLbl.frame = CGRect(x: 40, y: 750, width: 150, height: 30)
        genderLbl.text = "Gender"
        genderLbl.textColor = .black
        scroolViewCV.addSubview(genderLbl)
        //creating gender segmented control
        genderSeg = UISegmentedControl(items: ["Male","Female"])
        genderSeg.frame = CGRect(x: 190, y: 760, width: 150, height: 40)
        genderSeg.backgroundColor = .systemGreen
        genderSeg.isEnabled = false
        genderSeg.addTarget(self, action: #selector(genderSegAction), for: .valueChanged)
        scroolViewCV.addSubview(genderSeg)
        
    }
    //creating a variable
    var returnValue = false
    //text field should begin editing
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField == firstNameTf{
            firstNameLbl.frame = CGRect(x: 40, y: 35, width: view.frame.width, height: 30)
            firstNameLbl.textColor = .black
            returnValue = true
        }
        else if textField == lastNameTf{
            if firstNameTf.text!.count > 0{
                lastNameLbl.frame = CGRect(x: 40, y: 135, width: view.frame.width, height: 30)
                lastNameLbl.textColor = .black
                returnValue = true
            }
        }else if textField == dateOfBirthTF{
            if firstNameTf.text!.count > 0 && lastNameTf.text!.count > 0{
                dateOfBirthLbl.frame = CGRect(x: 40, y: 250, width: view.frame.width, height: 30)
                dateOfBirthLbl.textColor = .black
                print("Date of birth is on the way")
                returnValue = true
            }
        }
        else if textField == ageTf{
            if firstNameTf.text!.count > 0 && lastNameTf.text!.count > 0 && dateOfBirthTF.text!.count > 0{
                ageLbl.frame = CGRect(x: 40, y: 335, width: view.frame.width, height: 30)
                ageLbl.textColor = .black
                returnValue = true
            }
        }
        else if textField == emailTf{
            if firstNameTf.text!.count > 0 && lastNameTf.text!.count > 0 && dateOfBirthTF.text!.count > 0 && Int(ageTf.text!.count) > 0{
                emailLbl.frame = CGRect(x: 40, y: 435, width: view.frame.width, height: 30)
                emailLbl.textColor = .black
                returnValue = true
            }
        }
        else if textField == mNoTf{
            if firstNameTf.text!.count > 0 && lastNameTf.text!.count > 0 && dateOfBirthTF.text!.count > 0 && ageTf.text!.count > 0 && emailTf.text!.count > 0{
                mNoLbl.frame = CGRect(x: 40, y: 535, width: view.frame.width, height: 30)
                mNoLbl.textColor = .black
                returnValue = true
            }
        }
        else{
            returnValue = false
        }
        
        return returnValue
    }
    //text field dis begin editing
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == firstNameTf{
            firstNameTfCaLyr.backgroundColor = UIColor.systemGreen.cgColor
            firstNameLbl.textColor = .systemGreen
        }
        if textField == lastNameTf{
            lastNameTfCaLyr.backgroundColor = UIColor.systemGreen.cgColor
            lastNameLbl.textColor = .systemGreen
        }
        if textField == dateOfBirthTF{
            dateOfBirthCaLyr.backgroundColor = UIColor.systemGreen.cgColor
            dateOfBirthLbl.textColor = .systemGreen
        }
        if textField == ageTf{
            ageCal()
            ageTfCaLyr.backgroundColor = UIColor.systemGreen.cgColor
            ageLbl.textColor = .systemGreen
        }
        if textField == emailTf{
            emailTfCaLyr.backgroundColor = UIColor.systemGreen.cgColor
            emailLbl.textColor = .systemGreen
        }
        if textField == mNoTf{
            mNoTfCaLyr.backgroundColor = UIColor.systemGreen.cgColor
            mNoLbl.textColor = .systemGreen
        }

    }
    //text field did end function
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == firstNameTf{
            firstNameTfCaLyr.backgroundColor = UIColor.black.cgColor
            firstNameLbl.textColor = .black
        }
        else if textField == lastNameTf{
            lastNameTfCaLyr.backgroundColor = UIColor.black.cgColor
            lastNameLbl.textColor = .black
        }else if textField == dateOfBirthTF{
            dateOfBirthCaLyr.backgroundColor = UIColor.black.cgColor
            dateOfBirthLbl.textColor = .black
        }
        
        else if textField == ageTf{
            ageTfCaLyr.backgroundColor = UIColor.black.cgColor
            ageLbl.textColor = .black
        }else if textField == emailTf{
            emailTfCaLyr.backgroundColor = UIColor.black.cgColor
            emailLbl.textColor = .black
        }else if textField == mNoTf{
            mNoTfCaLyr.backgroundColor = UIColor.black.cgColor
            mNoLbl.textColor = .black
        }
         if textField == dateOfBirthTF{
            saveBtn.isEnabled = true
         }else{
            saveBtn.isEnabled = false
         }
        if mNoTf.text!.count == 10{
            maritalSeg.isEnabled = true
        }else{
            maritalSeg.isEnabled = false
        }
         
    }
    //textfield should end function
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField == firstNameTf{
            if firstNameTf.text!.count >= 3 {
                returnValue = true
            }else{
                returnValue = false
            }
        }
        else if textField == lastNameTf{
            if lastNameTf.text!.count >= 3 {
                returnValue = true
            }else{
                returnValue = false
            }
        }
        else if textField == ageTf{
            if Int(ageTf.text!)! <= 120{
                returnValue = true
            }else{
                returnValue = false
            }
        }else if textField == emailTf{
             
            return isValidEmail(textField.text!)
            

        }
        if mNoTf.text!.count == 9{
            //returnValue = true
            saveBtn.isEnabled = true
        }else{
            //returnValue = false
            saveBtn.isEnabled = false
        }
        
        return returnValue
    }
    //Text field characters function
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var returnValue = false
        if textField == firstNameTf || textField == lastNameTf{
            if string >= "\(Character(UnicodeScalar(65)!))" && string <= "\(Character(UnicodeScalar(90)!))" || string <= "\(Character(UnicodeScalar(08)!))" || string <= "\(Character(UnicodeScalar(32)!))"{
                
                returnValue = true
            }else if string >= "\(Character(UnicodeScalar(97)!))" && string <= "\(Character(UnicodeScalar(122)!))"{
                returnValue = true
            }
            else{
                alertMessage(sender: textField)
                returnValue = false
            }
        }else if textField == ageTf{
            if textField.text!.count <= 3{
            if string >= "\(Character(UnicodeScalar(48)))" && string <= "\(Character(UnicodeScalar(57)))" || string <= "\(Character(UnicodeScalar(08)!))"{
                returnValue = true
                if textField.text!.count >= 4{
                    returnValue = false
                    
                }
            }else{
                alertMessage(sender: textField)
                returnValue = false
            }
        }
        }else if textField == emailTf{
            if string >= "\(Character(UnicodeScalar(48)))" && string <= "\(Character(UnicodeScalar(57)))" || string <= "\(Character(UnicodeScalar(08)!))" || string == "\(Character(UnicodeScalar(46)!))"{
                returnValue = true
            }
            else if string >= "\(Character(UnicodeScalar(64)!))" && string <= "\(Character(UnicodeScalar(90)!))"{
                returnValue = true
            }else if string >= "\(Character(UnicodeScalar(97)!))" && string <= "\(Character(UnicodeScalar(122)!))"{
                returnValue = true
            }
            else{
                alertMessage(sender: textField)
                returnValue = false
            }
        }else if textField == mNoTf{
            if  textField.text!.count == 0{
                if string >= "\(Character(UnicodeScalar(54)))" && string <= "\(Character(UnicodeScalar(57)))" || string <= "\(Character(UnicodeScalar(08)!))"{
                    returnValue = true
                }
            }else{
                returnValue = false
            }
            if textField.text!.count >= 1{
            if string >= "\(Character(UnicodeScalar(48)))" && string <= "\(Character(UnicodeScalar(57)))" || string <= "\(Character(UnicodeScalar(08)!))"{
                returnValue = true
            }else{
                returnValue = false
            }
            }
            if textField.text!.count > 10{
                alertMessage(sender: textField)
                returnValue = false
            }
            if textField.text!.count == 9{
                maritalSeg.isEnabled = true
            }
        }
        
        return returnValue
    }
    @objc func maritalSegAction(){
        if maritalSeg.selectedSegmentIndex == 0 || maritalSeg.selectedSegmentIndex == 1{
            genderSeg.isEnabled = true
        }else{
            genderSeg.isEnabled = false
        }
    }
    @objc func genderSegAction(){
        if genderSeg.selectedSegmentIndex == 0 || genderSeg.selectedSegmentIndex == 1{
            saveBtn.isEnabled = true
        }else{
            saveBtn.isEnabled = false
        }
        if genderSeg.selectedSegmentIndex == 0{
            genderImage = UIImageView(image: UIImage(named: "lightback"))
            genderImage.frame = CGRect(x: 20, y: 70, width: 50, height: 50)
            //genderImage.sizeToFit()
            view.addSubview(genderImage)
        }
    }
    //Save button action
    @objc func save(){
        saveVal+=1
        var detail = Details()
        var item = firstNameTf.text!
        arrFn.append(item)
        print(arrFn)
        arrLn.append(lastNameTf.text!)
        print(arrLn)
        arrAge.append(ageTf.text!)
        print(arrAge)
        arrEmail.append(emailTf.text!)
        print(arrEmail)
        arrMNo.append(mNoTf.text!)
        print(arrMNo)
        removeSeg.append(maritalSeg)
        removeSeg.append(genderSeg)
        if mNoTf.text!.count == 10{
            //returnValue = true
            firstNameTf.becomeFirstResponder()
            saveBtn.isEnabled = true
        }else{
            //returnValue = false
            saveBtn.isEnabled = false
        }
        genderImage.frame = CGRect(x: 320, y: 100, width: 50, height: 50)
        //genderImage.isHidden = true
       segmentsCreation()
        if firstNameTf.text!.count > 0 || lastNameTf.text!.count > 0 || ageTf.text!.count > 0 || emailTf.text!.count > 0 || mNoTf.text!.count > 0{
            firstNameTf.text = nil
            lastNameTf.text = nil
            ageTf.text = nil
            emailTf.text = nil
            mNoTf.text = nil
            dateOfBirthTF.text = nil
            saveBtn.isEnabled = false
        }
        maritalSeg.isEnabled = false
        genderSeg.isEnabled = false
    }
    //Show save button action
    @objc func saveBtnAction(){
        saveBtn.isEnabled = false
        var detail = (storyboard?.instantiateViewController(identifier: "det"))! as Details
        self.present(detail, animated: true) { [self] in
            print("Details view controller")
            var b = 10,c=0
            for i in 0..<self.saveVal{
            print("\(self.arrFn) helllll")
                detail.totalUsersLbl.text = "Total \n Users \n \(1)"
//                detail.userNumView = UIView()
//                detail.userNumView.frame = CGRect(x: 150, y: 340+b, width: 100, height: 100)
//                detail.userNumView.layer.cornerRadius = 50
//                detail.userNumView.backgroundColor = .systemGreen
//                detail.scrollView.addSubview(detail.userNumView)
                detail.userImage = UIImageView(image: UIImage(named: "lightback"))
                detail.userImage.frame = CGRect(x: 150, y: 340+b, width: 100, height: 100)
                detail.userImage.layer.cornerRadius = 50
                detail.userImage.clipsToBounds = true
                detail.scrollView.addSubview(detail.userImage)
                detail.textView = UITextView()
//                detail.userNumLbl = UILabel()
//                detail.userNumLbl.frame = CGRect(x: 20, y: 20, width: 50, height: 50)
//                detail.userNumLbl.backgroundColor = .systemGreen
//                detail.userNumLbl.textAlignment = .center
//                detail.userNumLbl.textColor = .white
//                detail.userNumLbl.text = "\(i+1)"
//                detail.userNumView.addSubview(detail.userNumLbl)
                detail.textView.frame = CGRect(x: 70, y: 400+b, width: 270, height: 200)
            detail.textView.text = "\n     First Name : \(self.arrFn[i]) \n \n     Last Name : \(self.arrLn[i]) \n \n   Age : \(self.arrAge[0]) \n \n    Email : \(self.arrEmail[0]) \n \n   Mobile Number : \(self.arrMNo[0])"
                detail.textView.layer.cornerRadius = 20
                detail.textView.backgroundColor = .systemGreen
                detail.textView.font = UIFont(name: "ArialMT", size: 15)
                detail.scrollView.contentSize = CGSize(width: detail.scrollView.frame.width, height: detail.textView.frame.maxY+200)
                detail.scrollView.addSubview(detail.textView)
                
                //b+=300
                }
           
            print(self.arrFn)
        }
    }
    func alertMessage(sender:UITextField){
        if sender == firstNameTf{
            var alert = UIAlertController(title: "First Name text field", message: "First name text field contains only alphabets", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (Ok) in
                
            }))
            present(alert, animated: true, completion: nil)
        }else if sender == lastNameTf{
            var alert = UIAlertController(title: "Last Name text field", message: "Last name text field contains only alphabets", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (Ok) in
                
            }))
            present(alert, animated: true, completion: nil)
        }else if sender == dateOfBirthTF{
            var alert = UIAlertController(title: "Date of birth text field", message: "Date of birth text field contains only numbers", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (Ok) in
                
            }))
            present(alert, animated: true, completion: nil)
        }else if sender == ageTf{
            var alert = UIAlertController(title: "Age text field", message: "Age text field contains only numbers", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (Ok) in
                
            }))
            present(alert, animated: true, completion: nil)
        }else if sender == mNoTf{
            var alert = UIAlertController(title: "Mobile number text field", message: "Mobile number text field contains only numbers", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (Ok) in
                
            }))
            present(alert, animated: true, completion: nil)
        }
    }
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    @objc func dobAction(sender: UIDatePicker){
        var currentDate = Calendar.current
        let dateForm = DateFormatter()
        dateForm.dateFormat = "dd-MM-yy hh:mm:ss"
        
        dateOfBirthTF.text = dateForm.string(from: sender.date)
        
    }
    func ageCal(){
        var presentAge = Date()
        var birthday:Date = datePickerView.date
        var calendar = Calendar.current
        var ageComp = calendar.dateComponents([.year], from: birthday,to: presentAge)
        var currentAge = ageComp.year!
        ageTf.text = "\(currentAge)"
        ageTf.isUserInteractionEnabled = false
    }
    
   
}

