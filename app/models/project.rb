class Project < ActiveRecord::Base
  belongs_to :project , :class_name => "Project", :foreign_key => "project_id"
  belongs_to :period , :class_name => "Period", :foreign_key => "period_id"
  has_many :assignments , :class_name => "Assignment", :foreign_key => "project_id"
  validates :name, :presence => true

end
