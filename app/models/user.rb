class User < ActiveRecord::Base
  attr_accessible :name



  has_many :manages
  has_many :direct_reports, :class_name => "User", :through => :manages, :foreign_key => 'direct_report_id'

  has_many :reports_to, :class_name => "User", :through => :manages, :foreign_key => 'direct_report_id', source: :manages
end
