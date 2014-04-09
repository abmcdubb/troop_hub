troop_1 = Troop.create(name: 'Gantry Girl Scouts', number: '4730', troop_type: 'Daisy', city: 'Long Island City', state: 'New York', zip_code: '11109', meetup_location: 'Little Ones', about_us: " We are the proud Upper East Side Girl Scouts at St. Joseph's of Yorkville. We are part of the Girl Scout Council of Greater New York. Our scouts enjoy many activities at our meeting place in New York City and on field trips and campouts. Our activities encompass many topics, reflecting the different interests and styles of our leaders and our Girl Scouts. Scouts establish goals with their leaders and work to complete these goals while earning petals and patches along the way. Our girls take on leadership roles, learn First Aid skills and safety procedures for various situations. Each Scout will perform one community service project per year. Girl Scouts is a great way to meet new friends, develop life-skills and mature in a positive way.")
troop_2 = Troop.create(name: 'Gantry Girl Scouts', number: '4731', troop_type: 'Brownie', city: 'Long Island City', state: 'New York', zip_code: '11109', meetup_location: 'St. Mary\'s Church', about_us: " We are the proud Upper East Side Girl Scouts at St. Joseph's of Yorkville. We are part of the Girl Scout Council of Greater New York. Our scouts enjoy many activities at our meeting place in New York City and on field trips and campouts. Our activities encompass many topics, reflecting the different interests and styles of our leaders and our Girl Scouts. Scouts establish goals with their leaders and work to complete these goals while earning petals and patches along the way. Our girls take on leadership roles, learn First Aid skills and safety procedures for various situations. Each Scout will perform one community service project per year. Girl Scouts is a great way to meet new friends, develop life-skills and mature in a positive way.")
troop_3 = Troop.create(name: 'Flatiron Girls', number: '0101', troop_type: 'Ambassadors', city: 'New York', state: 'New York', zip_code: '10004', meetup_location: 'Flatiron School', about_us: "We code and stuff. Give us cookies.")

event_1 = Event.create(name: 'Yoga', grades: 'Daisy, Brownie, Junior, Cadette, Senior, Ambassador', genre: 'Health and Fitness', description: "To learn about this ancient science that promotes health and well-being. Yoga can help with concentration and teaches respect for others, nature and ourselves. It can help give you tools you can use in daily life to relax and be more focused on the present moment.", season: "Any", one_time: "false", location: 'anywhere')
event_2 = Event.create(name: 'Respect Myself and Others', grades: 'Daisy', genre: 'Self Improvment', description: "1. Talk about \"Gloria's Story\" \n 2. Invite an older Girl Scout to talk to your group about ways to respect yourself and others \n 3. Practice respecting yourself and others", season: "Any", one_time: "false", location: 'anywhere')
event_3 = Event.create(name: 'Painting', grades: 'Daisy, Brownie, Junior, Cadette, Senior, Ambassador', genre: 'Art', description: "Artists take what they see and make it beautiful. Learn to paint and color your world in super strokes. \n 1. Get inspired \n 2. Paint the real world \n 3. Paint a mood \n 4. Paint without brushes \n 5. Paint a mural", season: "Any", one_time: "false", location: 'anywhere')

troop_event_1 = TroopEvent.create(event_id: 1, troop_id: 1, date: Time.now, location: "The long Island Center for Yoga", detail: "The daisys will be doing yoga today! We'll be leaving from Little Ones at 11, and going to the Long Island Yoga Center for 4 hours of yoga. Get excited!")
troop_event_2 = TroopEvent.create(event_id: 1, troop_id: 2, date: Time.now, location: "The long Island Center for Yoga", detail: "The brownies will be doing yoga today! We'll be leaving from St. Mary\'s at 12:30, and going to the Long Island Yoga Center for 4 hours of yoga. Get excited!")
troop_event_3 = TroopEvent.create(event_id: 2, troop_id: 1, date: Time.now, location: "Little Ones", detail: "We'll talk about how Gloria respected herself. Bring your own picnic lunch.")
troop_event_4 = TroopEvent.create(event_id: 3, troop_id: 2, date: Time.now, location: "Some painting place in Long Island", detail: "Some Details.")


