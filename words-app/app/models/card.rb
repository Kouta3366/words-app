class Card < ApplicationRecord
  validates :word, {presence:true, length:{maximum: 6}}
  validates :meaning, {presence:true, length:{maximum: 40}}
end
