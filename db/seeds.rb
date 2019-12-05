puts 'Cleaning database...'

ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  ActiveRecord::Base.connection.execute("TRUNCATE #{table} CASCADE") unless table == "schema_migrations"
end

puts "Create test users, clinics, fields, specialties and approvals..."

general_surgery = Specialty.create!(name: 'General surgery')
cardiology = Specialty.create!(name: 'cardiology')
oncology = Specialty.create!(name: 'oncology')
neurology = Specialty.create!(name: 'neurology')

cardiology_condition_1 = Field.create!(name: "Hypertension", specialty: cardiology)
cardiology_condition_2 = Field.create!(name: "Coronary Disease", specialty: cardiology)
cardiology_condition_3 = Field.create!(name: "Angiology", specialty: cardiology)
cardiology_condition_4 = Field.create!(name: "Interventional Cardiology", specialty: cardiology)
cardiology_condition_5 = Field.create!(name: "Cardiovascular intensive care", specialty: cardiology)
cardiology_condition_6 = Field.create!(name: "Congenital heart defects in adults", specialty: cardiology)
cardiology_condition_7 = Field.create!(name: "Cardiomyopathy", specialty: cardiology)
cardiology_condition_8 = Field.create!(name: "Heart failure", specialty: cardiology)
cardiology_condition_9 = Field.create!(name: "Valvular disorders", specialty: cardiology)
cardiology_condition_10 = Field.create!(name: "Sport cardiology", specialty: cardiology)

oncology_condition_1 = Field.create!(name: "Lung cancer", specialty: oncology)
oncology_condition_2 = Field.create!(name: "Pancreatic cancer", specialty: oncology)
oncology_condition_3 = Field.create!(name: "Palliative care", specialty: oncology)
oncology_condition_4 = Field.create!(name: "Radiation oncology", specialty: oncology)
oncology_condition_5 = Field.create!(name: "Pediatric oncology", specialty: oncology)
oncology_condition_6 = Field.create!(name: "Surgical oncology", specialty: oncology)
oncology_condition_7 = Field.create!(name: "Gynecologic oncology", specialty: oncology)
oncology_condition_8 = Field.create!(name: "Hematologic oncology", specialty: oncology)
oncology_condition_9 = Field.create!(name: "Neuropediatric oncology", specialty: oncology)
oncology_condition_10 = Field.create!(name: "Oncological trials", specialty: oncology)

neurology_condition_1 = Field.create!(name: "Stroke", specialty: neurology)
neurology_condition_2 = Field.create!(name: "Chronic degenerative diseases", specialty: neurology)
neurology_condition_3 = Field.create!(name: "Rehabilitation", specialty: neurology)
neurology_condition_4 = Field.create!(name: "Clinical Neurophysiologist", specialty: neurology)
neurology_condition_5 = Field.create!(name: "Vascular Neurologist", specialty: neurology)
neurology_condition_6 = Field.create!(name: "Pain Management and Palliative Care", specialty: neurology)
neurology_condition_7 = Field.create!(name: "Neurodevelopmental and Neuromuscular Neurology", specialty: neurology)
neurology_condition_8 = Field.create!(name: "Pediatric Neurology", specialty: neurology)
neurology_condition_9 = Field.create!(name: "Neurological Geriatric Conditions", specialty: neurology)

general_surgery_condition_1 = Field.create!(name: "Trauma surgery", specialty: general_surgery)
general_surgery_condition_2 = Field.create!(name: "Laparoscopic surgery", specialty: general_surgery)
general_surgery_condition_3 = Field.create!(name: "Colorectal surgery", specialty: general_surgery)
general_surgery_condition_4 = Field.create!(name: "Breast surgery", specialty: general_surgery)
general_surgery_condition_5 = Field.create!(name: "Vascular surgery", specialty: general_surgery)
general_surgery_condition_6 = Field.create!(name: "Endocrine surgery", specialty: general_surgery)
general_surgery_condition_7 = Field.create!(name: "Transplant surgery", specialty: general_surgery)
general_surgery_condition_8 = Field.create!(name: "Surgical oncology", specialty: general_surgery)
general_surgery_condition_9 = Field.create!(name: "Cardiothoracic surgery", specialty: general_surgery)
general_surgery_condition_10 = Field.create!(name: "Pediatric surgery", specialty: general_surgery)

