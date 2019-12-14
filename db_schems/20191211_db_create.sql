DROP TABLE IF EXISTS `administrators`;
CREATE TABLE `administrators` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `grade_id` bigint NOT NULL COMMENT 'グレードID',
  `email` varchar(255) COMMENT 'メール',
  `password` varchar(255) COMMENT 'パスワード',
  `name` varchar(255) COMMENT '名前',
  `name_kana` varchar(255) NOT NULL COMMENT 'カタカナ',
  `sex` char(1) COMMENT '性別(M:男性、F:女性、E:その他）',
  `date_of_birth` date COMMENT '生年月日',
  `image_path` varchar(255) COMMENT 'イメージ',
  `explain` text COMMENT '説明',
  `del_flg` char(1) NOT NULL default 'N' COMMENT '削除フラグ(Y:削除済み、N:未削除)',
  `created_at` datetime NOT NULL COMMENT '登録日時',
  `modified_at` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`),
  KEY `ix_gradeid` (`grade_id`)
);


DROP TABLE IF EXISTS `user_points`;
CREATE TABLE `user_points` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint NOT NULL COMMENT 'ユーザID',
  `point_type` char(4) NOT NULL COMMENT 'ポイントタイプ',
  `point_amount` int(11) COMMENT 'ポイント',
  `end_at` datetime COMMENT '名前',
  `del_flg` char(1) NOT NULL default 'N' COMMENT '削除フラグ(Y:削除済み、N:未削除)',
  `created_at` datetime NOT NULL COMMENT '登録日時',
  `modified_at` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`),
  KEY `ix_pointtype_userid` (`point_type`, `user_id`),
  KEY `ix_pointtype_pointamount` (`point_type`, `point_amount`)
);


DROP TABLE IF EXISTS `message_boxes`;
CREATE TABLE `message_boxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `send_user_id` bigint NOT NULL COMMENT '差出人ユーザID',
  `receive_user_id` bigint NOT NULL COMMENT '宛先ユーザID',
  `title` varchar(255) COMMENT 'タイトル',
  `content` text COMMENT '内容',
  `protect_flg` char(1) COMMENT '保護フラグ',
  `message_box_id` bigint COMMENT '親メッセージID',
  `received_at` datetime COMMENT '受信日時',
  `del_flg` char(1) NOT NULL default 'N' COMMENT '削除フラグ(Y:削除済み、N:未削除)',
  `created_at` datetime NOT NULL COMMENT '登録日時',
  `modified_at` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`),
  KEY `ix_senduserid_receiveuserid` (`send_user_id`, `receive_user_id`)
);


DROP TABLE IF EXISTS `grades`;
CREATE TABLE `grades` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `div` char(1) NOT NULL COMMENT '区分',
  `name` varchar(255) NOT NULL COMMENT '名前',
  `name_kana` varchar(255) NOT NULL COMMENT 'カタカナ',
  `grade` int(11) NOT NULL COMMENT 'グレード',
  `explain` varchar(255) COMMENT '説明',
  `del_flg` char(1) NOT NULL default 'N' COMMENT '削除フラグ(Y:削除済み、N:未削除)',
  `created_at` datetime NOT NULL COMMENT '登録日時',
  `modified_at` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `pet_categories`;
CREATE TABLE `pet_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '種類名',
  `name_kana` varchar(255) NOT NULL COMMENT '種類名カナ',
  `explain` text COMMENT '説明',
  `feature` text COMMENT '特徴',
  `caution` text COMMENT '注意事項',
  `orderby` int(11) COMMENT '表示順序',
  `del_flg` char(1) NOT NULL default 'N' COMMENT '削除フラグ(Y:削除済み、N:未削除)',
  `created_at` datetime NOT NULL COMMENT '登録日時',
  `modified_at` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `pet_varieties`;
CREATE TABLE `pet_varieties` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '種類名',
  `name_kana` varchar(255) NOT NULL COMMENT '種類名カナ',
  `explain` text COMMENT '説明',
  `feature` text COMMENT '特徴',
  `caution` text COMMENT '注意事項',
  `orderby` int(11) COMMENT '表示順序',
  `del_flg` char(1) NOT NULL default 'N' COMMENT '削除フラグ(Y:削除済み、N:未削除)',
  `created_at` datetime NOT NULL COMMENT '登録日時',
  `modified_at` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`)
);


DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `board_id` bigint NOT NULL COMMENT 'コミュニティボードID',
  `user_id` bigint NOT NULL COMMENT 'ユーザーID',
  `title` varchar(255) COMMENT 'タイトル',
  `content` text COMMENT '本文',
  `orderby` int(11) COMMENT '表示順',
  `report_flg` char(1) COMMENT '通報フラグ（Y:通報された場合、N:通報されていない）',
  `attention_flg` char(1) COMMENT '注目フラグ（Y:注目有、N:注目無）',
  `del_flg` char(1) NOT NULL default 'N' COMMENT '削除フラグ(Y:削除済み、N:未削除)',
  `created_at` datetime NOT NULL COMMENT '登録日時',
  `modified_at` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`)
);


DROP TABLE IF EXISTS `boards`;
CREATE TABLE `boards` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `board_type` bigint NOT NULL COMMENT 'コミュニティボード種別',
  `user_id` bigint NOT NULL COMMENT 'ユーザーID',
  `administrator_id` bigint NOT NULL COMMENT '管理者ID',
  `title` varchar(255) NOT NULL COMMENT 'タイトル',
  `sub_title` varchar(255) COMMENT 'サブタイトル',
  `main_image_path` varchar(255) COMMENT 'メインイメージ',
  `sub_image_path` varchar(255) COMMENT 'サブイメージ',
  `youtube_link` text COMMENT 'ユーチューブリンク',
  `upload_file_path` varchar(255) COMMENT 'アップロードファイルパス',
  `tags` varchar(255) COMMENT 'タグ',
  `content` text NOT NULL COMMENT '本文',
  `priority` int(11) NOT NULL COMMENT '優先度',
  `orderby` int(11) NOT NULL COMMENT '表示順',
  `read_count` int(11) NOT NULL default 0 COMMENT '閲覧カウント',
  `main_flg` char(1) NOT NULL default 'N'COMMENT 'メインフラグ（Y:メイン、N:メインでない）',
  `del_flg` char(1) NOT NULL default 'N' COMMENT '削除フラグ(Y:削除済み、N:未削除)',
  `created_at` datetime NOT NULL COMMENT '登録日時',
  `modified_at` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`),
  KEY `ix_boardtype` (`board_type`),
  KEY `ix_userid_administratorid` (`user_id`,`administrator_id`)
);


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `email` varchar(255) NOT NULL COMMENT 'メール',
  `display_name` varchar(255) NOT NULL COMMENT '表示名',
  `password` varchar(255) NOT NULL COMMENT 'パスワード',
  `sex` char(1) COMMENT '性別(M:男性、F:女性、E:その他）',
  `date_of_birth` date COMMENT '生年月日',
  `grade_id` int(11) NOT NULL COMMENT 'グレードID',
  `prefecture_id` int(11) unsigned COMMENT '都道府県ID',
  `area_id` int(11) unsigned COMMENT 'エリアID',
  `address` varchar(255) COMMENT '住所',
  `name` varchar(255) COMMENT '名前',
  `name_kana` varchar(255) COMMENT 'カタカナ',
  `phone_number` varchar(255) COMMENT '電話番号',
  `image_path` varchar(255) COMMENT 'イメージ',
  `about_me` text COMMENT '自己紹介',
  `settlement_id` bigint unsigned COMMENT '決済情報ID',
  `evaluate_id` bigint unsigned COMMENT '評価ID',
  `info_mail_flg` char(1) NOT NULL default 'N' COMMENT '情報メールフラグ(Y:同意、N:拒否)',
  `mail_magazine_flg` char(1) NOT NULL default 'N' COMMENT 'メールマガジン受信フラグ(Y:同意、N:拒否)',
  `push_alert_flg` char(1) NOT NULL default 'N'  COMMENT 'PUSH許可フラグ(Y:許可、N:拒否)',
  `restriction_flg` char(1) NOT NULL default 'N'  COMMENT '利用停止制限フラグ(Y:制限、N:制限なし)',
  `mail_certificated_flg` char(1) NOT NULL default 'N'  COMMENT 'メール認証(Y:認証済み、N:未認証)',
  `phone_certificated_flg` char(1) NOT NULL default 'N'  COMMENT '電話認証(Y:認証済み、N:未認証)',
  `mail_certificate_date` datetime COMMENT 'メール認証送信日付',
  `phone_certificate_date` datetime COMMENT '電話認証送信日付',
  `recent_login_date` datetime COMMENT '最近ログイン日付',
  `recent_login_ip` varchar(255) COMMENT '最近ログインIP',
  `recent_login_device` varchar(255) COMMENT '最近ログインDevice',
  `recent_login_os_version` varchar(255) COMMENT '最近ログインOS Version',
  `del_flg` char(1) NOT NULL default 'N' COMMENT '削除フラグ(Y:削除済み、N:未削除)',
  `created_at` datetime NOT NULL COMMENT '登録日時',
  `modified_at` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`),
  KEY `ix_gradeid_id` (`grade_id`,`id`)
);


DROP TABLE IF EXISTS `trades`;
CREATE TABLE `trades` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `div` char(1) NOT NULL COMMENT '区分',
  `user_id` bigint NOT NULL COMMENT 'ユーザーID',
  `pet_category_id` int(11) COMMENT 'ペット種類ID',
  `pet_variety_id` int(11) COMMENT 'ペット品種ID',
  `title` varchar(255) NOT NULL COMMENT 'タイトル',
  `sub_title` varchar(255) COMMENT 'サブタイトル',
  `content` text COMMENT '本文',
  `caution` text COMMENT '注意事項',
  `phone_number` varchar(255) COMMENT '電話番号',
  `mobile_number` varchar(255) COMMENT '携帯番号',
  `prefecture_id` int(11) COMMENT '都道府県ID',
  `area_id` int(11) COMMENT '地域ID',
  `address` varchar(255) COMMENT '住所',
  `pay_amount` int(11) COMMENT '支払い金額',
  `read_count` int(11) NOT NULL default 0 COMMENT '閲覧カウント',
  `main_flg` char(1) NOT NULL default 'N'COMMENT 'メインフラグ（Y:メイン、N:メインでない）',
  `attention_flg` char(1) COMMENT '注目フラグ（Y:注目有、N:注目無）',
  `complete_flg` char(1) NOT NULL default 'N' COMMENT '完了フラグ(Y:完了、N:未完了)',
  `report_flg` char(1) COMMENT '通報フラグ（Y:通報された場合、N:通報されていない）',
  `del_flg` char(1) NOT NULL default 'N' COMMENT '削除フラグ(Y:削除済み、N:未削除)',
  `created_at` datetime NOT NULL COMMENT '登録日時',
  `modified_at` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`),
  KEY `ix_petcategoryid_petvarietyid_userid` (`pet_category_id`,`pet_variety_id`, `user_id`),
  KEY `ix_prefectureid_area_id` (`prefecture_id`,`area_id`),
  KEY `ix_payamount` (`pay_amount`)
);


