class Student < ActiveRecord::Base
    validates :name, presence: true
    validates :netid, presence: true, uniqueness: true
end
