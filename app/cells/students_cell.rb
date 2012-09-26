class StudentsCell < Cell::Rails

  def record(args={})
  	program = args[:program].downcase
  	@subjects = Subject.program(program).parents
    render
  end

end
