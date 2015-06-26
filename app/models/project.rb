class Project < ActiveRecord::Base

  belongs_to :student

  validates :name, presence: true

  #how about making sure that the project has a student associated w it

end
