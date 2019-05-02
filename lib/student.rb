class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]  
  attr_accessor :name, :grade
  attr_reader :id

  def initialize(name, grade, id = nil)
    @name = name
    @grade = grade
  end

  def self.create_table
    sql = <<-query
    CREATE TABLE IF NOT EXISTS students (
      id INTEGER PRIMARY KEY,
      name TEXT,
      grade INTEGER
    );
    query

    DB[:conn].execute(sql)
  end
  
  def self.drop_table
    sql = <<-query
    DROP TABLE students;
    query
    DB[:conn].execute(sql)
  end

  def save
    sql = <<-query
      INSERT INTO students (name, grade) 
      VALUES (?,?);
    query

    DB[:conn].execute(sql, self.name, self.grade)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
  end

  def self.create(name:, grade:)
    temp = self.new(name, grade)
    temp.save
    return temp
  end
end