DROP TABLE IF EXISTS `care_requests`;
CREATE TABLE `care_requests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `div` char(1) NOT NULL COMMENT '区分',
  `user_id` bigint NOT NULL COMMENT 'ユーザーID',
  `pet_id` bigint NOT NULL COMMENT 'ペット種類ID',
  `title` varchar(255) NOT NULL COMMENT 'タイトル',
  `sub_title` varchar(255) COMMENT 'サブタイトル',
  `content` text COMMENT '内容',
  `caution` text COMMENT '注意事項',
  `phone_number` varchar(255) COMMENT '電話番号',
  `mobile_number` varchar(255) COMMENT '携帯番号',
  `start_at` datetime COMMENT '開始日時',
  `end_at` datetime COMMENT '終了日時',
  `prefecture_id` int(11) COMMENT '都道府県ID',
  `area_id` int(11) COMMENT '地域ID',
  `address` varchar(255) COMMENT '住所',
  `pay_amount` int(11) COMMENT '支払い金額',
  `read_count` int(11) NOT NULL default 0 COMMENT '閲覧カウント',
  `main_flg` char(1) NOT NULL default 'N'COMMENT 'メインフラグ（Y:メイン、N:メインでない）',
  `attention_flg` char(1) COMMENT '注目フラグ（Y:注目有、N:注目無）',
  `complete_flg` char(1) NOT NULL default 'N' COMMENT '完了フラグ(Y:完了、N:未完了)',
  `report_flg` char(1) COMMENT '通報フラグ（Y:通報された場合、N:通報されていない）',
  `del_flg` char(1) NOT NULL default 'N' COMMENT '削除フラグ(Y:削除済み、N:未削除)',
  `created_at` datetime NOT NULL COMMENT '登録日時',
  `modified_at` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`),
  KEY `ix_pet_id_userid` (`pet_id`, `user_id`),
  KEY `ix_prefectureid_area_id` (`prefecture_id`,`area_id`),
  KEY `ix_payamount` (`pay_amount`)
);


