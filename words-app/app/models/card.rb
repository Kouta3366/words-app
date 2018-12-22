class Card < ApplicationRecord
  validates :word, {presence:true, length:{maximum: 28}}
  validates :meaning, {presence:true, length:{maximum: 44}}
end
