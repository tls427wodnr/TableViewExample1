//
//  MainVC.swift
//  TableViewExample1
//
//  Created by tlswo on 2/16/25.
//

import UIKit

class MainVC: UIViewController {
    
    var randomTexts: [String] = []

    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "TableView Example"
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        addButton.tintColor = .black
        navigationItem.rightBarButtonItem = addButton
        
        configureTableView()
    }
    
    func configureTableView(){
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.register(CustomCell.self, forCellReuseIdentifier: "MainVCTableViewCell")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }

    func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    @objc private func addButtonTapped(){
          let alert = UIAlertController(title: "", message: "텍스트를 추가해주세요.", preferredStyle: .alert)
          
          alert.addTextField()
          
          let confirmAction = UIAlertAction(title: "확인", style: .default) { _ in
              if let text = alert.textFields?.first?.text {
                  self.addItem(newText: text)
              }
          }
          let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
          
          alert.addAction(confirmAction)
          alert.addAction(cancelAction)
          
          present(alert,animated: true,completion: nil)
      }
    
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomTexts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainVCTableViewCell") as! CustomCell
        let title = randomTexts[indexPath.row]
        cell.set(title: title)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func addItem(newText: String) {
        randomTexts.append(newText)
        
        let newIndexPath = IndexPath(row: randomTexts.count - 1, section: 0)
        tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            randomTexts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
