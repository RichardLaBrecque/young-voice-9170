class Professor <ApplicationRecord
# IC START
validates :name, presence: true
validates :age, presence: true, numericality: true
validates :specialty, presence: true

has_many :professor_students
has_many :students, through: :professor_students


end
