class OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def all
	  student = Student.from_omniauth(request.env["omniauth.auth"])	
	  if student.persisted?
	    sign_in_and_redirect student, :notice => "Signed In !"
	  else
	  	omni = request.env["omniauth.auth"]
	  	info = omni[:info]
	  	session["devise.student_attributes"] = {uid:omni[:uid], provider:omni[:provider], name:info[:name], email:info[:email]}
	    redirect_to new_student_registration_url, :notice => 'Almost Complete !'
	  end
	end
	alias_method :facebook, :all
end
