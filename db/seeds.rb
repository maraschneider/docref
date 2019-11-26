puts 'Cleaning database...'

Approval.destroy_all
Field.destroy_all
Specialty.destroy_all
Clinic.destroy_all
User.destroy_all

puts "Create test users, clinics, fields, specialties and approvals..."

cardiology = Specialty.create(name: 'cardiology')
oncology = Specialty.create(name: 'oncology')
neurology = Specialty.create(name: 'neurology')

cardiology_fields = ['Hypertension', 'Coronary disease', 'Angiology', 'Interventional Cardiology', 'Cardiovascular intensive care', 'Congenital heart defects in adults', 'Cardiomyopathy', 'Heart failure', 'Valvular disorders', 'Sport cardiology', 'Cardiac oncology']

oncology_fields = ['Lung cancer', 'Pancreatic cancer', 'Palliative care']

neurology_fields = ['Stroke', 'Chronic degenerative diseases', 'Rehabilitation']


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
  email: 'house@charite.de',
  clinic_picture: "https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1035&q=80",
  description: "Charité is one of the largest university hospitals in Europe. All of our clinical care, research and teaching is delivered by physicians and researchers of the highest international standard. Charité proudly lays claim to more than half of all German Nobel Prize winners in Physiology or Medicine, including Emil von Behring, Robert Koch, and Paul Ehrlich. Charité is internationally renowned for its excellence in teaching and training.  Charité – Universitätsmedizin Berlin represents a single medical faculty, which serves both Humboldt Universtität zu Berlin and Freie Universität Berlin.  Charité extends over four campuses, and has close to 100 different Departments and Institutes, which make up a total of 17 different CharitéCenters.  Having marked its 300-year anniversary in 2010, Charité is now one of the largest employers in Berlin, employing 14,576 staff (or 18,010 if including its subsidiaries), and with a total annual turnover of €1.8 billion.",
  address: "Chariteplatz 1, 10117 Berlin")

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

UserSpecialty.create(user_id: 1, specialty_id: 1)

puts 'SUCCESSFULLY SEEDED :-)'


