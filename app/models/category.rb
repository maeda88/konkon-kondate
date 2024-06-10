class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '炒める・焼き' },
    { id: 3, name: '煮物' },
    { id: 4, name: '蒸す・ゆでる' },
    { id: 5, name: '揚げ物' },
    { id: 6, name: '生' },
    { id: 7, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :dishes
end
