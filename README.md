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

| Column           | Type          | Option                         |
| ---------------- | ------------- | ------------------------------ |
| name             | varchar(40)   | null: false                    |
| description      | varchar(1000) | null: false                    |
| category         | string        | null: false                    |
| status           | string        | null: false                    |
| shipping_charges | string        | null: false                    |
| shipping_area    | string        | null: false                    |
| days_to_ship     | string        | null: false                    |
| price            | integer       | null: false                    |
| user             | references    | null: false, foreign_key: true |

### association

- belongs_to :user
- has_one :order

## orders

| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| card_number      | string     | null: false                    |
| expiration_month | integer    | null: false                    |
| expiration_year  | integer    | null: false                    |
| cvc              | integer    | null: false                    |
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
| prefectures   | string     | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### association

- belongs_to :order
