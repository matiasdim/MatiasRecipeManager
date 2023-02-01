//
//  TestHelpers.swift
//  RecipeManagerTests
//
//  Created by Matías  Gil Echavarría on 31/01/23.
//

import UIKit

func numbersOfRows(in table: UITableView, section: Int) -> Int? {
    table.dataSource?.tableView(table, numberOfRowsInSection: section)
}

func numberOfSections(in table: UITableView) -> Int? {
    table.dataSource?.numberOfSections?(in: table)
}

func cellForRow(in table: UITableView, indexPath: IndexPath) -> UITableViewCell? {
    table.dataSource?.tableView(table, cellForRowAt: indexPath)
}

func didSelectRowAt(in table: UITableView, indexPath: IndexPath) {
    table.delegate?.tableView?(table, didSelectRowAt: indexPath)
}

func exectureRunLoop() {
    RunLoop.current.run(until: Date())
}