DROP TABLE IF EXISTS `settlements`;
CREATE TABLE `settlements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `settlement_info_id` bigint NOT NULL COMMENT '決済情報ID',
  `settlement_at` datetime NOT NULL COMMENT '決済日時',
  `memo` varchar(255) NOT NULL COMMENT 'メモ',
  `token` varchar(255) NOT NULL COMMENT 'トークン',
  `complete_flg` char(1) NOT NULL default 'N' COMMENT '完了フラグ(Y:完了、N:未完了)',
  `del_flg` char(1) NOT NULL default 'N' COMMENT '削除フラグ(Y:削除済み、N:未削除)',
  `created_at` datetime NOT NULL COMMENT '登録日時',
  `modified_at` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`),
  KEY `ix_settlementinfoid_settlement_at` (`settlement_info_id`, `settlement_at`)
);


DROP TABLE IF EXISTS `settlement_infos`;
CREATE TABLE `settlement_infos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bank_id` bigint NOT NULL COMMENT '銀行ID',
  `branch_office_id` bigint NOT NULL COMMENT '支店ID',
  `account` varchar(255) NOT NULL COMMENT '口座番号',
  `host_name` varchar(255) NOT NULL COMMENT '口座上の名前',
  `user_id` bigint NOT NULL COMMENT 'ユーザーID',
  `shop_id` bigint NOT NULL COMMENT 'ショップID',
  `del_flg` char(1) NOT NULL default 'N' COMMENT '削除フラグ(Y:削除済み、N:未削除)',
  `created_at` datetime NOT NULL COMMENT '登録日時',
  `modified_at` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`),
  KEY `ix_bankid_branchofficeid_userid` (`bank_id`, `branch_office_id`, `user_id`),
  KEY `ix_shopid_userid` (`shop_id`, `user_id`)
);


DROP TABLE IF EXISTS `evaluates`;
CREATE TABLE `evaluates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint NOT NULL COMMENT 'ユーザーID',
  `rate` float NOT NULL COMMENT '評価',
  `shop_id` bigint NOT NULL COMMENT 'ショップID',
  `target_user_id` bigint NOT NULL COMMENT 'ターゲットユーザーID',
  `memo` bigint NOT NULL COMMENT 'メモ',
  `del_flg` char(1) NOT NULL default 'N' COMMENT '削除フラグ(Y:削除済み、N:未削除)',
  `created_at` datetime NOT NULL COMMENT '登録日時',
  `modified_at` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`),
  KEY `ix_rate` (`rate`),
  KEY `ix_targetuserid_userid` (`target_user_id`, `user_id`),
  KEY `ix_shopid_userid` (`shop_id`, `user_id`)
);


DROP TABLE IF EXISTS `favorites`;
CREATE TABLE `favorites` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint NOT NULL COMMENT 'ユーザーID',
  `shop_id` bigint NOT NULL COMMENT 'ショップID',
  `div` char(1) NOT NULL COMMENT '区分',
  `del_flg` char(1) NOT NULL default 'N' COMMENT '削除フラグ(Y:削除済み、N:未削除)',
  `created_at` datetime NOT NULL COMMENT '登録日時',
  `modified_at` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`),
  KEY `ix_shopid_userid` (`shop_id`, `user_id`)
);


DROP TABLE IF EXISTS `reports`;
CREATE TABLE `reports` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint NOT NULL COMMENT 'ユーザーID',
  `target_user_id` bigint NOT NULL COMMENT 'ターゲットユーザーID',
  `shop_id` bigint COMMENT 'ショップID',
  `message_box_id` bigint COMMENT 'メッセージID',
  `care_request_id` bigint COMMENT 'ペットケア依頼ID',
  `trade_id` bigint COMMENT 'トレードID'
  `comment_id` bigint COMMENT 'コメントID'
  `like_id` bigint COMMENT 'いいねID'
  `reason` text NOT NULL COMMENT '理由',
  `del_flg` char(1) NOT NULL default 'N' COMMENT '削除フラグ(Y:削除済み、N:未削除)',
  `created_at` datetime NOT NULL COMMENT '登録日時',
  `modified_at` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`),
  KEY `ix_userid` (`user_id`)
);

DROP TABLE IF EXISTS `banners`;
CREATE TABLE `banners` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `administrator_id` bigint NOT NULL COMMENT '管理者ID',
  `shop_id` bigint COMMENT 'ショップID',
  `board_type` bigint NOT NULL COMMENT 'コミュニティボード種別',
  `prefecture_id` int(11) COMMENT '都道府県ID',
  `area_id` int(11) COMMENT '地域ID',
  `title` varchar(255) NOT NULL COMMENT 'タイトル',
  `sub_title` varchar(255) COMMENT 'サブタイトル',
  `alt` varchar(255) COMMENT 'アルト',
  `start_at` datetime COMMENT '開始日時',
  `end_at` datetime COMMENT '終了日時',
  `image_path` varchar(255) COMMENT 'メインイメージ',
  `link` varchar(255) COMMENT 'リンク先',
  `memo` varchar(255) COMMENT 'メモ',
  `priority` int(11) COMMENT '優先度',
  `orderby` int(11) COMMENT '表示順',
  `own_made_flg` char(1) COMMENT '自作フラグ（Y:自作、N:自作でない）',
  `main_flg` char(1) COMMENT 'メイン掲載フラグ（Y:メイン掲載する、N:メイン掲載しない）',
  `del_flg` char(1) NOT NULL default 'N' COMMENT '削除フラグ(Y:削除済み、N:未削除)',
  `created_at` datetime NOT NULL COMMENT '登録日時',
  `modified_at` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`),
  KEY `ix_administratorid_shopid` (`administrator_id`,`shop_id`),
  KEY `ix_prefectureid_area_id` (`prefecture_id`,`area_id`),
  KEY `ix_boardtype` (`board_type`)
);


