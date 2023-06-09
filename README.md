# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | -----------              |
| email              | string | null: false ,unique      |
| encrypted_password | string | null: false              |
| name               | string | null: false              |
| nickname           | string | null: false              |
| name_zenkaku       | string | null: false              |
| name_kana          | string | null: false              |
| name_mei           | string | null: false              |
| birthday           | date   | null: false              |

### Association

- has_many :items
- has_many :comments
- has_many :purchases


## comments テーブル

| Column     | Type       | Options                        |
| ------     | ---------- | ------------------------------ |
| content    | text       | null: false                    |
| item_id    | references | null: false, foreign_key       |
| user_id    | references | null: false, foreign_key       |


### Association
- belongs_to :user
- belongs_to :item


## items テーブル
| Column           | Type       | Options                |
| ------           | ------     | -----------            |
| title            | string     | null: false            |
| catch_copy       | text       | null: false            |
| category         | integer    | null: false            |
| situation        | integer    | null: false            |
| load             | integer    | null: false            |
| shipping_area_id | integer    | null: false            |
| delivery_day     | integer    | null: false            |
| price            | string     | null: false            |
| user_id          | references | null: false,foreign_key|


### Association
- belongs_to :user
- has_many :comments
- has_one:purchase



## purchases テーブル
| user_id             | references | null: false,foreign_key|
| item_id             | references | null: false,foreign_key|
| shipping_address_id | references | null: false,foreign_key|

### Association
- belongs_to :user
- belongs_to :item
- has_one:shipping_address


## shipping_addresses テーブル

| Column             | Type       | Options                |
| ------             | ------     | -----------            |
| post_code          | string     | null: false            |
| shipping_area_id   | integer    | null: false            |
| cities             | string     | null: false            |
| number             | string     | null: false            |
| building_name      | string     |                        |
| phone_number       | string     | null: false            |
| purchase_id        | references | null: false            |

### Association
- belongs_to :purchase