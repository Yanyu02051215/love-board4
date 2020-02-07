class Gender < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
      { id: 1, value: '男性' },
      { id: 2, value: '女性' }
  ]
end