badge_1 = Badge.create(name: "Respect Myself and Others", troop_type: "Daisy")
badge_2 = Badge.create(name: "Painting", troop_type: "Brownie")

troop_event_badge_1 = TroopEventBadge.create(troop_event_id: 3, badge_id: 1)
troop_event_badge_2 = TroopEventBadge.create(troop_event_id: 4, badge_id: 2)

adult_1 = Adult.create(troop_id: '1', adult_role: 'Parent', name: 'Molly Weasley', email: 'mollyw@myfamilyissopooreventhoughwecandomagic.com', phone_number: '555-555-5555', profile_photo: '', admin_privileges: '')
adult_2 = Adult.create(troop_id: '2', adult_role: 'Leader', name: 'Minerva McGonagall', email: 'mcgonagall@imtoughbutfirm.com', phone_number: '212-555-5555', profile_photo: '', admin_privileges: '')
adult_3 = Adult.create(troop_id: '3', adult_role: 'Volunteer', name: 'Helena', email: 'volunteer@imdeadbutistillhelpoutfromtimetotime.com', phone_number: '917-555-5555', profile_photo: '', admin_privileges: '')
adult_4 = Adult.create(troop_id: '4', adult_role: 'Parent', name: 'Vernon Dursley', email: 'vdud@whatthehellamidoinghere.com', phone_number: '646-555-5555', profile_photo: '', admin_privileges: '')

skill1 = Skill.create(name: 'Music', badge_related_skill: true)
skill2 = Skill.create(name: 'Health & Safety', badge_related_skill: true)
skill3 = Skill.create(name: 'Cooking', badge_related_skill: true)
skill4 = Skill.create(name: 'Outdoor Skills', badge_related_skill: true)
skill5 = Skill.create(name: 'Nature, Ecology', badge_related_skill: true)
skill6 = Skill.create(name: 'Photography', badge_related_skill: true)
skill7 = Skill.create(name: 'Arts & Crafts', badge_related_skill: true)
skill8 = Skill.create(name: 'Math', badge_related_skill: true)
skill9 = Skill.create(name: 'Computers', badge_related_skill: true)
skill10 = Skill.create(name: 'Folk Dance & Games', badge_related_skill: true)
skill11 = Skill.create(name: 'Sewing, Needle Arts', badge_related_skill: true)
skill12 = Skill.create(name: 'Other', badge_related_skill: true)

adult_skill_1 = AdultSkill.create(skill_id: 1, adult_id: 1, skill_description: "Violin, Viola, Cello")
adult_skill_2 = AdultSkill.create(skill_id: 2, adult_id: 1, skill_description: "Nursing, Bandaging Wounds")
adult_skill_3 = AdultSkill.create(skill_id: 3, adult_id: 1, skill_description: "Baking")

adult_skill_4 = AdultSkill.create(skill_id: 2, adult_id: 2, skill_description: "Bloodletting")
adult_skill_5 = AdultSkill.create(skill_id: 3, adult_id: 2, skill_description: "Hor D'Oervres")
adult_skill_6 = AdultSkill.create(skill_id: 9, adult_id: 2, skill_description: "Creating Programming, Hacking")
adult_skill_7 = AdultSkill.create(skill_id: 11, adult_id: 2, skill_description: "Crocheting")

adult_skill_8 =  AdultSkill.create(skill_id: 8, adult_id: 3, skill_description: "Calculus")
adult_skill_9 =  AdultSkill.create(skill_id: 9, adult_id: 3, skill_description: "HTML, Node.js")
adult_skill_10 = AdultSkill.create(skill_id: 10, adult_id: 3, skill_description: "Ballet, Riverdance")

adult_skill_11 = AdultSkill.create(skill_id: 6, adult_id: 4, skill_description: "Black and White, Dark Room")
adult_skill_12 = AdultSkill.create(skill_id: 7, adult_id: 4, skill_description: "Popsicle Architecture")
adult_skill_13 = AdultSkill.create(skill_id: 11, adult_id: 4, skill_description: "Knitting, Crosstitch")
adult_skill_14 = AdultSkill.create(skill_id: 4, adult_id: 4, skill_description: "Firestarter, Hiking")
adult_skill_15 = AdultSkill.create(skill_id: 5, adult_id: 4, skill_description: "Bird Watching, Frog Hopping")

