//
//  DetailPostViewController.swift
//  Cocopa
//
//  Created by iSal on 20/05/20.
//  Copyright © 2020 iSal. All rights reserved.
//

import UIKit
import MaterialComponents

class DetailPostViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }

    func asBottomSheet() -> MDCBottomSheetController {
        let view: MDCBottomSheetController = MDCBottomSheetController(contentViewController: self)
        return view
    }
}

extension DetailPostViewController: UITableViewDelegate, UITableViewDataSource {
    private func setupTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Testing"
        cell.selectionStyle = .none
        
        return cell
    }
}
