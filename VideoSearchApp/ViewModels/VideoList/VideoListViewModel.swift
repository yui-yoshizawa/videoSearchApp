//
//  VideoListViewModel.swift
//  VideoSearchApp
//
//  Created by 吉澤優衣 on 2019/08/18.
//  Copyright © 2019 吉澤優衣. All rights reserved.
//

import UIKit

class VideoListViewModel {

    // 動画一覧情報
    var videoList: [VideoDataEntity] = []

    /**
     *  Modelからデータを取得
     *  - Parameters:
     *    - searchWord: 検索ワード
     *    - completion: データ取得完了を通知するクロージャー
     *  - Note:
     *  Modelは非同期通信のため、完了後にcompletionで通知する。
     */
    func fetch(searchWord: String, completion: @escaping () -> ()) {
        VideoListModel().fetch(searchWord: searchWord) { [weak self] (videoList) in
            self?.videoList = videoList
            completion()
        }
    }

}


