shared_examples "a rcon command" do |options|
  its(:"password.value") { should == options[:password] }
  its(:"origin.value.to_s") { should == options[:origin] }
end