clinic_1 = Clinic.create!(
  name:'Charite Berlin Mitte',
  website:'www.charite.de',
  phone_number: '030 1234 456789',
  email: 'service@charite.de',
  remote_clinic_picture_url: 'https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1035&q=80',
  description: "Charité is one of the largest university hospitals in Europe. All of our clinical care, research and teaching is delivered by physicians and researchers of the highest international standard. Charité proudly lays claim to more than half of all German Nobel Prize winners in Physiology or Medicine, including Emil von Behring, Robert Koch, and Paul Ehrlich. Charité is internationally renowned for its excellence in teaching and training.",
  address: "Chariteplatz 1, 10117 Berlin",
  consultation_times: "Mo - Fr: 10am - 5pm")
clinic_1[:clinic_picture] = "https://res.cloudinary.com/ddoiquevw/image/upload/v1575460052/oronkdxcgtk6zc7xetwh.jpg"
clinic_1.save!

clinic_2 = Clinic.create!(
  name:'Bundeswehrkrankenhaus Berlin',
  website:' www.bwkrankenhaus.de',
  phone_number: '030 28412289',
  email: 'info@bw-krankenhaus.de',
  remote_clinic_picture_url: 'https://images.unsplash.com/photo-1495202337139-e865ed70fcd4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1655&q=80',
  description: "The Joint Medical Service (German: Zentraler Sanitätsdienst der Bundeswehr) is a part of the Bundeswehr, the armed forces of Germany and serves all three armed services (Army, Navy and Air Force). However, members of the central medical corps remain members of their respective military branches. Only a few specialized medical units such as the medical care for divers and aircraft crews are not incorporated in the Joint Medical Service. Prior to 2002 each military branch had its own medical service. The services were then largely merged, forming the Joint Medical Service.",
  address: "Scharnhorststraße 13, 10115 Berlin",
  consultation_times: "Mo - Fr: 10am - 5pm")
clinic_2[:clinic_picture] = "https://res.cloudinary.com/ddoiquevw/image/upload/v1575466030/photo-1533042789716-e9a9c97cf4ee_bnpflj.jpg"
clinic_2.save!

clinic_3 = Clinic.create!(
  name:'Dr med Scheuer und Kollegen',
  website:'scheuer-und.kollegen',
  phone_number: '030 156810',
  email: 'sprechstunde@scheuer.de',
  remote_clinic_picture_url: 'https://images.unsplash.com/photo-1533042789716-e9a9c97cf4ee?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
  description: "We are a private clinic with a nice view & competence",
  address: "Wilmersdorfer Str. 102, 10629 Berlin",
  consultation_times: "Mo - Fr: 10am - 5pm")
clinic_3[:clinic_picture] = "https://res.cloudinary.com/ddoiquevw/image/upload/v1575459690/t4qn0oi2w3biasgkbptv.jpg"
clinic_3.save!

clinic_4 = Clinic.create!(
  name:'Unfallkrankenhaus Berlin (UKB)',
  website:'www.ukb.de',
  phone_number: '030 56810',
  email: 'service@ukb.de',
  remote_clinic_picture_url: 'https://images.unsplash.com/photo-1533042789716-e9a9c97cf4ee?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
  description: "Das Unfallkrankenhaus Berlin (UKB) ist eine berufsgenossenschaftliche Unfallklinik im Berliner Ortsteil Biesdorf des Bezirks Marzahn-Hellersdorf, die 1997 gegründet wurde. Vorrangig dient es der Behandlung von Unfallverletzten und Notfallpatienten aus dem Raum Berlin-Brandenburg sowie von Schwerbrandverletzten aus ganz Deutschland.[1] Das Haupthaus ist ein Neubau, aber die meisten historischen Gebäude des Wilhelm-Griesinger-Krankenhauses wurden dem UKB zugeschlagen. Somit geht die Geschichte bis zum Ende des 19. Jahrhunderts zurück.",
  address: "Warener Str. 7, 12683 Berlin",
  consultation_times: "Mo - Fr: 10am - 5pm")
clinic_4[:clinic_picture] = "https://res.cloudinary.com/ddoiquevw/image/upload/v1575466772/photo-1571582262838-7ce60ba9a052_i5tqbw.jpg"
clinic_4.save!

