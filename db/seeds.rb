puts 'Cleaning database...'

UserSpecialty.destroy_all
UserField.destroy_all
ApprovalField.destroy_all
Approval.destroy_all
Field.destroy_all
Specialty.destroy_all
User.destroy_all
Clinic.destroy_all

puts "Create test users, clinics, fields, specialties and approvals..."

cardiology = Specialty.create(name: 'cardiology')
oncology = Specialty.create(name: 'oncology')
neurology = Specialty.create(name: 'neurology')

cardiology_fields = ['Hypertension', 'Coronary disease', 'Angiology', 'Interventional Cardiology', 'Cardiovascular intensive care', 'Congenital heart defects in adults', 'Cardiomyopathy', 'Heart failure', 'Valvular disorders', 'Sport cardiology']

oncology_fields = ['Lung cancer', 'Pancreatic cancer', 'Palliative care', 'Radiation Oncology', 'Pediatric Oncology', 'Surgical Oncology', 'Gynecologic Oncology', 'Hematologic-oncology', 'Neuropediatric Oncology', 'Oncological Trials']

neurology_fields = ['Stroke', 'Chronic degenerative diseases', 'Rehabilitation', 'Clinical Neurophysiologist', 'Vascular Neurologist', 'Pain Management and Palliative Care', 'Neurodevelopmental and Neuromuscular Neurology', 'Pediatric Neurology', 'Neurological Geriatric Conditions']


cardiology_fields.each do |field|
  Field.create(name: field, specialty: cardiology)
end

oncology_fields.each do |field|
  Field.create(name: field, specialty: oncology)
end

neurology_fields.each do |field|
  Field.create(name: field, specialty: neurology)
end

clinic_1 = Clinic.create(
  name:'Charite Berlin Mitte',
  website:'www.charite.de',
  phone_number: '030 1234 456789',
  email: 'service@charite.de',
  clinic_picture: "https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1035&q=80",
  description: "Charité is one of the largest university hospitals in Europe. All of our clinical care, research and teaching is delivered by physicians and researchers of the highest international standard. Charité proudly lays claim to more than half of all German Nobel Prize winners in Physiology or Medicine, including Emil von Behring, Robert Koch, and Paul Ehrlich. Charité is internationally renowned for its excellence in teaching and training.",
  address: "Chariteplatz 1, 10117 Berlin",
  consultation_times: "Mo - Fr: 10am - 5pm")

clinic_2 = Clinic.create(
  name:'Bundeswehrkrankenhaus Berlin',
  website:' www.bwkrankenhaus.de',
  phone_number: '030 28412289',
  email: 'info@bw-krankenhaus.de',
  clinic_picture: "https://images.unsplash.com/photo-1495202337139-e865ed70fcd4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1655&q=80",
  description: "The Joint Medical Service (German: Zentraler Sanitätsdienst der Bundeswehr) is a part of the Bundeswehr, the armed forces of Germany and serves all three armed services (Army, Navy and Air Force). However, members of the central medical corps remain members of their respective military branches. Only a few specialized medical units such as the medical care for divers and aircraft crews are not incorporated in the Joint Medical Service. Prior to 2002 each military branch had its own medical service. The services were then largely merged, forming the Joint Medical Service.",
  address: "Scharnhorststraße 13, 10115 Berlin",
  consultation_times: "Mo - Fr: 10am - 5pm")

clinic_3 = Clinic.create(
  name:'Dr med Scheuer und Kollegen',
  website:'scheuer-und.kollegen',
  phone_number: '030 156810',
  email: 'sprechstunde@scheuer.de',
  clinic_picture: "https://images.unsplash.com/photo-1533042789716-e9a9c97cf4ee?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",
  description: "We are a private clinic with a nice view & competence",
  address: "Wilmersdorfer Str. 102, 10629 Berlin",
  consultation_times: "Mo - Fr: 10am - 5pm")

