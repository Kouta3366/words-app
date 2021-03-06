class User < ApplicationRecord
  validates :login_id, {presence:true, length:{maximum: 15}, uniqueness:true}
  validates :name, {presence:true, length:{maximum: 4}}
  validates :password, {presence:true, length:{maximum: 15}}
end
