//
//  ContactViewController.swift
//  Contact
//
//  Created by MAC on 7/17/22.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var contactTableView: UITableView!
    
    var name = ["abs", "acd", "bccc", "cad", "d12", "d34", "esf", "eeeee", "fasdasd", "fgggg", "fhhhh"]
    var sectionTitle = [String]()
    var sectionTitle2 = Set<String>()
    var nameDict = [String: [String]]()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        contactTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        contactTableView.delegate = self
        contactTableView.dataSource = self
//        sectionTitle = Array(Set(name.compactMap({ String($0.prefix(1))})))
//        sectionTitle.sort()
//        sectionTitle.forEach({nameDict[$0] = [String]()})
//        name.forEach({
//            nameDict[String($0.prefix(1))]?.append($0)
//        })
        
        for name in name {
            let firstLetter = String(name.prefix(1))
            sectionTitle2.insert(firstLetter) // dùng set chỉ để lấy kí tự 1 lần duy nhất ko lặp lại
        }
        print(sectionTitle2)
        sectionTitle = Array(sectionTitle2)
        sectionTitle.sort()
        print(sectionTitle)
        
        for section in sectionTitle {
            nameDict[section] = [String]()
            
        }
        for name in name {
            nameDict[String(name.prefix(1))]?.append(name)
        }
    }


   

}
extension ContactViewController:UITableViewDelegate, UITableViewDataSource {



    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameDict[sectionTitle[section]]?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = nameDict[sectionTitle[indexPath.section]]?[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }

}