clinic_4 = Clinic.create(
  name:'Unfallkrankenhaus Berlin (UKB)',
  website:'www.ukb.de',
  phone_number: '030 56810',
  email: 'service@ukb.de',
  clinic_picture: "https://images.unsplash.com/photo-1533042789716-e9a9c97cf4ee?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",
  description: "Das Unfallkrankenhaus Berlin (UKB) ist eine berufsgenossenschaftliche Unfallklinik im Berliner Ortsteil Biesdorf des Bezirks Marzahn-Hellersdorf, die 1997 gegründet wurde. Vorrangig dient es der Behandlung von Unfallverletzten und Notfallpatienten aus dem Raum Berlin-Brandenburg sowie von Schwerbrandverletzten aus ganz Deutschland.[1] Das Haupthaus ist ein Neubau, aber die meisten historischen Gebäude des Wilhelm-Griesinger-Krankenhauses wurden dem UKB zugeschlagen. Somit geht die Geschichte bis zum Ende des 19. Jahrhunderts zurück.",
  address: "Warener Str. 7, 12683 Berlin",
  consultation_times: "Mo - Fr: 10am - 5pm")

clinic_5 = Clinic.create(
  name:'Campus Berlin-Bruch',
  website:'campus-bruch.berlin',
  phone_number: '030 56810',
  email: 'service@bruch.berlin',
  clinic_picture: "https://images.unsplash.com/photo-1445527815219-ecbfec67492e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80",
  description: "Campus Berlin-Buch GmbH offers its clients on Campus Berlin-Buch a comprehensive infrastructure and service culture. The main task of Campus Berlin-Buch GmbH is to assist and support biotech companies – from start-ups to mature enterprises – in settling on the campus of the BiotechPark Berlin-Buch with access to the resources of the Innovation and Incubation Center.",
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  consultation_times: "Mo - Fr: 10am - 5pm")

clinic_6 = Clinic.create(
  name:'Universitätsklinikum Benjamin Franklin',
  website:'www.ukbf.de',
  phone_number: '030 56810',
  email: 'info@ukbf.de',
  clinic_picture: "https://de.wikipedia.org/wiki/Universit%C3%A4tsklinikum_Benjamin_Franklin#/media/Datei:Freie_Universitaet_Berlin_-_Universitaetsklinikum_Benjamin-Franklin_der_Charite_-_Nordseite_1.jpg",
  description: "Das Universitätsklinikum Benjamin Franklin (UKBF) ist ein Klinikum der Vollversorgung. Seit 1998 gehört es zum Verbund der Charité. Zurück geht das Klinikum auf das 1968 eröffnete Klinikum Steglitz der Freien Universität Berlin.[1] Dieses lag im Berliner Ortsteil Lichterfelde des damaligen Bezirks Steglitz (seit 2001: Bezirk Steglitz-Zehlendorf).",
  address: "Hindenburgdamm 12",
  consultation_times: "Mo - Fr: 10am - 5pm")

clinic_7 = Clinic.create(
  name:'Vivantes Klinikum Am Urban',
  website:'www.vivantes.de',
  phone_number: '030 56810',
  email: 'service@vivantes.de',
  clinic_picture: "https://images.unsplash.com/photo-1533042789716-e9a9c97cf4ee?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",
  description: "Vivantes sieht sich längst nicht mehr nur als Krankenhausunternehmen. Unser Auftrag ist die gesundheitliche Daseinsvorsorge für alle Menschen in dieser Stadt, für die Kranken jeden Alters wie für die Gesunden. Kurz: Für Gesundheit in jeder Lebenslage. Lifestyle oder Lebensrettung, glückliche Geburt oder würdiges Sterben: Vivantes ist für Berlin da – für eine halbe Million Menschen Jahr für Jahr. Vivantes gehört zu Berlin. ",
  address: "Maybachufer 50, Berlin",
  consultation_times: "Mo - Fr: 10am - 5pm")

user_1 = User.create(
  email: "doctor1@example.com",
  password: "123456",
  title: "Dr",
  first_name: "Gregory",
  last_name: "House",
  only_private_insurance: false,
  profile_picture: "https://images.unsplash.com/photo-1544819616-8b86befe568c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
  bio: "For the last twenty years, I have been specializing in Cardiovascular Disease. I am practising at Charité Mitte and Virchow Campuses. In addition, I am involved in teaching our students as well as cardiovascular research on biomarkers.",
  position: "Chief doctor",
  clinic: clinic_1)

user_2 = User.create(
  email: "doctor2@example.com",
  password: "123456",
  title: "Prof Dr",
  first_name: "Hans",
  last_name: "Meier",
  only_private_insurance: false,
  profile_picture: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80",
  bio: "Prior to my medical career I have been serving in the Bundeswehr as a paramedic. I have now been working at the Bundeswehrkrankenhaus for about ten years. My research interests include telemedical diagnostics of oncological conditions.",
  position: "Consultant doctor",
  clinic: clinic_2)

