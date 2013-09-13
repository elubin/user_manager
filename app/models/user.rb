class User < ActiveRecord::Base
  attr_accessible :name



  has_many :manages
  has_many :direct_reports, :class_name => "User", :through => :manages

  # this generates the incorrect "WHERE manages.user_id=1"
  has_many :reports_to, through: :manages, source: :direct_report

  # WORKS!
  # SELECT "users".* FROM "users" INNER JOIN "manages" ON "users"."id" = "manages"."user_id" WHERE "manages"."direct_report_id" = 1;

end
