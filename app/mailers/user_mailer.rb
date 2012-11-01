class UserMailer < ActionMailer::Base
  default from: "from@example.com"

   def comment_approval(mymail,comment)
	@mymail = mymail
	@comment = comment
	 mail(:to =>@mymail , :subject => "Task", :from => "redmine.logicmatter@gmail.com")
   end
end