clinic_5 = Clinic.create!(
  name:'Campus Berlin-Bruch',
  website:'campus-bruch.berlin',
  phone_number: '030 56810',
  email: 'service@bruch.berlin',
  remote_clinic_picture_url: 'https://images.unsplash.com/photo-1445527815219-ecbfec67492e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
  description: "Campus Berlin-Buch GmbH offers its clients on Campus Berlin-Buch a comprehensive infrastructure and service culture. The main task of Campus Berlin-Buch GmbH is to assist and support biotech companies – from start-ups to mature enterprises – in settling on the campus of the BiotechPark Berlin-Buch with access to the resources of the Innovation and Incubation Center.",
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  consultation_times: "Mo - Fr: 10am - 5pm")
clinic_5[:clinic_picture] = "https://res.cloudinary.com/ddoiquevw/image/upload/v1575466885/photo-1476890065195-542990594501_mrulys.jpg"
clinic_5.save!

clinic_6 = Clinic.create!(
  name:'Universitätsklinikum Benjamin Franklin',
  website:'www.ukbf.de',
  phone_number: '030 56810',
  email: 'info@ukbf.de',
  description: "Das Universitätsklinikum Benjamin Franklin (UKBF) ist ein Klinikum der Vollversorgung. Seit 1998 gehört es zum Verbund der Charité. Zurück geht das Klinikum auf das 1968 eröffnete Klinikum Steglitz der Freien Universität Berlin.[1] Dieses lag im Berliner Ortsteil Lichterfelde des damaligen Bezirks Steglitz (seit 2001: Bezirk Steglitz-Zehlendorf).",
  address: "Hindenburgdamm 12",
  consultation_times: "Mo - Fr: 10am - 5pm")
  clinic_6[:clinic_picture] = 'https://res.cloudinary.com/ddoiquevw/image/upload/v1575466982/photo-1476889155166-39ae3886a3ef_dwlmne.jpg'
  clinic_6.save!

clinic_7 = Clinic.create!(
  name:'Vivantes Klinikum Am Urban',
  website:'www.vivantes.de',
  phone_number: '030 56810',
  email: 'service@vivantes.de',
  description: "Vivantes sieht sich längst nicht mehr nur als Krankenhausunternehmen. Unser Auftrag ist die gesundheitliche Daseinsvorsorge für alle Menschen in dieser Stadt, für die Kranken jeden Alters wie für die Gesunden. Kurz: Für Gesundheit in jeder Lebenslage. Lifestyle oder Lebensrettung, glückliche Geburt oder würdiges Sterben: Vivantes ist für Berlin da – für eine halbe Million Menschen Jahr für Jahr. Vivantes gehört zu Berlin.",
  address: "Maybachufer 50, Berlin",
  consultation_times: "Mo - Fr: 10am - 5pm")
clinic_7[:clinic_picture] = "https://res.cloudinary.com/ddoiquevw/image/upload/v1575460055/bmpbxfcikjejyv3xvkmt.jpg"
clinic_7.save!

user_1 = User.create!(
  email: "doctor1@example.com",
  password: "123456",
  title: "Dr",
  first_name: "Gregory",
  last_name: "House",
  only_private_insurance: false,
  bio: "For the last twenty years, I have been specializing in Cardiovascular Disease. I am practising at Charité Mitte and Virchow Campuses. In addition, I am involved in teaching our students as well as cardiovascular research on biomarkers.",
  position: "Chief doctor",
  clinic: clinic_1)
user_1[:profile_picture] = "https://res.cloudinary.com/ddoiquevw/image/upload/v1575465930/photo-1544819616-8b86befe568c_qzthlq.jpg"
user_1.save!

user_2 = User.create!(
  email: "doctor2@example.com",
  password: "123456",
  title: "Prof Dr",
  first_name: "Hans",
  last_name: "Meier",
  only_private_insurance: false,
  bio: "Prior to my medical career I have been serving in the Bundeswehr as a paramedic. I have now been working at the Bundeswehrkrankenhaus for about ten years. My research interests include telemedical diagnostics of oncological conditions.",
  position: "Consultant doctor",
  clinic: clinic_2)
user_2[:profile_picture] = "https://res.cloudinary.com/ddoiquevw/image/upload/v1575465918/photo-1500648767791-00dcc994a43e_c60d6j.jpg"
user_2.save!

