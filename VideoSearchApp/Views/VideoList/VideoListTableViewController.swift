//
//  VideoListTableViewController.swift
//  VideoSearchApp
//
//  Created by 吉澤優衣 on 2019/08/18.
//  Copyright © 2019 吉澤優衣. All rights reserved.
//

import UIKit
import SafariServices

class VideoListTableViewController: UITableViewController {

    /// ViewModel
    let viewModel = VideoListViewModel()

    /// 検索ワード
    var searchWord: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.fetch(searchWord: searchWord, completion: {
            self.tableView.reloadData()
        })
    }

    // MARK: - Table view data source

    // セクション数
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // セル数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.videoList.count
    }


    // セルの設定
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VideoListTableViewCell", for: indexPath) as? VideoListTableViewCell else {
            print("VideoListTableViewCell 変換失敗")
            return UITableViewCell()

        }
        cell.configure(item: viewModel.videoList[indexPath.row])

        return cell
    }

    // セルの選択
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = URL(string: "https://www.nicovideo.jp/watch/\(viewModel.videoList[indexPath.row].contentId)") else {
            return
        }
        print(viewModel.videoList[indexPath.row].title)
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
}

extension VideoListTableViewController {

    static func makeInstance(searchWord: String) -> UIViewController {
        // Storyboard`Main`の情報を取得
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        // `VideoListTableViewController`のインスタンスを生成
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "VideoListTableViewController") as? VideoListTableViewController else {
            return UIViewController()
        }
        // 検索ワードに引数で受け取った内容を格納
        vc.searchWord = searchWord
        return vc
    }
}
