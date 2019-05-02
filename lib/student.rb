class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]  
  attr_accessor :name, :grade
  attr_reader :id

  def initialize(name, grade, id = nil)
    @name = name
    @grade = grade
    @id =id

  end

  # creates the students table in the database,
  def self.create_table

  end

  def new_instance_and_save
  end

  def self.save_individual
  end


  # a method that can drop that table
  def destroy(table)
  end

  
  #save, that can save the data concerning an individual student object to the database.
  

end
