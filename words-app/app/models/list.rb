class List < ApplicationRecord
  validates :list_name, {presence:true, length:{maximum: 6}}
end
