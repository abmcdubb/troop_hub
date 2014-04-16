troop_1 = Troop.create(name: 'Gantry Girl Scouts', number: '4730', age_level_id: 1, city: 'Long Island City', state: 'New York', zip_code: '11109', meetup_location: 'Little Ones', about_us: " We are the proud Upper East Side Girl Scouts at St. Joseph's of Yorkville. We are part of the Girl Scout Council of Greater New York. Our scouts enjoy many activities at our meeting place in New York City and on field trips and campouts. Our activities encompass many topics, reflecting the different interests and styles of our leaders and our Girl Scouts. Scouts establish goals with their leaders and work to complete these goals while earning petals and patches along the way. Our girls take on leadership roles, learn First Aid skills and safety procedures for various situations. Each Scout will perform one community service project per year. Girl Scouts is a great way to meet new friends, develop life-skills and mature in a positive way.")
troop_2 = Troop.create(name: 'East Harlem Girl Scouts', number: '4731', age_level_id: 2, city: 'Manhattan', state: 'New York', zip_code: '10035', meetup_location: 'St. Mary\'s Church', about_us: " We are the proud Upper East Side Girl Scouts at St. Joseph's of Yorkville. We are part of the Girl Scout Council of Greater New York. Our scouts enjoy many activities at our meeting place in New York City and on field trips and campouts. Our activities encompass many topics, reflecting the different interests and styles of our leaders and our Girl Scouts. Scouts establish goals with their leaders and work to complete these goals while earning petals and patches along the way. Our girls take on leadership roles, learn First Aid skills and safety procedures for various situations. Each Scout will perform one community service project per year. Girl Scouts is a great way to meet new friends, develop life-skills and mature in a positive way.")
troop_3 = Troop.create(name: 'Flatiron Girls', number: '0101', age_level_id: 6, city: 'New York', state: 'New York', zip_code: '10004', meetup_location: 'Flatiron School', about_us: "We code and stuff. Give us cookies.")

event_1 = Event.create(name: 'Yoga', genre: 'Health and Fitness', description: "To learn about this ancient science that promotes health and well-being. Yoga can help with concentration and teaches respect for others, nature and ourselves. It can help give you tools you can use in daily life to relax and be more focused on the present moment.", season: "Any", one_time: "false", location: 'anywhere', skill_id: 1)
event_2 = Event.create(name: 'Respect Myself and Others', genre: 'Self Improvment', description: "1. Talk about \"Gloria's Story\" \n 2. Invite an older Girl Scout to talk to your group about ways to respect yourself and others \n 3. Practice respecting yourself and others", season: "Any", one_time: "false", location: 'anywhere', skill_id: 22)
event_3 = Event.create(name: 'Painting', genre: 'Art', description: "Artists take what they see and make it beautiful. Learn to paint and color your world in super strokes. \n 1. Get inspired \n 2. Paint the real world \n 3. Paint a mood \n 4. Paint without brushes \n 5. Paint a mural", season: "Any", one_time: "false", location: 'anywhere', skill_id: 5)

troop_event_1 = TroopEvent.create(event_id: 1, troop_id: 1, start_time: DateTime.now, location: "The long Island Center for Yoga", detail: "The daisys will be doing yoga today! We'll be leaving from Little Ones at 11, and going to the Long Island Yoga Center for 4 hours of yoga. Get excited!")
troop_event_2 = TroopEvent.create(event_id: 1, troop_id: 2, start_time: DateTime.now, location: "The long Island Center for Yoga", detail: "The brownies will be doing yoga today! We'll be leaving from St. Mary\'s at 12:30, and going to the Long Island Yoga Center for 4 hours of yoga. Get excited!")
troop_event_3 = TroopEvent.create(event_id: 2, troop_id: 1, start_time: DateTime.now, location: "Little Ones", detail: "We'll talk about how Gloria respected herself. Bring your own picnic lunch.")
troop_event_4 = TroopEvent.create(event_id: 3, troop_id: 2, start_time: DateTime.now, location: "Some painting place in Long Island", detail: "Some Details.")

#badges
Parser.new
UnofficialBadgesParser.new
# badge_1 = Badge.create(name: "Respect Myself and Others", troop_type: "Daisy")
# badge_2 = Badge.create(name: "Painting", troop_type: "Brownie")
#update! why was troop_type removed?

event_badge_1 = EventBadge.create(event_id: 2, badge_id: 1)
event_badge_2 = EventBadge.create(event_id: 3, badge_id: 2)

