class Age < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
      { id: "10later", value: '10代後半' ,name:'10later' },
      { id: "20first", value: '20代前半' },
      { id: "20later", value: '20代後半' },
      { id: "30first", value: '30代前半' },
      { id: "30later", value: '30代後半' },
      { id: "40first", value: '40代前半' },
      { id: "40later", value: '40代後半' },
      { id: "50later", value: '50代' },
      { id: "60later", value: '60代' }
  ]
end