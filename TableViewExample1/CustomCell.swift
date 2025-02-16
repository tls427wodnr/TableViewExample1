//
//  MainVCTableViewCell.swift
//  TableViewExample1
//
//  Created by tlswo on 2/16/25.
//

import UIKit

class CustomCell: UITableViewCell {
    
    var container = UIView()
    var title = UILabel()
    var subTitle = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(container)
        addSubview(title)
        addSubview(subTitle)
        
        configureContainer()
        configureTitle()
        configureSubTitle()
        setContainerConstraints()
        setTitleConstraints()
        setSubTitleConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(title: String) {
        container.backgroundColor = randomColor()
        self.title.text = title
        self.subTitle.text = getCurrentTime()
    }
    
    private func randomColor() -> UIColor {
        return UIColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: 1.0
        )
    }

    private func getCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter.string(from: Date())
    }
    
    func configureContainer() {
        container.layer.cornerRadius = 10
        container.clipsToBounds = true
        container.backgroundColor = .blue
    }
    
    func configureTitle() {
        title.numberOfLines = 0
        title.adjustsFontSizeToFitWidth = true
    }
    
    func configureSubTitle() {
        subTitle.numberOfLines = 0
        subTitle.adjustsFontSizeToFitWidth = true
    }
    
    func setContainerConstraints(){
        container.translatesAutoresizingMaskIntoConstraints = false
        container.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        container.heightAnchor.constraint(equalToConstant: 80).isActive = true
        container.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func setTitleConstraints(){
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: container.topAnchor, constant: 5).isActive = true
        title.leadingAnchor.constraint(equalTo: container.trailingAnchor, constant: 10).isActive = true
        title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
    
    func setSubTitleConstraints(){
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5).isActive = true
        subTitle.leadingAnchor.constraint(equalTo: container.trailingAnchor, constant: 10).isActive = true
        subTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
}