adult_1 = User.create(troop_id: '1', role: 'Parent', name: 'Molly Weasley', email: 'mollyw@myfamilyissopooreventhoughwecandomagic.com', phone_number: '555-555-5555', profile_photo: 'mweasley.jpg', admin_privileges: '', password: '123456789')
adult_2 = User.create(troop_id: '2', role: 'Troop Leader', name: 'Minerva McGonagall', email: 'mcgonagall@imtoughbutfirm.com', phone_number: '212-555-5555', profile_photo: 'mmcgonagall.jpg', admin_privileges: '', password: '123456789')
adult_3 = User.create(troop_id: '3', role: 'Volunteer', name: 'Helena', email: 'volunteer@imdeadbutistillhelpoutfromtimetotime.com', phone_number: '917-555-5555', profile_photo: '', admin_privileges: '', password: '123456789')
adult_4 = User.create(troop_id: '4', role: 'Parent', name: 'Vernon Dursley', email: 'vdud@whatthehellamidoinghere.com', phone_number: '646-555-5555', profile_photo: 'vdursley.jpeg', admin_privileges: '', password: '123456789')
adult_5 = User.create(troop_id: '1', role: 'Troop Leader', name: 'Lilly Potter', email: 'lily@tookawandtotheheart.com', phone_number: '555-555-5555', profile_photo: 'lpotter.jpg', admin_privileges: '', password: '123456789')
adult_6 = User.create(troop_id: '2', role: 'Volunteer', name: 'Dolores Umbridge', email: 'dolores@ilovepink.com', phone_number: '212-555-5555', profile_photo: 'dumbridge.jpg', admin_privileges: '', password: '123456789')
adult_7 = User.create(troop_id: '3', role: 'Parent', name: 'Fleur Delacour', email: 'fleur@parlevousfrancais.com', phone_number: '917-555-5555', profile_photo: 'fdelacour.jpg', admin_privileges: '', password: '123456789')
adult_8 = User.create(troop_id: '4', role: 'Volunteer', name: 'Nymphadora Tonks', email: 'nymphadora@greenhairrocks.com', phone_number: '646-555-5555', profile_photo: 'ntonks.jpg', admin_privileges: '', password: '123456789')

age_level_1 = AgeLevel.create(name: "Daisy", grades: "K-1")
age_level_2 = AgeLevel.create(name: "Brownie", grades: "2-3")
age_level_3 = AgeLevel.create(name: "Junior", grades: "4-5")
age_level_4 = AgeLevel.create(name: "Cadette", grades: "6-8")
age_level_5 = AgeLevel.create(name: "Senior", grades: "9-10")
age_level_6 = AgeLevel.create(name: "Ambassador", grades: "11-12")

event_age_level_1 = EventAgeLevel.create(event_id: 1, age_level_id: 1)
event_age_level_2 = EventAgeLevel.create(event_id: 1, age_level_id: 2)
event_age_level_3 = EventAgeLevel.create(event_id: 1, age_level_id: 3)
event_age_level_4 = EventAgeLevel.create(event_id: 1, age_level_id: 4)
event_age_level_5 = EventAgeLevel.create(event_id: 1, age_level_id: 5)
event_age_level_6 = EventAgeLevel.create(event_id: 1, age_level_id: 6)
event_age_level_7 = EventAgeLevel.create(event_id: 2, age_level_id: 1)
event_age_level_8 = EventAgeLevel.create(event_id: 3, age_level_id: 1)
event_age_level_9 = EventAgeLevel.create(event_id: 3, age_level_id: 2)
event_age_level_10 = EventAgeLevel.create(event_id: 3, age_level_id: 3)
event_age_level_11 = EventAgeLevel.create(event_id: 3, age_level_id: 4)
event_age_level_12 = EventAgeLevel.create(event_id: 3, age_level_id: 5)
event_age_level_13 = EventAgeLevel.create(event_id: 3, age_level_id: 6)


#----General----
skill1 = Skill.create(name: 'Sports & Fitness', category: 'General', badge_related_skill: true)
skill2 = Skill.create(name: 'Drama', category: 'General', badge_related_skill: true)
skill3 = Skill.create(name: 'Music', category: 'General', badge_related_skill: true)
skill4 = Skill.create(name: 'Dance', category: 'General', badge_related_skill: true)
skill5 = Skill.create(name: 'Arts & Crafts', category: 'General', badge_related_skill: true)
skill6 = Skill.create(name: 'Cooking', category: 'General', badge_related_skill: true)
skill7 = Skill.create(name: 'Geography & Culture', category: 'General', badge_related_skill: true)
skill8 = Skill.create(name: 'Health & Safety',  category: 'General', badge_related_skill: true)

# ----STEM Skills ----
skill9= Skill.create(name: 'Computer Science', category: 'STEM', badge_related_skill: true)
skill10 = Skill.create(name: 'Technology', category: 'STEM', badge_related_skill: true)
skill11 = Skill.create(name: 'Math', category: 'STEM', badge_related_skill: true)
skill12 = Skill.create(name: 'Engineering', category: 'STEM', badge_related_skill: true)
skill13 = Skill.create(name: 'Science', category: 'STEM', badge_related_skill: true)
skill14 = Skill.create(name: 'Astronomy', category: 'STEM', badge_related_skill: true)