DROP TABLE IF EXISTS `shops`;
CREATE TABLE `shops` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `shop_type` char(1) NOT NULL COMMENT '管理者ID',
  `prefecture_id` int(11) COMMENT '都道府県ID',
  `area_id` int(11) COMMENT '地域ID',
  `address` varchar(255) COMMENT '住所',
  `name` varchar(255) COMMENT '名前',
  `name_kana` varchar(255) NOT NULL COMMENT 'カタカナ',
  `sub_name` varchar(255) NOT NULL COMMENT '保護ショップ名前',
  `display_name` varchar(255) NOT NULL COMMENT '表示名',
  `manager_name` varchar(255) NOT NULL COMMENT '担当者名前',
  `manager_name_kana` varchar(255) NOT NULL COMMENT '担当者名前カナ',
  `email` varchar(255) NOT NULL COMMENT 'メール',
  `password` varchar(255) NOT NULL COMMENT 'パスワード',
  `phone_number` varchar(255) COMMENT '電話番号',
  `mobile_number` varchar(255) COMMENT '携帯番号',
  `fax_number` varchar(255) COMMENT 'fax番号',
  `main_image_path` varchar(255) COMMENT 'メインイメージ',
  `sub_image_path` varchar(255) COMMENT 'サブイメージ',
  `explain_first` text COMMENT 'ショップ説明1',
  `explain_second` text COMMENT 'ショップ説明2',
  `explain_third` text COMMENT 'ショップ説明3',
  `grade_id` bigint NOT NULL COMMENT 'グレードID',
  `settlement_id` bigint unsigned COMMENT '決済情報ID',
  `rate_average` float NOT NULL default 0 COMMENT '平均評価',
  `info_mail_flg` char(1) NOT NULL default 'N' COMMENT '情報メールフラグ(Y:同意、N:拒否)',
  `mail_magazine_flg` char(1) NOT NULL default 'N' COMMENT 'メールマガジン受信フラグ(Y:同意、N:拒否)',
  `push_alert_flg` char(1) NOT NULL default 'N'  COMMENT 'PUSH許可フラグ(Y:許可、N:拒否)',
  `restriction_flg` char(1) NOT NULL default 'N'  COMMENT '利用停止制限フラグ(Y:制限、N:制限なし)',
  `mail_certificated_flg` char(1) NOT NULL default 'N'  COMMENT 'メール認証(Y:認証済み、N:未認証)',
  `phone_certificated_flg` char(1) NOT NULL default 'N'  COMMENT '電話認証(Y:認証済み、N:未認証)',
  `mail_certificate_date` datetime COMMENT 'メール認証送信日付',
  `phone_certificate_date` datetime COMMENT '電話認証送信日付',
  `del_flg` char(1) NOT NULL default 'N' COMMENT '削除フラグ(Y:削除済み、N:未削除)',
  `created_at` datetime NOT NULL COMMENT '登録日時',
  `modified_at` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`),
  KEY `ix_prefectureid_area_id` (`prefecture_id`,`area_id`),
  KEY `ix_shoptype` (`shop_type`)
);


DROP TABLE IF EXISTS `pets`;
CREATE TABLE `pets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint NOT NULL COMMENT 'ユーザーID',
  `pet_category_id` int(11) COMMENT 'ペット種類ID',
  `pet_variety_id` int(11) COMMENT 'ペット品種ID',
  `name` varchar(255) NOT NULL COMMENT '名前',
  `sex` char(1) COMMENT '性別(M:男性、F:女性、E:その他）',
  `date_of_birth` date COMMENT '生年月日',
  `start_date` date COMMENT '飼い始めた年月日',
  `character` text COMMENT '性格',
  `about` text COMMENT '紹介',
  `del_flg` char(1) NOT NULL default 'N' COMMENT '削除フラグ(Y:削除済み、N:未削除)',
  `created_at` datetime NOT NULL COMMENT '登録日時',
  `modified_at` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`),
  KEY `ix_petcategoryid_petvarietyid_userid` (`pet_category_id`,`pet_variety_id`, `user_id`),
  KEY `ix_startdate_userid` (`start_date`, `user_id`)
);

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` char(1) NOT NULL COMMENT '通知種別',
  `user_id` bigint NOT NULL COMMENT 'ユーザーID',
  `pet_id` int(11) NOT NULL COMMENT 'ペットID',
  `action_date` datetime COMMENT 'アクションがあった日時',
  `next_date` datetime COMMENT '次回送信日付',
  `alert_on_flg` char(1) NOT NULL default 'N' NOT NULL COMMENT '通知ONフラグ(Y:On、N:Off)',
  `repeat_flg` char(1) NOT NULL default 'N' COMMENT '繰り返しフラグ(Y:繰り返し有、N:繰り返し無)',
  `complete_flg` char(1) NOT NULL default 'N' COMMENT '完了フラグ(Y:完了、N:未完了)',
  `del_flg` char(1) NOT NULL default 'N' COMMENT '削除フラグ(Y:削除済み、N:未削除)',
  `created_at` datetime NOT NULL COMMENT '登録日時',
  `modified_at` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`),
  KEY `ix_petid_userid` (`pet_id`, `user_id`),
  KEY `ix_actiondate_userid` (`action_date`, `user_id`),
  KEY `ix_actiondate_petid` (`action_date`, `pet_id`)
);


DROP TABLE IF EXISTS `areas`;
CREATE TABLE `areas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `prefecture_id` bigint NOT NULL COMMENT '都道府県ID',
  `name` bigint NOT NULL COMMENT 'エリア名',
  `name_kana` bigint NOT NULL COMMENT 'エリア名カナ',
  `del_flg` char(1) NOT NULL default 'N' COMMENT '削除フラグ(Y:削除済み、N:未削除)',
  `created_at` datetime NOT NULL COMMENT '登録日時',
  `modified_at` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `prefectures`;
