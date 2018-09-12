# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  birth_date  :date
#  color       :string
#  name        :string
#  sex         :string(1)
#  description :text
#

class Cat < ApplicationRecord 
  validates :name, :birth_date, presence: true
  
  has_many :cat_rental_requests, 
    foreign_key: :cat_id, 
    class_name: :CatRentalRequest, 
    dependent: :destroy
  
  def age
    Date.today - Cat.birth_date
  end
  
end 