user_3 = User.create!(
  email: "doctor3@example.com",
  password: "123456",
  title: "Dr",
  first_name: "Sabine",
  last_name: "Scheuer",
  only_private_insurance: true,
  bio: "I have recently joined the UKB as a resident doctor in neurology. My dissertation was titled 'What went wrong in my life and how did I end up here?' Please do not hesitate to contact me or our office if you have any questions.",
  position: "Resident doctor",
  clinic: clinic_3)
user_3[:profile_picture] = "https://res.cloudinary.com/ddoiquevw/image/upload/v1575465897/photo-1559839734-2b71ea197ec2_hamr8f.jpg"
user_3.save!

user_4 = User.create!(
  email: "doctor4@example.com",
  password: "123456",
  title: "",
  first_name: "Steffen",
  last_name: "Seibert",
  only_private_insurance: false,
  bio: "I have recently joined the UKB as a resident doctor in neurology. My dissertation was titled 'What went wrong in my life and how did I end up here?' Please do not hesitate to contact me or our office if you have any questions.",
  position: "Resident doctor",
  clinic: clinic_4)
user_4[:profile_picture] = "https://res.cloudinary.com/ddoiquevw/image/upload/v1575465881/photo-1528892952291-009c663ce843_uibbm3.jpg"
user_4.save!

user_5 = User.create!(
  email: "doctor5@example.com",
  password: "123456",
  title: "Prof Dr",
  first_name: "Torben",
  last_name: "Teich",
  only_private_insurance: false,
  bio: "I have recently joined the UKB as a resident doctor in neurology. My dissertation was titled 'What went wrong in my life and how did I end up here?' Please do not hesitate to contact me or our office if you have any questions.",
  position: "Chief doctor",
  clinic: clinic_5)
user_5[:profile_picture] = "https://res.cloudinary.com/ddoiquevw/image/upload/v1575465862/photo-1550831107-1553da8c8464_rf8v8q.jpg"
user_5.save!

user_6 = User.create!(
  email: "doctor6@example.com",
  password: "123456",
  title: "Dr",
  first_name: "Kirsten",
  last_name: "Laube",
  only_private_insurance: false,
  bio: "I have recently joined the UKB as a resident doctor in neurology. My dissertation was titled 'What went wrong in my life and how did I end up here?' Please do not hesitate to contact me or our office if you have any questions.",
  position: "Assistent doctor",
  clinic: clinic_6)
user_6[:profile_picture] = "https://res.cloudinary.com/ddoiquevw/image/upload/v1575465840/photo-1536064479547-7ee40b74b807_sd6vbm.jpg"
user_6.save!

user_7 = User.create!(
  email: "doctor7@example.com",
  password: "123456",
  title: "Prof Dr Med",
  first_name: "Chang",
  last_name: "Lu Li",
  only_private_insurance: false,
  bio: "I have recently joined the UKB as a resident doctor in neurology. My dissertation was titled 'What went wrong in my life and how did I end up here?' Please do not hesitate to contact me or our office if you have any questions.",
  position: "Chief doctor",
  clinic: clinic_7)
user_7[:profile_picture] = "https://res.cloudinary.com/ddoiquevw/image/upload/v1575465817/photo-1567568315185-8738d14226ce_gferkc.jpg"
user_7.save!

user_8 = User.create!(
  email: "r.gordillo@charite.de",
  password: "123456",
  title: "Prof Dr",
  first_name: "Ramiro",
  last_name: "Gordillo",
  only_private_insurance: false,
  bio: "For the last twenty years, I have been specializing in Cardiovascular Disease. I am practising at Charité Mitte and Virchow Campuses. In addition, I am involved in teaching our students as well as cardiovascular research on biomarkers.",
  position: "Chief doctor",
  clinic: clinic_1)
user_8[:profile_picture] = "https://res.cloudinary.com/ddoiquevw/image/upload/v1575465930/photo-1544819616-8b86befe568c_qzthlq.jpg"
user_8.save!

UserSpecialty.create!(user: user_1, specialty: cardiology)
UserSpecialty.create!(user: user_2, specialty: oncology)
UserSpecialty.create!(user: user_3, specialty: neurology)
UserSpecialty.create!(user: user_4, specialty: cardiology)
UserSpecialty.create!(user: user_5, specialty: oncology)
UserSpecialty.create!(user: user_6, specialty: neurology)
UserSpecialty.create!(user: user_7, specialty: oncology)
UserSpecialty.create!(user: user_8, specialty: general_surgery)

