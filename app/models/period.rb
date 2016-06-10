class Period < ActiveRecord::Base
  has_many :projects , :class_name => "Project", :foreign_key => "period_id"
  belongs_to :user
  validates :date_start, :presence => true
  validates :name, :presence => true

end
