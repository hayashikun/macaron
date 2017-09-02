//
//  MacaronViewController.swift
//  macaron
//
//  Created by Ryosuke Hayashi on 2017/08/26.
//  Copyright © 2017年 yagra. All rights reserved.
//

import UIKit

open class MacaronViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private var macaronTableView: UITableView!
    private var macaronCellData: [MacaronCellDataType] = []
    private var cellHeight: [CGFloat] = []

    public func initialize(tableView: UITableView, cellData: [MacaronCellDataType]) {
        macaronTableView = tableView
        macaronTableView.delegate = self
        macaronTableView.dataSource = self
        macaronCellData = cellData
        cellHeight = [CGFloat](repeating: 0.0, count: cellData.count)
        for cell in Set(cellData.map{$0.CellClassName}) {
            var bundle = Bundle.main
            if let _ = Config.MacaronBundle.path(forResource: cell, ofType: "nib") {
                bundle = Config.MacaronBundle
            }
            tableView.register(UINib(nibName: cell, bundle: bundle), forCellReuseIdentifier: cell)
        }
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return macaronCellData.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var data = macaronCellData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: data.CellClassName,
                                                 for: indexPath) as! MacaronCellType
        cell.assign(data: &data)
        cellHeight[indexPath.row] = cell.getRowHeight()
        return cell as! UITableViewCell
    }

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight[indexPath.row]
    }
}
