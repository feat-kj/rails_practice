Category.seed(:id,
  {id:1, name:"自然景観", sort:1},
  {id:2, name:"公園・庭園", sort:2},
  {id:3, name:"イベント", sort:3},
  {id:4, name:"スポーツ・レジャー", sort:4},
)
Genre.seed(:id,
  {id:1,  category_id:1, name:"山岳", keyword:"%E5%B1%B1%E5%B2%B3", sort:1},
  {id:2,  category_id:1, name:"高原", keyword:"%E9%AB%98%E5%8E%9F", sort:2},
  {id:3,  category_id:1, name:"湖沼", keyword:"%E6%B9%96%E6%B2%BC", sort:3},
  {id:4,  category_id:2, name:"公園", keyword:"%E5%85%AC%E5%9C%92", sort:1},
  {id:5,  category_id:2, name:"庭園", keyword:"%E5%BA%AD%E5%9C%92", sort:2},
  {id:6,  category_id:3, name:"行事・祭事", keyword:"%E8%A1%8C%E4%BA%8B%E3%83%BB%E7%A5%AD%E4%BA%8B", sort:1},
  {id:7,  category_id:3, name:"花火大会", keyword:"%E8%8A%B1%E7%81%AB%E5%A4%A7%E4%BC%9A", sort:2},
  {id:8,  category_id:4, name:"キャンプ場", keyword:"%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%97%E5%A0%B4", sort:1},
  {id:9,  category_id:4, name:"フィールド・アスレチック", keyword:"%E3%83%95%E3%82%A3%E3%83%BC%E3%83%AB%E3%83%89%E3%83%BB%E3%82%A2%E3%82%B9%E3%83%AC%E3%83%81%E3%83%83%E3%82%AF", sort:2},
  {id:10, category_id:4, name:"スキー場", keyword:"%E3%82%B9%E3%82%AD%E3%83%BC%E5%A0%B4", sort:3},
  {id:11, category_id:4, name:"テーマパーク", keyword:"%E3%83%86%E3%83%BC%E3%83%9E%E3%83%91%E3%83%BC%E3%82%AF%E3%83%BB%E3%83%AC%E3%82%B8%E3%83%A3%E3%83%BC%E3%83%A9%E3%83%B3%E3%83%89", sort:4},
  {id:12, category_id:4, name:"ハイキングコース", keyword:"%E3%83%8F%E3%82%A4%E3%82%AD%E3%83%B3%E3%82%B0%E3%82%B3%E3%83%BC%E3%82%B9", sort:5},
  {id:13, category_id:4, name:"スポーツ・リゾート施設", keyword:"%E3%82%B9%E3%83%9D%E3%83%BC%E3%83%84%E3%83%BB%E3%83%AA%E3%82%BE%E3%83%BC%E3%83%88%E6%96%BD%E8%A8%AD", sort:6},
)