user_3 = User.create(
  email: "doctor3@example.com",
  password: "123456",
  title: "Dr",
  first_name: "Sabine",
  last_name: "Scheuer",
  only_private_insurance: true,
  profile_picture: "https://images.unsplash.com/photo-1559839734-2b71ea197ec2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80",
  bio: "I have recently joined the UKB as a resident doctor in neurology. My dissertation was titled 'What went wrong in my life and how did I end up here?' Please do not hesitate to contact me or our office if you have any questions.",
  position: "Resident doctor",
  clinic: clinic_3)

user_4 = User.create(
  email: "doctor4@example.com",
  password: "123456",
  title: "",
  first_name: "Steffen",
  last_name: "Seibert",
  only_private_insurance: false,
  profile_picture: "https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=296&q=80",
  bio: "I have recently joined the UKB as a resident doctor in neurology. My dissertation was titled 'What went wrong in my life and how did I end up here?' Please do not hesitate to contact me or our office if you have any questions.",
  position: "Resident doctor",
  clinic: clinic_4)

user_5 = User.create(
  email: "doctor5@example.com",
  password: "123456",
  title: "Prof Dr",
  first_name: "Torben",
  last_name: "Teich",
  only_private_insurance: false,
  profile_picture: "https://images.unsplash.com/photo-1550831107-1553da8c8464?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80",
  bio: "I have recently joined the UKB as a resident doctor in neurology. My dissertation was titled 'What went wrong in my life and how did I end up here?' Please do not hesitate to contact me or our office if you have any questions.",
  position: "Chief doctor",
  clinic: clinic_5)

user_6 = User.create(
  email: "doctor6@example.com",
  password: "123456",
  title: "Dr",
  first_name: "Kirsten",
  last_name: "Laube",
  only_private_insurance: false,
  profile_picture: "https://images.unsplash.com/photo-1536064479547-7ee40b74b807?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80",
  bio: "I have recently joined the UKB as a resident doctor in neurology. My dissertation was titled 'What went wrong in my life and how did I end up here?' Please do not hesitate to contact me or our office if you have any questions.",
  position: "Assistent doctor",
  clinic: clinic_6)

user_7 = User.create(
  email: "doctor7@example.com",
  password: "123456",
  title: "Prof Dr Med",
  first_name: "Chang",
  last_name: "Lu Li",
  only_private_insurance: false,
  profile_picture: "https://images.unsplash.com/photo-1567568315185-8738d14226ce?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80",
  bio: "I have recently joined the UKB as a resident doctor in neurology. My dissertation was titled 'What went wrong in my life and how did I end up here?' Please do not hesitate to contact me or our office if you have any questions.",
  position: "Chief doctor",
  clinic: clinic_7)


UserSpecialty.create(user_id: 1, specialty_id: 1)
UserSpecialty.create(user_id: 2, specialty_id: 2)
UserSpecialty.create(user_id: 3, specialty_id: 3)
UserSpecialty.create(user_id: 4, specialty_id: 1)
UserSpecialty.create(user_id: 5, specialty_id: 2)
UserSpecialty.create(user_id: 6, specialty_id: 3)
UserSpecialty.create(user_id: 7, specialty_id: 2)

UserField.create(user_id: 1, field_id: 1)
UserField.create(user_id: 1, field_id: 2)
UserField.create(user_id: 1, field_id: 3)
UserField.create(user_id: 1, field_id: 4)
UserField.create(user_id: 1, field_id: 5)

UserField.create(user_id: 2, field_id: 11)
UserField.create(user_id: 2, field_id: 12)
UserField.create(user_id: 2, field_id: 13)
UserField.create(user_id: 2, field_id: 14)

UserField.create(user_id: 3, field_id: 21)
UserField.create(user_id: 3, field_id: 22)
UserField.create(user_id: 3, field_id: 23)
UserField.create(user_id: 3, field_id: 24)

UserField.create(user_id: 5, field_id: 11)
UserField.create(user_id: 5, field_id: 12)
UserField.create(user_id: 5, field_id: 14)

UserField.create(user_id: 7, field_id: 11)
UserField.create(user_id: 7, field_id: 13)
UserField.create(user_id: 7, field_id: 14)

