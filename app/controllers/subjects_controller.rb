class SubjectsController < ApplicationController
	before_filter :authenticate_student!
  def index
  	@subjects = Subject.program(current_student.program.name.downcase).parents
  end
end
