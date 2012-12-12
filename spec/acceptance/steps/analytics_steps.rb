
step "I am logged in" do
  username = ''
  password = ''
  Garb::Session.login(username, password)
end

step "a profile" do
  @profile = Garb::Management::Profile.all.detect {|p| p.title =~ /referrals/i}
end

step "I run the report" do
  class Events
    extend Garb::Model

    metrics :unique_events, :total_events
    dimensions :event_label
  end

  @results = Events.results(@profile)
end

step "I should see events" do
  @results.entries.detect {|result| result.event_label =="via Email"}.should be_a OpenStruct
end