#---Business Smarts
skill15 = Skill.create(name: 'Financial Literacy', category: 'Business Smarts', badge_related_skill: true)
skill16 = Skill.create(name: 'Career Exploration', category: 'Business Smarts', badge_related_skill: true)

#---Nature & Ecology ----
skill17 = Skill.create(name: 'Plants & Gardening', category: 'Nature & Ecology', badge_related_skill: true)
skill18 = Skill.create(name: 'Outdoor Skills', category: 'Nature & Ecology', badge_related_skill: true)
skill19 = Skill.create(name: 'Animals', category: 'Nature & Ecology', badge_related_skill: true)
skill20 = Skill.create(name: 'Climate/Earth Science', category: 'Nature & Ecology', badge_related_skill: true)
skill21 = Skill.create(name: 'Habitat Restoration', category: 'Nature & Ecology', badge_related_skill: true)

#---OTHER----
skill22 = Skill.create(name: 'Other', badge_related_skill: true)

adult_skill_1 = UserSkill.create(skill_id: 3, user_id: 1, skill_description: "Violin, Viola, Cello")
adult_skill_2 = UserSkill.create(skill_id: 8, user_id: 1, skill_description: "Nursing, Bandaging Wounds")
adult_skill_3 = UserSkill.create(skill_id: 6, user_id: 1, skill_description: "Baking")

adult_skill_4 = UserSkill.create(skill_id: 8, user_id: 2, skill_description: "Bloodletting")
adult_skill_5 = UserSkill.create(skill_id: 6, user_id: 2, skill_description: "Hor D'Oervres")
adult_skill_6 = UserSkill.create(skill_id: 9, user_id: 2, skill_description: "Creating Programming, Hacking")
adult_skill_7 = UserSkill.create(skill_id: 5, user_id: 2, skill_description: "Crocheting")

adult_skill_8 =  UserSkill.create(skill_id: 11, user_id: 3, skill_description: "Calculus")
adult_skill_9 =  UserSkill.create(skill_id: 9, user_id: 3, skill_description: "HTML, Node.js")
adult_skill_10 = UserSkill.create(skill_id: 4, user_id: 3, skill_description: "Ballet, Riverdance")

adult_skill_11 = UserSkill.create(skill_id: 5, user_id: 4, skill_description: "Photography, Black and White, Dark Room")
adult_skill_12 = UserSkill.create(skill_id: 5, user_id: 4, skill_description: "Popsicle Architecture")
adult_skill_13 = UserSkill.create(skill_id: 5, user_id: 4, skill_description: "Knitting, Crosstitch")
adult_skill_14 = UserSkill.create(skill_id: 18, user_id: 4, skill_description: "Firestarter, Hiking")
adult_skill_15 = UserSkill.create(skill_id: 19, user_id: 4, skill_description: "Bird Watching, Frog Hopping")

scout_1 = User.create(troop_id: '1', role: 'Scout', name: 'Hermione Granger', grade: 'Kindergarten', birthday: '2007/4/9', email: 'hermione@hogwarts.com', phone_number: '212-994-4949', admin_privileges: '', dues: '', password: '123456789')
scout_2 = User.create(troop_id: '2', role: 'Scout', name: 'Lavender Brown', grade: '2nd', birthday: '2007/2/1', email: 'ilovewonwon@hogwarts.com', phone_number: '212-994-4989', admin_privileges: '', dues: '', password: '123456789')
scout_3 = User.create(troop_id: '3', role: 'Scout', name: 'Parvati Patil', grade: '11th', birthday: '2005/4/5', email: 'PPatil@hogwarts.com', phone_number: '212-994-4925', admin_privileges: '', dues: '', password: '123456789')
scout_4 = User.create(troop_id: '1', role: 'Scout', name: 'Cho Chang', grade: '12th', birthday: '1999/6/17', email: 'cchang@hogwarts.com', phone_number: '212-994-4911', admin_privileges: '', dues: '', password: '123456789')
scout_5 = User.create(troop_id: '2', role: 'Scout', name: 'Ginny Weasley', grade: '12th', birthday: '1999/6/17', email: 'gweasley@hogwarts.com', phone_number: '212-994-4911', admin_privileges: '', dues: '', password: '123456789')
scout_6 = User.create(troop_id: '3', role: 'Scout', name: 'Luna Lovegood', grade: '12th', birthday: '1999/6/17', email: 'llovegood@hogwarts.com', phone_number: '212-994-4911', admin_privileges: '', dues: '', password: '123456789')
scout_7 = User.create(troop_id: '1', role: 'Scout', name: 'Moaning Myrtle', grade: '12th', birthday: '1999/6/17', email: 'mymyrtle@hogwarts.com', phone_number: '212-994-4911', admin_privileges: '', dues: '', password: '123456789')
scout_8 = User.create(troop_id: '2', role: 'Scout', name: 'Hannah Abbott', grade: '12th', birthday: '1999/6/17', email: 'assets/habbot@hogwarts.com', phone_number: '212-994-4911', admin_privileges: '', dues: '', password: '123456789')


