//
//  ViewController.swift
//  ViewData
//
//  Created by Abdualrahman Alharbi on 28/06/1442 AH.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // Edit Text
    @IBOutlet weak var TFFirstName: UITextField!

    @IBOutlet weak var TFMiddleName: UITextField!
    @IBOutlet weak var TFLastName: UITextField!
    
    var selectedDate = ""
    var actionSheetController : UIAlertController?

    @IBOutlet var datePicker: UIDatePicker!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    // Get Date from datePicker
    func getDateFromDatepicker(){
        datePicker.datePickerMode = UIDatePicker.Mode.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        // save Date as String
        selectedDate = dateFormatter.string(from: datePicker.date)
        print(selectedDate)
    }
    
    
    
    
   // On click Show Data
    @IBAction func showData(_ sender: Any) {

        // Check if one or more of TF are empty.
        if TFFirstName.text!.isEmpty || TFMiddleName.text!.isEmpty || TFLastName.text!.isEmpty {
            // Show Dialog
            showDialog()
            
        }else {
        
            let vcShowData = storyboard?.instantiateViewController(identifier: "ShowData") as! ViewControllerShowData
            
            // Get Birhday date
            getDateFromDatepicker()
            
            // send values to another view
            vcShowData.firstName = TFFirstName.text!
            vcShowData.middleName = TFMiddleName.text!
            vcShowData.lastName = TFLastName.text!
            vcShowData.birthDay = selectedDate
            
            vcShowData.modalPresentationStyle = .fullScreen
            present(vcShowData, animated: true)
        }
    }
    
    func showDialog(){
        
        
        actionSheetController = UIAlertController(title: "تنبيه!", message: "يرجى تعبئة جميع الحقول قبل الإنتقال للصفحة التالية", preferredStyle: .alert)
        
        
        
        let okAction = UIAlertAction(title: "حسناً", style: .default) { action -> Void in
            //
        }
        
        actionSheetController?.addAction(okAction)
        self.present(actionSheetController!, animated: true, completion: nil)
    }
    
    // dismiss keyboard
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // close keyboard when click enter
        textField.resignFirstResponder()
        return true
    }
    
    // close keyboard when click anywhere on viewController
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    

}

