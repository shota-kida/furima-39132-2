# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | -----------              |
| email              | string | null: false ,ユニーク制約 |
| encrypted_password | string | null: false              |
| name               | string | null: false              |
| nickname           | string | null: false              |
| name_zenkaku       | string | null: false              |
| name_kana          | string | null: false              |
| name_mei           | string | null: false              |
| birthday           | string | null: false              |

### Association

- has_many :items
- has_many :comments


## comments テーブル

| Column     | Type       | Options                        |
| ------     | ---------- | ------------------------------ |
| content    | text       | null: false                    |
| item       | references | null: false, 外部キー           |
| user       | references | null: false, 外部キー           |


### Association
- belongs_to :users
- belongs_to :items


## items テーブル
| Column         | Type       | Options               |
| ------         | ------     | -----------           |
| title          | string     | null: false           |
| catch_copy     | text       | null: false           |
| category       | string     | null: false           |
| situation      | string     | null: false           |
| load           | string     | null: false           |
| shipping_area  | string     | null: false           |
| delivery_day   | string     | null: false           |
| price          | string     | null: false           |
| user           | references | null: false,外部キー   |


### Association
- has_many :users
- has_many :comments
_ has_one:buys


## buys テーブル

| Column             | Type       | Options               |
| ------             | ------     | -----------           |
| post_code          | string     | null: false           |
| prefectures        | string     | null: false           |
| cities             | string     | null: false           |
| number             | string     | null: false           |
| phone_number       | string     | null: false           |
| user               | references | null: false,外部キー   |
| item               | references | null: false, 外部キー  |

### Association

_ has_one:item
