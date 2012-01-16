shared_examples "a action with properties" do |*properties|
  its(:"properties.value") { should respond_to :keys }
  its(:"properties.value") { should respond_to :values }

  if properties
    properties.each do |property|
      its(:"properties.value.keys") { should include property }
    end
  end
end
