shared_examples "a real player" do
  its(:"nickname.value") { should be }
  its(:"uid.value")      { should be }
  its(:"steam_id.value") { should be }
end
