//
//  ViewControllerShowData.swift
//  ViewData
//
//  Created by Abdualrahman Alharbi on 28/06/1442 AH.
//

import UIKit

class ViewControllerShowData: UIViewController {

    @IBOutlet weak var tableOfData: UITableView!
    
    
    public var firstName = ""
    public var middleName = ""
    public var lastName = ""
    public var birthDay = ""

    
    var data = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setValToArray()
      
        
        tableOfData.delegate = self
        tableOfData.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    // set values to array
    func setValToArray(){
        data.append(firstName)
        data.append(middleName)
        data.append(lastName)
        data.append(birthDay)

    }
    
    // Back home
    @IBAction func backHome(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

   

}

extension ViewControllerShowData: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(data[indexPath.row])
        print(indexPath.row)
    }
}

extension ViewControllerShowData: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
}
