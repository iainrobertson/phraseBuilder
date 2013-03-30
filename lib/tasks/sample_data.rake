namespace :db do
  desc "Fill database with sample data"
  task populateUsers: :environment do
    admin = User.create!(name: "Iain Robertson",
                 email: "iain_pb@jirks.net",
                 password: "foobar",
                 password_confirmation: "foobar")
    admin.toggle!(:admin)
    
    99.times do |n|
      name  = Faker::Name.name
      email = "example2-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    admin.authoredPhrases.create!(phrase_text: "bad", frequency: 500, level: 1, editor_id: nil)
    admin.authoredPhrases.create!(phrase_text: "good", frequency: 800, level: 1, editor_id: nil)
    admin.authoredPhrases.create!(phrase_text: "thing", frequency: 900, level: 1, editor_id: nil)
    admin.authoredPhrases.create!(phrase_text: "good thing", frequency: 100, level: 1, editor_id: nil)
    admin.authoredPhrases.create!(phrase_text: "bad thing", frequency: 80, level: 1, editor_id: nil)
    99.times do |n|
      phraseText  = Faker::Name.name
      admin.authoredPhrases.create!(phrase_text: phraseText, frequency: 80, level: 1, editor_id: nil) 
    end

  end
end