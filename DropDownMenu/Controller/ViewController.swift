//
//  ViewController.swift
//  DropDownMenu
//
//  Created by Julio Collado on 12/10/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView: UITableView!
    var isMenuHide = false
    
    let colorView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = nil
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUIElements()
       
        // Do any additional setup after loading the view.
    }
    
    func configureUIElements() {
        configureTableView()
        configureView()
    }
    
    private func configureView(){
        view.addSubview(colorView)
        [colorView.centerYAnchor.constraint(equalTo: view.centerYAnchor), colorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                colorView.heightAnchor.constraint(equalToConstant: 100), colorView.widthAnchor.constraint(equalToConstant: 100)].forEach{ $0.isActive = true}
    }
    
    private func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset.left = CGFloat(0)
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.rowHeight = 50
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(DropDownTableViewCell.self, forCellReuseIdentifier: DropDownTableViewCell.reuseIdentifier)
        view.addSubview(tableView)
        
        [tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 44), tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
         tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20), tableView.heightAnchor.constraint(equalToConstant: 200)].forEach{ $0.isActive = true}
    }
    
    @objc func handleDropDown() {
        isMenuHide = !isMenuHide
        var indexPaths = [IndexPath]()
        Colors.allCases.forEach{
            let indexPath = IndexPath(row: $0.rawValue, section: 0)
            indexPaths.append(indexPath)
        }
        
        if isMenuHide {
            tableView.deleteRows(at: indexPaths, with: .fade)
        } else {
            tableView.insertRows(at: indexPaths, with: .fade)
        }
        
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let button = UIButton(type: .system)
        button.setTitle("Select Color", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleDropDown), for: .touchUpInside)
        button.backgroundColor = .blue
        return button
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isMenuHide ? 0 : Colors.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DropDownTableViewCell.reuseIdentifier, for: indexPath) as! DropDownTableViewCell
        let color = Colors(rawValue: indexPath.row)
        cell.titleLabel.text = color?.description
        cell.backgroundColor = color?.color
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        colorView.backgroundColor = Colors(rawValue: indexPath.row)?.color
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