s1pic = File.join(Rails.root, '/app/assets/images/hgranger.jpeg')
s1_file = File.new(s1pic)
scout_1.profile_photo = s1_file
scout_1.save!

s2pic = File.join(Rails.root, '/app/assets/images/lbrown.jpg')
s2_file = File.new(s2pic)
scout_2.profile_photo = s2_file
scout_2.save!

s3pic = File.join(Rails.root, '/app/assets/images/ppatel.jpeg')
s3_file = File.new(s3pic)
scout_3.profile_photo = s3_file
scout_3.save!

s4pic = File.join(Rails.root, '/app/assets/images/cchang.JPG')
s4_file = File.new(s4pic)
scout_4.profile_photo = s4_file
scout_4.save!

s5pic = File.join(Rails.root, '/app/assets/images/gweasley.jpg')
s5_file = File.new(s5pic)
scout_5.profile_photo = s5_file
scout_5.save!

s6pic = File.join(Rails.root, '/app/assets/images/llovegood.jpg')
s6_file = File.new(s6pic)
scout_6.profile_photo = s6_file
scout_6.save!

s7pic = File.join(Rails.root, '/app/assets/images/mmyrtle.jpg')
s7_file = File.new(s7pic)
scout_7.profile_photo = s7_file
scout_7.save!

s8pic = File.join(Rails.root, '/app/assets/images/habbott.png')
s8_file = File.new(s8pic)
scout_8.profile_photo = s8_file
scout_8.save!

a1pic = File.join(Rails.root, '/app/assets/images/mweasley.jpg')
a1_file = File.new(a1pic)
adult_1.profile_photo = a1_file
adult_1.save!

a2pic = File.join(Rails.root, '/app/assets/images/mmcgonagall.jpg')
a2_file = File.new(a2pic)
adult_2.profile_photo = a2_file
adult_2.save!

a4pic = File.join(Rails.root, '/app/assets/images/vdursley.jpeg')
a4_file = File.new(a4pic)
adult_4.profile_photo = a4_file
adult_4.save!

a5pic = File.join(Rails.root, '/app/assets/images/lpotter.jpg')
a5_file = File.new(a5pic)
adult_5.profile_photo = a5_file
adult_5.save!

a6pic = File.join(Rails.root, '/app/assets/images/dumbridge.jpg')
a6_file = File.new(a6pic)
adult_6.profile_photo = a6_file
adult_6.save!

a7pic = File.join(Rails.root, '/app/assets/images/fdelacour.jpg')
a7_file = File.new(a7pic)
adult_7.profile_photo = a7_file
adult_7.save!

a8pic = File.join(Rails.root, '/app/assets/images/ntonks.jpg')
a8_file = File.new(a8pic)
adult_8.profile_photo = a8_file
adult_8.save!


# (:patches, :snack, :jobs, :supplies, :correspondence, :troop_info, :parent_info, :decisions)
agenda_1 = Agenda.create(meeting_date: '', location: 'St. Marys Church', activity_1: 'Claymation', activity_2: 'Promise/Law, Review previous patch meaning', activity_3: 'some activity', activity_4: 'something related to a patch', activity_5: 'some kind of movement game', activity_6: 'Composting stinky old food', activity_7: 'Clean-up', activity_8: 'Friendship circle, squeeze, song', patches: 'Composting Fun Patch', snack: 'Cheesey poofs', jobs: 'Snack Helper: Emily, Squeeze Starter: Hermione', supplies: 'clay', troop_info: 'Ask girls which field trip they would like next: martial art studio or rooftop farm')


agenda_2 = Agenda.create(meeting_date: '', location: 'Fancy highrise lounge', activity_1: 'Robotics building', activity_2: 'Promise/Law, discuss next patch and future field trip', activity_3: 'Some kind of game', activity_4: 'something related to a patch', activity_5: 'Learn a song', activity_6: 'Build a Rails app', activity_7: 'Snack', activity_8: 'Friendship circle, squeeze, song', patches: 'Ruby on Rails Fun Patch', snack: 'Goldfish', jobs: 'Snack Helper: Kid1, Squeeze Starter: Kid2, Attendance Leader: Kid3', supplies: 'computer, pickaxe', troop_info: 'Invite girls to tour Flatiron School summer camp info session')
