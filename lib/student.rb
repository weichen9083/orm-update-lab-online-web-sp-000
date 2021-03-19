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
  
  def self.drop_table 
    sql = "drop table students"
    
    DB[:conn].execute(sql)
  end 
  
  def save
    if self.id 
      self.update 
    else 
    sql = "insert into students(name, grade) values (?,?)"
    DB[:conn].execute(sql,self.name,self.grade)
    
    self.id = DB[:conn].execute("select last_insert_rowid() from students")[0][0]
   end 
    
  end 
    


end