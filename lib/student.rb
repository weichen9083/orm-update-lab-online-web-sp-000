require_relative "../config/environment.rb"

class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]
  attr_accessor :id, :name, :grade
  
  def initialize(id = nil, name, grade)
    @id = id
    @name = name
    @grade = grade 
  end 
  
  def self.create_table
    sql = "create table students(id INTEGER PRIMARY KEY, name TEXT, grade INTEGER)"
    
    DB[:conn].execute(sql)
    
  end 


end