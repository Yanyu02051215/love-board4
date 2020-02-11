class Category < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
      { id: "lovingexpression", value: '愛情表現' },
      { id: "longrangelove", value: '遠距離恋愛' },
      { id: "rundown", value: '駆け落ち' },
      { id: "koikatsu", value: '恋活' },
      { id: "marriage", value: '婚活' },
      { id: "triangle", value: '三角関係' },
      { id: "jealousy", value: '嫉妬' },
      { id: "brokenheart", value: '失恋' },
      { id: "workromance", value: '職場恋愛' },
      { id: "sexless", value: 'セックスレス' },
      { id: "sex", value: 'セックス' },
      { id: "kiss", value: '接吻' },
      { id: "polysexuality", value: '多性愛' },
      { id: "date", value: 'デート' },
      { id: "cohabitation", value: '同棲' },
      { id: "nampa", value: 'ナンパ' },
      { id: "catastrophic", value: '破局' },
      { id: "firstlove", value: '初恋' },
      { id: "firstglance", value: '一目ぼれ' },
      { id: "dried", value: '妾' },
      { id: "concubine", value: '略奪愛' },
      { id: "plunderlove", value: '両性愛' },
      { id: "affair", value: '不倫' },
      { id: "divorce", value: '離婚' }
  ]
end