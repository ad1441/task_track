class Assignment < ActiveRecord::Base
  belongs_to :project , :class_name => "Project", :foreign_key => "project_id"
  validates :date_due, :presence => true
  validates :name, :presence => true

end
