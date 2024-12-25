# db/seeds.rb

# Create Users
User.create!(username: 'admin', email: 'admin@gmail.com', password: 'password', role: 1) # Admin
User.create!(username: 'user1', email: 'user1@gmail.com', password: 'password', role: 0) # Regular user
User.create!(username: 'user2', email: 'user2@gmail.com', password: 'password', role: 0)

# Create Exams
exam1 = Exam.create!(title: 'Ruby Basics', duration: 15)
exam2 = Exam.create!(title: 'Rails Fundamentals', duration: 15)

# Create Questions for Exam 1
q1 = Question.create!(content: 'What is the output of 1 + 1 in Ruby?')
q2 = Question.create!(content: 'What keyword is used to define a method in Ruby?')

# Add questions to Exam 1
exam1.questions << q1
exam1.questions << q2

# Create Choices for Exam 1, Question 1
Choice.create!(content: '1', correct: false, question: q1)
Choice.create!(content: '2', correct: true, question: q1)
Choice.create!(content: '3', correct: false, question: q1)
Choice.create!(content: '4', correct: false, question: q1)
Choice.create!(content: '5', correct: false, question: q1)

# Create Choices for Exam 1, Question 2
Choice.create!(content: 'method', correct: false, question: q2)
Choice.create!(content: 'def', correct: true, question: q2)
Choice.create!(content: 'function', correct: false, question: q2)
Choice.create!(content: 'define', correct: false, question: q2)

# Create Questions for Exam 2
q3 = Question.create!(content: 'What is Rails?')
q4 = Question.create!(content: 'Which command generates a controller in Rails?')

# Add questions to Exam 2
exam2.questions << q3
exam2.questions << q4

# Create Choices for Exam 2, Question 3
Choice.create!(content: 'A programming language', correct: false, question: q3)
Choice.create!(content: 'A web framework', correct: true, question: q3)
Choice.create!(content: 'A database', correct: false, question: q3)
Choice.create!(content: 'An IDE', correct: false, question: q3)

# Create Choices for Exam 2, Question 4
Choice.create!(content: 'rails new controller', correct: false, question: q4)
Choice.create!(content: 'rails g controller', correct: true, question: q4)
Choice.create!(content: 'rails generate view', correct: false, question: q4)
Choice.create!(content: 'rails add controller', correct: false, question: q4)

puts 'Seed data successfully loaded!'
