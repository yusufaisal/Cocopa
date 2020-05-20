//
//  TimelineViewController.swift
//  Cocopa
//
//  Created by iSal on 20/05/20.
//  Copyright © 2020 iSal. All rights reserved.
//

import UIKit
import MaterialComponents

class TimelineViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.setupNavigationAppearance()
        self.setupTapBarAppearance()
    
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func onPostTapped(_ sender: Any) {
        print("tapped")
    }
}

extension TimelineViewController: UITableViewDelegate, UITableViewDataSource {
    private func setupTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TimelineCell.identifier) as? TimelineCell else {return UITableViewCell()}
        cell.selectionStyle = .none
        cell.setupCell()
        
        if indexPath.row == 0 {
            cell.message.text = "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailPostViewController()
        self.present(vc.asBottomSheet(), animated: true, completion: nil)
    }
}

extension UIViewController {
    func setupNavigationAppearance() {
        guard let navigationController = self.navigationController else { return }
        
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithTransparentBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = .systemBlue
            
            navigationController.navigationBar.standardAppearance = navBarAppearance
            navigationController.navigationBar.scrollEdgeAppearance = navBarAppearance
        } else {
            navigationController.navigationBar.barTintColor = .systemBlue
            navigationController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
            navigationController.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        }
    }
    
    func setupTapBarAppearance(){
        guard let tabBarController = self.tabBarController else { return }
        tabBarController.tabBar.unselectedItemTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        tabBarController.tabBar.barTintColor = .systemBlue
    }
}
