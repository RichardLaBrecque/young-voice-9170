class Student <ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true, numericality: true
  validates :house, presence: true
has_many :professor_students
has_many :professors, through: :professor_students
end
