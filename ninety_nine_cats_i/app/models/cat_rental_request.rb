# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint(8)        not null, primary key
#  cat_id     :integer          not null
#  start_date :date
#  end_date   :date
#  status     :string           default("PENDING")
#

class CatRentalRequest < ApplicationRecord 
  validates :cat_id, :status, presence: true
  validates :does_not_overlap_approved_request 
  
  belongs_to :cat, 
    foreign_key: :cat_id, 
    class_name: :Cat
    
    def does_not_overlap_approved_request
      !self.overlapping_approved_requests.exists?
    end
    
    def overlapping_requests
      CatRentalRequest.where.not(id: self.id).where(cat_id: self.cat_id)
      .where.not('start_date > :this_end_date OR end_date < :this_start_date ', this_start_date: self.start_date, this_end_date: self.end_date )
    end
    
    def overlapping_approved_requests
      self.overlapping_requests.where(status: 'APPROVED')
    end
end 
