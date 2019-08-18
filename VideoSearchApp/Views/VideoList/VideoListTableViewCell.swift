//
//  VideoListTableViewCell.swift
//  VideoSearchApp
//
//  Created by 吉澤優衣 on 2019/08/18.
//  Copyright © 2019 吉澤優衣. All rights reserved.
//

import UIKit
import SDWebImage

class VideoListTableViewCell: UITableViewCell {

    /// 動画タイトル
    @IBOutlet weak var titleLabel: UILabel!
    /// 動画サムネイル
    @IBOutlet weak var videoImage: UIImageView!
    /// 動画再生数
    @IBOutlet weak var countLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(item: VideoDataEntity) {
        titleLabel.text = item.title
        videoImage.sd_setImage(with: URL(string: item.imageUrl))
        countLabel.text = "再生数: \(item.count)"
    }
}
