# if you have not installed the needed gems, please do the following:
# gem install sqlite3
# gem install activerecord

require "sqlite3"
require "active_record"

# this line configures ActiveRecord to connect to a sqlite3 database in the same folder named "students.sqlite3"
ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => "./students.sqlite3")

# This sets up ActiveRecord to use Ruby OOP with SQL data
class Student < ActiveRecord::Base
end

#table name is always plural
#class name is always singular

####################################
# Write your test code here

# 1. Create a new student using new and save
student = Student.new(name: "Harry Potter", email: "harry@example.com", age: 18)
student.save

# 2. Create a new student using create
student = Student.create(name: "Luke Watt", email: "luke@example.com", age: 23)

# 3. Select all students
# pay attention to the object that is returned to you, is it a Student object or Active Record relation object?

# Why can't you do Student.name or Student.email?
students = Student.all

# 4. Select the first student
# pay attention to the object that is returned to you, is it a Student object or Active Record relation object?
Student.first
students[0]
students.first

# 5. Select the last student
# pay attention to the object that is returned to you, is it a Student object or Active Record relation object?
Student.last
students[-1]
students.last

# 6. Use each to iterate through the #<ActiveRecord::Relation> object to display the name of each student
students.each do |x|
	p x.name
end

# 7. Find student by the name Dr. Lois Pfeff using where.
# pay attention to the object that is returned to you, is it the Student object or Active Record relation object?
student = Student.where(name: 'Dr. Lois Pfeff') #ActiveRecord array containing Student object returned
# What will the following return to you? (remember to comment out the code!)
#ERROR
p student.id
p student.name
p student.email
p student.age


# 8. Find student by name using find_by
# pay attention to the object that is returned to you, is it the Student object or Active Record relation object?
student = Student.find_by(name: 'Dr. Lois Pfeff') #Student object returned
# What will the following return to you?
#YES
p student.id
p student.name
p student.email
p student.age

# Do research on the difference between "where" and "find_by".
#where returns the ActiveRecord array whereas find_by returns the particular object

# 9. Find the student with id = 7 using find and find_by
# pay attention to the object that is returned to you, is it the User object or Active Record relation object?
#Both return Student objects
Student.find(7)
Student.find_by(id: 7)

# 10. Update information for student with id = 5 using student.email and save. Change the student's email to elsie@example.com
student = Student.find_by(id: 5)
student.update(email: 'elsie@example.com')
# 11. Now use update to update this student's age to 21.
student.update(age: '21')
# 12. Delete student with id 21 using delete
Student.find_by(id: 21).delete
# 13. Delete student with id 22 using destroy
Student.find_by(id: 22).destroy
#delete will only delete current object record from db but not its associated children records from db.

# destroy will delete current object record from db and also its associated children record from db.