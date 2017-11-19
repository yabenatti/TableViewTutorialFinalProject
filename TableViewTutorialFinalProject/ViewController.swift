//
//  ViewController.swift
//  TableViewTutorialFinalProject
//
//  Created by Yasmin Benatti on 2017-11-19.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - View functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //1 - TableView delegate e datasource
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        //2 - TableView register class
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "tableCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        //3 - TableView reload
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        
        cell.textLabel?.text = "row: \(indexPath.row) and section: \(indexPath.section)"
        
        return cell
    }
}