approval1 = Approval.create(giver_id: 1, receiver_id: 2, specialty_id: 2, headline: "The one and only", content: "I have been working together with Dr Meier and I can highly recommend him based on his experience.")
approval2 = Approval.create(giver_id: 1, receiver_id: 3, specialty_id: 3, headline: "Excellent physician", content: "As I have taught Steffen Seibert over several years, I can highly recommend this young physician for the neurological conditions specified.")

approval3 = Approval.create(giver_id: 2, receiver_id: 1, specialty_id: 1, headline: "The one and only", content: "What can I say, there is only one doctor house in the world, and you can find him at Charité Mitte.")
approval4 = Approval.create(giver_id: 2, receiver_id: 3, specialty_id: 3, headline: "Excellent neurologist", content: "Seibert is far ahead of many colleagues that I have encountered at his stage. Overall, a promising young physician that I can recommedn without any hesitation.")

approval5 = Approval.create(giver_id: 3, receiver_id: 1, specialty_id: 1, headline: "Leading expert", content: "Dr House belongs to the country's leading experts in cardiology. He is an excellent interventional cardiologist with almost three decades of experience.")
approval6 = Approval.create(giver_id: 3, receiver_id: 2, specialty_id: 2, headline: "First hand experience", content: "As a clinician myself I have been treated by Dr Meier. He is one of the most able oncologists that I have encountered over my career.")

approval7 = Approval.create(giver_id: 2, receiver_id: 5, specialty_id: 2, headline: "Leading expert", content: "This doctor belongs to the country's leading experts in oncology. He is an excellent doctor with almost three decades of experience.")
approval8 = Approval.create(giver_id: 1, receiver_id: 2, specialty_id: 2, headline: "Leading expert", content: "I can highly recommend Prof Meier for pancreatic surgery. He is particularly renowned for radiation therapy of tumors in cases where chemotherapy is not an option.")
approval9 = Approval.create(giver_id: 1, receiver_id: 2, specialty_id: 2, headline: "First hand experience", content: "As a clinician myself I have been treated by Dr Meier. He is one of the most able oncologists that I have encountered over my career.")
approval10 = Approval.create(giver_id: 5, receiver_id: 5, specialty_id: 2, headline: "First hand experience", content: "As a clinician myself I have been treated by Dr Meier. He is one of the most able oncologists that I have encountered over my career.")

ApprovalField.create(approval_id: 1, field_id: 11)
ApprovalField.create(approval_id: 1, field_id: 12)
ApprovalField.create(approval_id: 1, field_id: 13)
ApprovalField.create(approval_id: 1, field_id: 14)

ApprovalField.create(approval_id: 2, field_id: 21)
ApprovalField.create(approval_id: 2, field_id: 22)
ApprovalField.create(approval_id: 2, field_id: 23)

ApprovalField.create(approval_id: 3, field_id: 1)
ApprovalField.create(approval_id: 3, field_id: 2)
ApprovalField.create(approval_id: 3, field_id: 3)
ApprovalField.create(approval_id: 3, field_id: 4)

ApprovalField.create(approval_id: 4, field_id: 22)
ApprovalField.create(approval_id: 4, field_id: 23)
ApprovalField.create(approval_id: 4, field_id: 24)
ApprovalField.create(approval_id: 4, field_id: 25)

ApprovalField.create(approval_id: 5, field_id: 2)
ApprovalField.create(approval_id: 5, field_id: 3)
ApprovalField.create(approval_id: 5, field_id: 4)
ApprovalField.create(approval_id: 5, field_id: 5)

ApprovalField.create(approval_id: 6, field_id: 12)
ApprovalField.create(approval_id: 6, field_id: 13)
ApprovalField.create(approval_id: 6, field_id: 14)
ApprovalField.create(approval_id: 6, field_id: 15)

ApprovalField.create(approval_id: 7, field_id: 12)
ApprovalField.create(approval_id: 7, field_id: 13)
ApprovalField.create(approval_id: 7, field_id: 14)

ApprovalField.create(approval_id: 8, field_id: 12)
ApprovalField.create(approval_id: 8, field_id: 13)
ApprovalField.create(approval_id: 8, field_id: 15)

ApprovalField.create(approval_id: 9, field_id: 12)
ApprovalField.create(approval_id: 9, field_id: 13)
ApprovalField.create(approval_id: 9, field_id: 14)

ApprovalField.create(approval_id: 10, field_id: 15)

puts 'SUCCESSFULLY SEEDED :-)'


