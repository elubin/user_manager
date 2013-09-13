class Manage < ActiveRecord::Base

  attr_accessible :direct_report_id, :user_id


  belongs_to :user
  belongs_to :direct_report, class_name: 'User', foreign_key: :user_id

  #has_many :reports_to, :through => :manages

  #has_one :manager, primary_key: :user_id
  #has_one :direct_report, primary_key: :direct_report_id, foreign_key: :id

  def direct_report_ids
    manages.pluck(:direct_report_id)
  end

end
