//
//  ViewController.swift
//  VideoSearchApp
//
//  Created by 吉澤優衣 on 2019/08/18.
//  Copyright © 2019 吉澤優衣. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 検索ワード入力欄
    @IBOutlet weak var searchTextField: UITextField!



    override func viewDidLoad() {
        super.viewDidLoad()
    }


    // 検索ボタンタップ
    @IBAction func searchButton(_ sender: Any) {
        guard let txt = searchTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !txt.isEmpty else {
            print("不正な検索ワードです。")
            return
        }

        print("検索ワード:\(txt)")
        let nc = VideoListTableViewController.makeInstance(searchWord: txt)
        self.navigationController?.pushViewController(nc, animated: true)

    }

}

