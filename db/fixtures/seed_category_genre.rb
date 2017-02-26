Category.seed(:id,
  {id:1, name:"自然景観", sort:1},
  {id:2, name:"公園・庭園", sort:2},
  {id:3, name:"イベント", sort:3},
  {id:4, name:"スポーツ・レジャー", sort:4},
)
Genre.seed(:id,
  {id:1,  category_id:1, name:"山岳", keyword:"山岳", sort:1},
  {id:2,  category_id:1, name:"高原", keyword:"高原", sort:2},
  {id:3,  category_id:1, name:"湖沼", keyword:"湖沼", sort:3},
  {id:4,  category_id:2, name:"公園", keyword:"公園", sort:1},
  {id:5,  category_id:2, name:"庭園", keyword:"庭園", sort:2},
  {id:6,  category_id:3, name:"行事・祭事", keyword:"行事・祭事", sort:1},
  {id:7,  category_id:3, name:"花火大会", keyword:"花火大会", sort:2},
  {id:8,  category_id:4, name:"キャンプ場", keyword:"キャンプ場", sort:1},
  {id:9,  category_id:4, name:"フィールド・アスレチック", keyword:"フィールド・アスレチック", sort:2},
  {id:10, category_id:4, name:"スキー場", keyword:"スキー場", sort:3},
  {id:11, category_id:4, name:"テーマパーク", keyword:"テーマパーク", sort:4},
  {id:12, category_id:4, name:"ハイキングコース", keyword:"ハイキングコース", sort:5},
  {id:13, category_id:4, name:"スポーツ・リゾート施設", keyword:"スポーツ・リゾート施設", sort:6},
)