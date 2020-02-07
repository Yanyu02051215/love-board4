class Age < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
      { id: 1, value: '10代後半' },
      { id: 2, value: '20代前半' },
      { id: 3, value: '20代後半' },
      { id: 4, value: '30代前半' },
      { id: 5, value: '30代後半' },
      { id: 6, value: '40代前半' },
      { id: 7, value: '40代後半' },
      { id: 8, value: '50代' },
      { id: 9, value: '60代' }
  ]
end