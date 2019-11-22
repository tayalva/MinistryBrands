//
//  HomeVC.swift
//  MinistryBrandsTestApp
//
//  Created by Taylor Smith on 11/20/19.
//  Copyright © 2019 Taylor Smith. All rights reserved.
//

import UIKit
import Nuke

class HomeVC: UIViewController {
    
    //Objects
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        return tableView
    }()
    
    var peopleList: [Person] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        showLogin()
        setupUI()
        fetchPeople()
    }
    
    func showLogin() {
        if let loginVC = createVC(name: "LoginVC", storyboard: "Main") as? LoginVC {
            loginVC.modalPresentationStyle = .overCurrentContext
            present(loginVC, animated: true, completion: nil)
        }
    }
    
    func setupUI() {
        addSubViews()
        setConstraints()
        registerCustomCells()
        tableView.separatorStyle = .none
    }
    
    func registerCustomCells() {
        tableView.register(PersonCell.self, forCellReuseIdentifier: "PersonCell")
    }
    
    func addSubViews() {
        view.addSubview(tableView)
    }
    
    func setConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
    
    
    
    func fetchPeople() {
        NetworkManager.shared.performAPICall(method: .get) { response, error in
            if let error = error {
                print("❌ Error performing call: \(error)")
            } else {
                guard let response = response else {
                    print("❌ No response")
                    return
                }
                self.peopleList = response.result
            }
        }
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return PersonCell.cellHeight()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as! PersonCell
        let person = peopleList[indexPath.row]
        if let url = URL(string: person.links.avatar.href) {
            Nuke.loadImage(with: url, into: cell.personImageView)
        } else {
            cell.personImageView.image = #imageLiteral(resourceName: "blankUser")
        }
        if person.gender == "male" {
            cell.containerView.backgroundColor = .turquoise
        } else {
            cell.containerView.backgroundColor = .lightPink
        }
        cell.nameLabel.text = "\(person.firstName) \(person.lastName)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = peopleList[indexPath.row]
        if let vc = createVC(name: "PersonDetailVC", storyboard: "Main") as? PersonDetailVC {
            vc.person = person
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
