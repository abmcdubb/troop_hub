# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

troop_1 = Troop.create(name: 'Gantry Girl Scouts', number: '4730', troop_type: 'Daisy', city: 'Long Island City', state: 'New York', zip_code: '11109', meetup_location: 'Little Ones', about_us: " We are the proud Upper East Side Girl Scouts at St. Joseph's of Yorkville. We are part of the Girl Scout Council of Greater New York. Our scouts enjoy many activities at our meeting place in New York City and on field trips and campouts. Our activities encompass many topics, reflecting the different interests and styles of our leaders and our Girl Scouts. Scouts establish goals with their leaders and work to complete these goals while earning petals and patches along the way. Our girls take on leadership roles, learn First Aid skills and safety procedures for various situations. Each Scout will perform one community service project per year. Girl Scouts is a great way to meet new friends, develop life-skills and mature in a positive way.")
troop_2 = Troop.create(name: 'Gantry Girl Scouts', number: '4731', troop_type: 'Brownie', city: 'Long Island City', state: 'New York', zip_code: '11109', meetup_location: 'St. Mary\'s Church', about_us: " We are the proud Upper East Side Girl Scouts at St. Joseph's of Yorkville. We are part of the Girl Scout Council of Greater New York. Our scouts enjoy many activities at our meeting place in New York City and on field trips and campouts. Our activities encompass many topics, reflecting the different interests and styles of our leaders and our Girl Scouts. Scouts establish goals with their leaders and work to complete these goals while earning petals and patches along the way. Our girls take on leadership roles, learn First Aid skills and safety procedures for various situations. Each Scout will perform one community service project per year. Girl Scouts is a great way to meet new friends, develop life-skills and mature in a positive way.")
troop_3 = Troop.create(name: 'Flatiron Girls', number: '0101', troop_type: 'Ambassadors', city: 'New York', state: 'New York', zip_code: '10004', meetup_location: 'Flatiron School', about_us: "We code and stuff. Give us cookies.")


scout_1 = Scout.create(troop_id: '1', name: 'Hermione', grade: 'Kindergarten', birthday: '', email: 'hermione@hogwarts.com', phone_number: '212-994-4949', admin_privileges: '', dues: '', profile_photo: '')
scout_2 = Scout.create(troop_id: '2', name: 'Lavender', grade: '2nd', birthday: '', email: 'ilovewonwon@hogwarts.com', phone_number: '212-994-4989', admin_privileges: '', dues: '', profile_photo: '')
scout_3 = Scout.create(troop_id: '3', name: 'Parvati', grade: '11th', birthday: '', email: 'PPatil@hogwarts.com', phone_number: '212-994-4925', admin_privileges: '', dues: '', profile_photo: '')
scout_4 = Scout.create(troop_id: '3', name: 'Cho', grade: '12th', birthday: '', email: 'cchang@hogwarts.com', phone_number: '212-994-4911', admin_privileges: '', dues: '', profile_photo: '')

