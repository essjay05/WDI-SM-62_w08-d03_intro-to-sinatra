require 'sinatra'
require 'pry'
require './lib/student.rb'

students = []

get "/" do
    erb :index, :locals => { :students => students }
end

get "/students/:id" do
    student = students.select { |s| s.id === params[:id].to_i }
    erb :show, :locals => { :student => student[0] }
end

get "/students/:id/edit" do 
    student = students.select { |s| s.id === params[:id].to_i }
    erb :edit, :locals => { :student => student[0] }
end

put "/students/:id" do
    student = students.select { |s| s.id === params[:id].to_i }
    student[0].name = params[:name]
    student[0].email = params[:email]
    redirect "/students/#{params[:id]}"
end

post "/students" do 
    new_student = Student.new(params[:name], params[:email])
    students.push(new_student)
    redirect "/"
end

delete "/students/:id" do
    students.delete_if { |s| s.id === params[:id].to_i }
    redirect "/"
end