# テーブル設計

## users

| Column              | Type   | Option                    |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| last_name_kanji     | string | null: false               |
| first_name_kanji    | string | null: false               |
| last_name_katakana  | string | null: false               |
| first_name_katakana | string | null: false               |
| birthday            | date   | null: false               |

### association

- has_many :items
- has_many :orders

## items

| Column              | Type       | Option                         |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| description         | string     | null: false                    |
| category_id         | integer    | null: false                    |
| status_id           | integer    | null: false                    |
| shipping_charges_id | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| days_to_ship_id     | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### association

- belongs_to :user
- has_one :order

## orders

| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses

| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### association

- belongs_to :order