UserField.create!(user: user_1, field: cardiology_condition_1)
UserField.create!(user: user_1, field: cardiology_condition_2)
UserField.create!(user: user_1, field: cardiology_condition_3)
UserField.create!(user: user_1, field: cardiology_condition_4)
UserField.create!(user: user_1, field: cardiology_condition_5)

UserField.create!(user: user_2, field: oncology_condition_1)
UserField.create!(user: user_2, field: oncology_condition_2)
UserField.create!(user: user_2, field: oncology_condition_3)
UserField.create!(user: user_2, field: oncology_condition_4)

UserField.create!(user: user_3, field: neurology_condition_1)
UserField.create!(user: user_3, field: neurology_condition_2)
UserField.create!(user: user_3, field: neurology_condition_3)
UserField.create!(user: user_3, field: neurology_condition_4)

UserField.create!(user: user_5, field: oncology_condition_1)
UserField.create!(user: user_5, field: oncology_condition_2)
UserField.create!(user: user_5, field: oncology_condition_4)

UserField.create!(user: user_7, field: oncology_condition_1)
UserField.create!(user: user_7, field: oncology_condition_3)
UserField.create!(user: user_7, field: oncology_condition_4)

approval_1 = Approval.create!(giver: user_1, receiver: user_2, specialty: oncology, headline: "The one and only", content: "I have been working together with Dr Meier and I can highly recommend him based on his experience.")
approval_2 = Approval.create!(giver: user_1, receiver: user_3, specialty: neurology, headline: "Excellent physician", content: "As I have taught Steffen Seibert over several years, I can highly recommend this young physician for the neurological conditions specified.")

approval_3 = Approval.create!(giver: user_2, receiver: user_1, specialty: cardiology, headline: "The one and only", content: "What can I say, there is only one doctor house in the world, and you can find him at Charité Mitte.")
approval_4 = Approval.create!(giver: user_2, receiver: user_3, specialty: neurology, headline: "Excellent neurologist", content: "Seibert is far ahead of many colleagues that I have encountered at his stage. Overall, a promising young physician that I can recommedn without any hesitation.")

approval_5 = Approval.create!(giver: user_3, receiver: user_1, specialty: cardiology, headline: "Leading expert", content: "Dr House belongs to the country's leading experts in cardiology. He is an excellent interventional cardiologist with almost three decades of experience.")
approval_6 = Approval.create!(giver: user_3, receiver: user_2, specialty: oncology, headline: "First hand experience", content: "As a clinician myself I have been treated by Dr Meier. He is one of the most able oncologists that I have encountered over my career.")

ApprovalField.create!(approval: approval_1, field: oncology_condition_1)
ApprovalField.create!(approval: approval_1, field: oncology_condition_2)
ApprovalField.create!(approval: approval_1, field: oncology_condition_3)
ApprovalField.create!(approval: approval_1, field: oncology_condition_4)

ApprovalField.create!(approval: approval_2, field: neurology_condition_1)
ApprovalField.create!(approval: approval_2, field: neurology_condition_2)
ApprovalField.create!(approval: approval_2, field: neurology_condition_3)

ApprovalField.create!(approval: approval_3, field: cardiology_condition_1)
ApprovalField.create!(approval: approval_3, field: cardiology_condition_2)
ApprovalField.create!(approval: approval_3, field: cardiology_condition_3)
ApprovalField.create!(approval: approval_3, field: cardiology_condition_4)

ApprovalField.create!(approval: approval_4, field: neurology_condition_2)
ApprovalField.create!(approval: approval_4, field: neurology_condition_3)
ApprovalField.create!(approval: approval_4, field: neurology_condition_4)
ApprovalField.create!(approval: approval_4, field: neurology_condition_5)

ApprovalField.create!(approval: approval_5, field: cardiology_condition_2)
ApprovalField.create!(approval: approval_5, field: cardiology_condition_3)
ApprovalField.create!(approval: approval_5, field: cardiology_condition_4)
ApprovalField.create!(approval: approval_5, field: cardiology_condition_5)

ApprovalField.create!(approval: approval_6, field: oncology_condition_2)
ApprovalField.create!(approval: approval_6, field: oncology_condition_3)
ApprovalField.create!(approval: approval_6, field: oncology_condition_4)
ApprovalField.create!(approval: approval_6, field: oncology_condition_5)

puts 'SUCCESSFULLY SEEDED :-)'

# done
