class Student
  attr_reader :name, :grade, :id
  
  def initialize(name, grade, id = nil)
    @name = name
    @grade = grade
    @id = id
  end

  def self.create_table
    DB[:conn].execute "
        CREATE TABLE students(id INTEGER PRIMARY KEY, name STRING, grade STRING)"
  end

  def self.drop_table
     DB[:conn].execute "DROP TABLE students"
  end

  def self.all
    DB[:conn].execute "SELECT * FROM students"
  end

  def save
    DB[:conn].execute "INSERT INTO students(name, grade) VALUES (?, ?)", @name, @grade
    @id = Student.all.last[0]
    self
  end

  def self.create(name:, grade:)
    Student.new(name, grade).save
  end
end
