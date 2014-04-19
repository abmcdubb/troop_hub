troop_1 = Troop.create(name: 'Holyhead Harpies', number: '4730', age_level_id:
1, city: 'Holyhead', state: 'Wales', zip_code: '11109', meetup_location: 'Little
Ones', about_us: "Red hair crookshanks bludger Marauder’s Map Prongs sunshine daisies butter mellow Ludo Bagman. Beaters gobbledegook N.E.W.T., Honeydukes eriseD inferi Wormtail. Mistletoe dungeons Parseltongue Eeylops Owl Emporium expecto patronum floo powder duel. Gillyweed portkey, keeper Godric’s Hollow telescope, splinched fire-whisky silver Leprechaun O.W.L. stroke the spine. Chalice Hungarian Horntail, catherine wheels Essence of Dittany Gringotts Harry Potter. Prophecies Yaxley green eyes Remembrall horcrux hand of the servant. Devil’s snare love potion Ravenclaw, Professor Sinistra time-turner steak and kidney pie. Cabbage Daily Prophet letters from no one Dervish and Banges leg.") 
troop_2 = Troop.create(name: 'Montrose Magpies', number: '4731', age_level_id: 2, city:
'Montrose', state: 'Scout', zip_code: '10035', meetup_location: 'St. Mary\'s
Church', about_us: "Toad-like smile Flourish and Blotts he knew I’d come back Quidditch World Cup. Fat Lady baubles banana fritters fairy lights Petrificus Totalus. So thirsty, deluminator firs’ years follow me 12 inches of parchment. Head Boy start-of-term banquet Cleansweep Seven roaring lion hat. Unicorn blood crossbow mars is bright tonight, feast Norwegian Ridgeback. Come seek us where our voices sound, we cannot sing above the ground, Ginny Weasley bright red. Fanged frisbees, phoenix tears good clean match.") 
troop_3 = Troop.create(name: 'Tutshill Tornadoes', number: '0101', age_level_id: 6,
city: 'Tutshill', state: 'England', zip_code: '10004', meetup_location:
'Tutshill Church of England Primary School', about_us: "Boggarts lavender robes, Hermione Granger Fantastic Beasts and Where to Find Them. Bee in your bonnet Hand of Glory elder wand, spectacles House Cup Bertie Bott’s Every Flavor Beans Impedimenta. Stunning spells tap-dancing spider Slytherin’s Heir mewing kittens Remus Lupin. Palominos scarlet train black robes, Metamorphimagus Niffler dead easy second bedroom. Padma and Parvati Sorting Hat Minister of Magic blue turban remember my last.")

troop_event_1 = TroopEvent.create(event_id: 1, troop_id: 1, start_time: DateTime.now, location: "The long Island Center for Yoga", detail: "The daisys will be doing yoga today! We'll be leaving from Little Ones at 11, and going to the Long Island Yoga Center for 4 hours of yoga. Get excited!")
troop_event_2 = TroopEvent.create(event_id: 1, troop_id: 2, start_time: DateTime.now, location: "The long Island Center for Yoga", detail: "The brownies will be doing yoga today! We'll be leaving from St. Mary\'s at 12:30, and going to the Long Island Yoga Center for 4 hours of yoga. Get excited!")
troop_event_3 = TroopEvent.create(event_id: 2, troop_id: 1, start_time: DateTime.now, location: "Little Ones", detail: "We'll talk about how Gloria respected herself. Bring your own picnic lunch.")
troop_event_4 = TroopEvent.create(event_id: 3, troop_id: 2, start_time: DateTime.now, location: "Some painting place in Long Island", detail: "Some Details.")

event_badge_1 = EventBadge.create(event_id: 2, badge_id: 1)
event_badge_2 = EventBadge.create(event_id: 3, badge_id: 2)

adult_1 = User.create(troop_ids: '1', role: 'Parent', name: 'Molly Weasley', email: 'mollyw@myfamilyissopooreventhoughwecandomagic.com', phone_number: '555-555-5555', profile_photo: 'mweasley.jpg', admin_privileges: 0, password: '123456789')
adult_2 = User.create(troop_ids: '2', role: 'Troop Leader', name: 'Minerva McGonagall', email: 'mcgonagall@imtoughbutfirm.com', phone_number: '212-555-5555', profile_photo: 'mmcgonagall.jpg', admin_privileges: 0, password: '123456789')
adult_3 = User.create(troop_ids: '3', role: 'Volunteer', name: 'Helena', email: 'volunteer@imdeadbutistillhelpoutfromtimetotime.com', phone_number: '917-555-5555', profile_photo: '', admin_privileges: 0, password: '123456789')
adult_4 = User.create(troop_ids: '1, 3', role: 'Parent', name: 'Vernon Dursley', email: 'vdud@whatthehellamidoinghere.com', phone_number: '646-555-5555', profile_photo: 'vdursley.jpeg', admin_privileges: 0, password: '123456789')
adult_5 = User.create(troop_ids: '1', role: 'Troop Leader', name: 'Lilly Potter', email: 'lily@tookawandtotheheart.com', phone_number: '555-555-5555', profile_photo: 'lpotter.jpg', admin_privileges: 0, password: '123456789')
adult_6 = User.create(troop_ids: '2', role: 'Volunteer', name: 'Dolores Umbridge', email: 'dolores@ilovepink.com', phone_number: '212-555-5555', profile_photo: 'dumbridge.jpg', admin_privileges: 0, password: '123456789')
adult_7 = User.create(troop_ids: '3', role: 'Parent', name: 'Fleur Delacour', email: 'fleur@parlevousfrancais.com', phone_number: '917-555-5555', profile_photo: 'fdelacour.jpg', admin_privileges: 0, password: '123456789')
adult_8 = User.create(troop_ids: '2, 1', role: 'Volunteer', name: 'Nymphadora Tonks', email: 'nymphadora@greenhairrocks.com', phone_number: '646-555-5555', profile_photo: 'ntonks.jpg', admin_privileges: 0, password: '123456789')
adult_8 = User.create(role: 'Volunteer', name: 'Tom Riddle', email: 'tomriddle@deathtomuggles.com', phone_number: '646-555-5555', profile_photo: 'tomriddle.jpg', password: '123456789')


age_level_1 = AgeLevel.create(name: "Daisy", grades: "K-1")
age_level_2 = AgeLevel.create(name: "Brownie", grades: "2-3")
age_level_3 = AgeLevel.create(name: "Junior", grades: "4-5")
age_level_4 = AgeLevel.create(name: "Cadette", grades: "6-8")
age_level_5 = AgeLevel.create(name: "Senior", grades: "9-10")
age_level_6 = AgeLevel.create(name: "Ambassador", grades: "11-12")
age_level_7 = AgeLevel.create(name: "All Ages", grades: "K-12")

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
skill23 = Skill.create(name: 'Community Service',  category: 'General', badge_related_skill: true)

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

event_1 = Event.create(skill_id: 1, name: 'Yoga', description: "To learn about this ancient science that promotes health and well-being. Yoga can help with concentration and teaches respect for others, nature and ourselves. It can help give you tools you can use in daily life to relax and be more focused on the present moment.", season: "Any", one_time: "false", location: 'anywhere')
event_2 = Event.create(skill_id: 2, name: 'Improv', description: "1. Talk about \"Gloria's Story\" \n 2. Invite an older Girl Scout to talk to your group about ways to respect yourself and others \n 3. Practice respecting yourself and others", season: "Any", one_time: "false", location: 'anywhere')
event_3 = Event.create(skill_id: 3, name: 'Harpsichord Lessons', description: "Artists take what they see and make it beautiful. Learn to paint and color your world in super strokes. \n 1. Get inspired \n 2. Paint the real world \n 3. Paint a mood \n 4. Paint without brushes \n 5. Paint a mural", season: "Any", one_time: "false", location: 'anywhere')
event_4 = Event.create(skill_id: 4, name: 'Macarena', description: "To learn about this ancient science that promotes health and well-being. Yoga can help with concentration and teaches respect for others, nature and ourselves. It can help give you tools you can use in daily life to relax and be more focused on the present moment.", season: "Any", one_time: "false", location: 'anywhere')
event_5 = Event.create(skill_id: 5, name: 'Gingerbread House Making', description: "1. Talk about \"Gloria's Story\" \n 2. Invite an older Girl Scout to talk to your group about ways to respect yourself and others \n 3. Practice respecting yourself and others", season: "Any", one_time: "false", location: 'anywhere')
event_6 = Event.create(skill_id: 6, name: 'Making Healthy Snacks', description: "Artists take what they see and make it beautiful. Learn to paint and color your world in super strokes. \n 1. Get inspired \n 2. Paint the real world \n 3. Paint a mood \n 4. Paint without brushes \n 5. Paint a mural", season: "Any", one_time: "false", location: 'anywhere')
event_7 = Event.create(skill_id: 7, name: 'Learning Chinese', description: "To learn about this ancient science that promotes health and well-being. Yoga can help with concentration and teaches respect for others, nature and ourselves. It can help give you tools you can use in daily life to relax and be more focused on the present moment.", season: "Any", one_time: "false", location: 'anywhere')
event_8 = Event.create(skill_id: 8, name: 'Learning CPR', description: "1. Talk about \"Gloria's Story\" \n 2. Invite an older Girl Scout to talk to your group about ways to respect yourself and others \n 3. Practice respecting yourself and others", season: "Any", one_time: "false", location: 'anywhere')
event_9 = Event.create(skill_id: 9, name: 'Introduction to Ruby on Rails', description: "Artists take what they see and make it beautiful. Learn to paint and color your world in super strokes. \n 1. Get inspired \n 2. Paint the real world \n 3. Paint a mood \n 4. Paint without brushes \n 5. Paint a mural", season: "Any", one_time: "false", location: 'anywhere')
event_10 = Event.create(skill_id: 10, name: 'Video Game Development', description: "To learn about this ancient science that promotes health and well-being. Yoga can help with concentration and teaches respect for others, nature and ourselves. It can help give you tools you can use in daily life to relax and be more focused on the present moment.", season: "Any", one_time: "false", location: 'anywhere')
event_11 = Event.create(skill_id: 11, name: 'Calculus', description: "1. Talk about \"Gloria's Story\" \n 2. Invite an older Girl Scout to talk to your group about ways to respect yourself and others \n 3. Practice respecting yourself and others", season: "Any", one_time: "false", location: 'anywhere')
event_12 = Event.create(skill_id: 12, name: 'Robotics', description: "Artists take what they see and make it beautiful. Learn to paint and color your world in super strokes. \n 1. Get inspired \n 2. Paint the real world \n 3. Paint a mood \n 4. Paint without brushes \n 5. Paint a mural", season: "Any", one_time: "false", location: 'anywhere')
event_13 = Event.create(skill_id: 13, name: 'Making Volcanoes', description: "To learn about this ancient science that promotes health and well-being. Yoga can help with concentration and teaches respect for others, nature and ourselves. It can help give you tools you can use in daily life to relax and be more focused on the present moment.", season: "Any", one_time: "false", location: 'anywhere')
event_14 = Event.create(skill_id: 14, name: 'Stargazing', description: "1. Talk about \"Gloria's Story\" \n 2. Invite an older Girl Scout to talk to your group about ways to respect yourself and others \n 3. Practice respecting yourself and others", season: "Any", one_time: "false", location: 'anywhere')
event_15 = Event.create(skill_id: 15, name: 'Making a Budget', description: "Artists take what they see and make it beautiful. Learn to paint and color your world in super strokes. \n 1. Get inspired \n 2. Paint the real world \n 3. Paint a mood \n 4. Paint without brushes \n 5. Paint a mural", season: "Any", one_time: "false", location: 'anywhere')
event_16 = Event.create(skill_id: 16, name: 'Woodworking', description: "To learn about this ancient science that promotes health and well-being. Yoga can help with concentration and teaches respect for others, nature and ourselves. It can help give you tools you can use in daily life to relax and be more focused on the present moment.", season: "Any", one_time: "false", location: 'anywhere')
event_17 = Event.create(skill_id: 17, name: 'Planting a Tree', description: "1. Talk about \"Gloria's Story\" \n 2. Invite an older Girl Scout to talk to your group about ways to respect yourself and others \n 3. Practice respecting yourself and others", season: "Any", one_time: "false", location: 'anywhere')
event_18 = Event.create(skill_id: 18, name: 'Camping', description: "Artists take what they see and make it beautiful. Learn to paint and color your world in super strokes. \n 1. Get inspired \n 2. Paint the real world \n 3. Paint a mood \n 4. Paint without brushes \n 5. Paint a mural", season: "Any", one_time: "false", location: 'anywhere')

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

scout_1 = User.create(troop_ids: '1', role: 'Scout', name: 'Hermione Granger', grade: 'Kindergarten', birthday: '2007/4/9', email: 'hermione@hogwarts.com', phone_number: '212-994-4949', dues: '', password: '123456789', admin_privileges: 50)
scout_2 = User.create(troop_ids: '2', role: 'Scout', name: 'Lavender Brown', grade: '2nd', birthday: '2007/2/1', email: 'ilovewonwon@hogwarts.com', phone_number: '212-994-4989', dues: '', password: '123456789', admin_privileges: 50)
scout_3 = User.create(troop_ids: '3', role: 'Scout', name: 'Parvati Patil', grade: '11th', birthday: '2005/4/5', email: 'PPatil@hogwarts.com', phone_number: '212-994-4925', dues: '', password: '123456789', admin_privileges: 50)
scout_4 = User.create(troop_ids: '1', role: 'Scout', name: 'Cho Chang', grade: '12th', birthday: '1999/6/17', email: 'cchang@hogwarts.com', phone_number: '212-994-4911', dues: '', password: '123456789', admin_privileges: 50)
scout_5 = User.create(troop_ids: '2', role: 'Scout', name: 'Ginny Weasley', grade: '12th', birthday: '1999/6/17', email: 'gweasley@hogwarts.com', phone_number: '212-994-4911', dues: '', password: '123456789', admin_privileges: 50)
scout_6 = User.create(troop_ids: '3', role: 'Scout', name: 'Luna Lovegood', grade: '12th', birthday: '1999/6/17', email: 'llovegood@hogwarts.com', phone_number: '212-994-4911',dues: '', password: '123456789', admin_privileges: 50)
scout_7 = User.create(troop_ids: '1', role: 'Scout', name: 'Moaning Myrtle', grade: '12th', birthday: '1999/6/17', email: 'mymyrtle@hogwarts.com', phone_number: '212-994-4911', dues: '', password: '123456789', admin_privileges: 50)
scout_8 = User.create(troop_ids: '2', role: 'Scout', name: 'Hannah Abbott', grade: '12th', birthday: '1999/6/17', email: 'assets/habbot@hogwarts.com', phone_number: '212-994-4911', dues: '', password: '123456789', admin_privileges: 50)


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

OfficialBadgeParser.new

badgeparser2 = Parser.new('./Patches1.csv')
badgeparser2.unofficial_badge_list
# troopdb = Parser.new('./troopdb.csv')
# troopdb.troop_list


# (:patches, :snack, :jobs, :supplies, :correspondence, :troop_info, :parent_info, :decisions)
agenda_1 = Agenda.create(meeting_date: '', location: 'St. Marys Church', activity_1: 'Claymation', activity_2: 'Promise/Law, Review previous patch meaning', activity_3: 'some activity', activity_4: 'something related to a patch', activity_5: 'some kind of movement game', activity_6: 'Composting stinky old food', activity_7: 'Clean-up', activity_8: 'Friendship circle, squeeze, song', patches: 'Composting Fun Patch', snack: 'Cheesey poofs', jobs: 'Snack Helper: Emily, Squeeze Starter: Hermione', supplies: 'clay', troop_info: 'Ask girls which field trip they would like next: martial art studio or rooftop farm')
agenda_2 = Agenda.create(meeting_date: '', location: 'Fancy highrise lounge', activity_1: 'Robotics building', activity_2: 'Promise/Law, discuss next patch and future field trip', activity_3: 'Some kind of game', activity_4: 'something related to a patch', activity_5: 'Learn a song', activity_6: 'Build a Rails app', activity_7: 'Snack', activity_8: 'Friendship circle, squeeze, song', patches: 'Ruby on Rails Fun Patch', snack: 'Goldfish', jobs: 'Snack Helper: Kid1, Squeeze Starter: Kid2, Attendance Leader: Kid3', supplies: 'computer, pickaxe', troop_info: 'Invite girls to tour Flatiron School summer camp info session')

blog1 = TroopBlog.create(troop_id: '1', headline: 'Squashy armchairs dirt on your nose brass scales crush the Sopophorous bean with flat side of silver dagger, releases juice better than cutting.', body: 'Bee in your
bonnet Hand of Glory elder wand, spectacles House Cup Bertie Bott’s Every Flavor
Beans Impedimenta. Stunning spells tap-dancing spider Slytherin’s Heir mewing
kittens Remus Lupin. Palominos scarlet train black robes, Metamorphimagus
Niffler dead easy second bedroom. Padma and Parvati Sorting Hat Minister of
Magic blue turban remember my last.', photo: 'http://img2.wikia.nocookie.net/__cb20091204181346/harrypotter/images/4/4e/Harry_Potter,_Hermione_Granger_(disguised_as_Bella)_and_Ron_Weasley.jpg') 
blog2 = TroopBlog.create(troop_id: '1', headline: 'Full moon Whomping Willow three turns should do it lemon drops.', body: "Half-giant jinxes peg-leg gillywater broken glasses large black dog Great Hall. Nearly-Headless Nick now string them together, and answer me this, which creature would you be unwilling to kiss? Poltergeist sticking charm, troll umbrella stand flying cars golden locket Lily Potter. Pumpkin juice Trevor wave your wand out glass orbs, a Grim knitted hats. Stan Shunpike doe patronus, suck his soul Muggle-Born large order of drills the trace. Bred in captivity fell through the veil, quaffle blue flame ickle diddykins Aragog. Yer a wizard, Harry Doxycide the woes of Mrs. Weasley Goblet of Fire.", photo: 'http://img4.wikia.nocookie.net/__cb20131023083618/harrypotter/images/9/91/Harry_Potter_wand.png') 
blog3 = TroopBlog.create(troop_id: '2', headline: 'Boggarts lavender robes, Hermione
Granger Fantastic Beasts and Where to Find Them.', body: "Red hair crookshanks bludger Marauder’s Map Prongs sunshine daisies butter mellow Ludo Bagman. Beaters gobbledegook N.E.W.T., Honeydukes eriseD inferi Wormtail. Mistletoe dungeons Parseltongue Eeylops Owl Emporium expecto patronum floo powder duel. Gillyweed portkey, keeper Godric’s Hollow telescope, splinched fire-whisky silver Leprechaun O.W.L. stroke the spine. Chalice Hungarian Horntail, catherine wheels Essence of Dittany Gringotts Harry Potter. Prophecies Yaxley green eyes Remembrall horcrux hand of the servant. Devil’s snare love potion Ravenclaw, Professor Sinistra time-turner steak and kidney pie. Cabbage Daily Prophet letters from no one Dervish and Banges leg.", photo: 'http://images5.fanpop.com/image/photos/26300000/Harry-Potter-Wallpaper-harry-potter-26303844-1280-800.jpg')  
blog4 = TroopBlog.create(troop_id: '2', headline: 'Locomotor trunks owl treats that will be 50 points, Mr. Potter.', body: "Alohamora wand elf parchment, Wingardium Leviosa hippogriff, house dementors betrayal. Holly, Snape centaur portkey ghost Hermione spell bezoar Scabbers. Peruvian-Night-Powder werewolf, Dobby pear-tickle half-moon-glasses, Knight-Bus. Padfoot snargaluff seeker: Hagrid broomstick mischief managed. Snitch Fluffy rock-cake, 9 ¾ dress robes I must not tell lies. Mudbloods yew pumpkin juice phials Ravenclaw’s Diadem 10 galleons Thieves Downfall. Ministry-of-Magic mimubulus mimbletonia Pigwidgeon knut phoenix feather other minister Azkaban. Hedwig Daily Prophet treacle tart full-moon Ollivanders You-Know-Who cursed. Fawkes maze raw-steak Voldemort Goblin Wars snitch Forbidden forest grindylows wool socks.", photo: 'http://1.bp.blogspot.com/_EAViqbzwc_s/TO5YkP0KioI/AAAAAAAACeE/I5trRJgkZv4/s1600/Harry-Potter-the-Order-Phoenix-wallpaper.jpg')
blog5 = TroopBlog.create(troop_id: '2', headline: 'Boggarts lavender robes,
Hermione Granger Fantastic Beasts and Where to Find Them.', body: "Thestral dirigible plums, Viktor Krum hexed memory charm Animagus Invisibility Cloak three-headed Dog. Half-Blood Prince Invisibility Cloak cauldron cakes, hiya Harry! Basilisk venom Umbridge swiveling blue eye Levicorpus, nitwit blubber oddment tweak. Chasers Winky quills The Boy Who Lived bat spleens cupboard under the stairs flying motorcycle. Sirius Black Holyhead Harpies, you’ve got dirt on your nose. Floating candles Sir Cadogan The Sight three hoops disciplinary hearing. Grindlewald pig’s tail Sorcerer's Stone biting teacup. Side-along dragon-scale suits Filch 20 points, Mr. Potter.", photo: 'http://www.whitegadget.com/attachments/pc-wallpapers/82397d1317986277-harry-potter-harry-potter-photo.jpg') 
blog6 = TroopBlog.create(troop_id: '2', headline: 'Fenrir Grayback horseless carriages ‘zis is a chance many would die for!', body: 'Bee in your bonnetHand of Glory elder wand, spectacles House Cup Bertie Bott’s Every Flavor BeansImpedimenta. Stunning spells tap-dancing spider Slytherin’s Heir mewing kittens
Remus Lupin. Palominos scarlet train black robes, Metamorphimagus Niffler dead easy second bedroom. Padma and Parvati Sorting Hat Minister of Magic blue turban   remember my last.', photo: 'http://img2.wikia.nocookie.net/__cb20090124005459/harrypotter/images/4/41/2003_harry_potter_and_prisoner_of_azkaban_007.jpg') 
blog7 = TroopBlog.create(troop_id: '3', headline:
'Half-giant jinxes peg-leg gillywater broken glasses large black dog Great Hall.', body: "Thestral dirigible plums, Viktor Krum hexed memory charm Animagus Invisibility Cloak three-headed Dog. Half-Blood Prince Invisibility Cloak cauldron cakes, hiya Harry! Basilisk venom Umbridge swiveling blue eye Levicorpus, nitwit blubber oddment tweak. Chasers Winky quills The Boy Who Lived bat spleens cupboard under the stairs flying motorcycle. Sirius Black Holyhead Harpies, you’ve got dirt on your nose. Floating candles Sir Cadogan The Sight three hoops disciplinary hearing. Grindlewald pig’s tail Sorcerer's Stone biting teacup. Side-along dragon-scale suits Filch 20 points, Mr. Potter.", photo: '')  
blog8= TroopBlog.create(troop_id: '2', headline: 'Nearly-Headless Nick now string them together, and answer me this, which creature would you be unwilling to kiss?', body: "Squashy armchairs dirt on your nose brass scales crush the Sopophorous bean with flat side of silver dagger, releases juice better than cutting. Full moon Whomping Willow three turns should do it lemon drops. Locomotor trunks owl treats that will be 50 points, Mr. Potter. Witch Weekly, he will rise again and he will come for us, headmaster Erumpent horn. Fenrir Grayback horseless carriages ‘zis is a chance many would die for!", photo: 'http://static.tumblr.com/wrb6fwu/vhqlzkh17/banner_for_tumblr.jpg') 
blog9 = TroopBlog.create(troop_id: '1', headline:
'Boggarts lavender robes, Hermione Granger Fantastic Beasts and Where to Find
Them.', body: "Toad-like smile Flourish and Blotts he knew I’d come back Quidditch World Cup. Fat Lady baubles banana fritters fairy lights Petrificus Totalus. So thirsty, deluminator firs’ years follow me 12 inches of parchment. Head Boy start-of-term banquet Cleansweep Seven roaring lion hat. Unicorn blood crossbow mars is bright tonight, feast Norwegian Ridgeback. Come seek us where our voices sound, we cannot sing above the ground, Ginny Weasley bright red. Fanged frisbees, phoenix tears good clean match.", photo: 'http://static.tumblr.com/wrb6fwu/vhqlzkh17/banner_for_tumblr.jpg') 
blog10 = TroopBlog.create(troop_id: '2', headline: 'Poltergeist sticking charm, troll umbrella stand flying cars golden locket Lily Potter. ', body: "Boggarts lavender robes, Hermione Granger Fantastic Beasts and Where to Find Them. Bee in your bonnet Hand of Glory elder wand, spectacles House Cup Bertie Bott’s Every Flavor Beans Impedimenta. Stunning spells tap-dancing spider Slytherin’s Heir mewing kittens Remus Lupin. Palominos scarlet train black robes, Metamorphimagus Niffler dead easy second bedroom. Padma and Parvati Sorting Hat Minister of Magic blue turban remember my last.", photo: 'http://1.bp.blogspot.com/_2fdwksuATNA/TGooSIuklMI/AAAAAAAAAM0/SSuctxYg4Oo/s1600/Harry-Potter-Deathly-Hallows-6.jpg') 
blog11 = TroopBlog.create(troop_id: '3', headline: 'Prefect’s bathroom Trelawney veela squashy armchairs, SPEW: Gamp’s Elemental Law of Transfiguration.', body: "Alohamora wand elf parchment, Wingardium Leviosa hippogriff, house dementors betrayal. Holly, Snape centaur portkey ghost Hermione spell bezoar Scabbers. Peruvian-Night-Powder werewolf, Dobby pear-tickle half-moon-glasses, Knight-Bus. Padfoot snargaluff seeker: Hagrid broomstick mischief managed. Snitch Fluffy rock-cake, 9 ¾ dress robes I must not tell lies. Mudbloods yew pumpkin juice phials Ravenclaw’s Diadem 10 galleons Thieves Downfall. Ministry-of-Magic mimubulus mimbletonia Pigwidgeon knut phoenix feather other minister Azkaban. Hedwig Daily Prophet treacle tart full-moon Ollivanders You-Know-Who cursed. Fawkes maze raw-steak Voldemort Goblin Wars snitch Forbidden forest grindylows wool socks.", photo: 'http://www.berkeleyside.com/wp-content/uploads/2010/02/quidditch.jpg')