CREATE TABLE `prefectures` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `region_id` bigint NOT NULL COMMENT '地域ID',
  `name` bigint NOT NULL COMMENT '都道府県名',
  `name_kana` bigint NOT NULL COMMENT '都道府県名カナ',
  `del_flg` char(1) NOT NULL default 'N' COMMENT '削除フラグ(Y:削除済み、N:未削除)',
  `created_at` datetime NOT NULL COMMENT '登録日時',
  `modified_at` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `regions`;
CREATE TABLE `regions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` bigint NOT NULL COMMENT '地域名',
  `name_kana` bigint NOT NULL COMMENT '地域名カナ',
  `del_flg` char(1) NOT NULL default 'N' COMMENT '削除フラグ(Y:削除済み、N:未削除)',
  `created_at` datetime NOT NULL COMMENT '登録日時',
  `modified_at` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `branch_offices`;
CREATE TABLE `branch_offices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bank_id` bigint NOT NULL COMMENT '銀行ID',
  `name` varchar(255) NOT NULL COMMENT '支店名',
  `name_kana` varchar(255) NOT NULL COMMENT '支店名カナ',
  `number` varchar(255) NOT NULL COMMENT '支店番号',
  `del_flg` char(1) NOT NULL default 'N' COMMENT '削除フラグ(Y:削除済み、N:未削除)',
  `created_at` datetime NOT NULL COMMENT '登録日時',
  `modified_at` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `banks`;
CREATE TABLE `banks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '銀行名',
  `name_kana` varchar(255) NOT NULL COMMENT '銀行名カナ',
  `del_flg` char(1) NOT NULL default 'N' COMMENT '削除フラグ(Y:削除済み、N:未削除)',
  `created_at` datetime NOT NULL COMMENT '登録日時',
  `modified_at` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`)
);
