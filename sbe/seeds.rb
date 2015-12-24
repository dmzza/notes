# roles_users Table
  r1 = Role.create({name: "Admin", description: "Can perform any CRUD operation on any resource"})
  r2 = Role.create({name: "Employee", description: "Can read and create items. Can update and destroy own items"})
  r3 = Role.create({name: "Client", description: "Can read items"})

  u1 = User.create({first_name: "Sally", last_name: "Mae", email: "sally@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", roles: [ r1 ] })
  u2 = User.create({first_name: "Sue", last_name: "Moz", email: "sue@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", roles: [ r1, r3 ] })
  u3 = User.create({first_name: "Kev", last_name: "Doe", email: "kev@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", roles: [ r3 ] })
  u4 = User.create({first_name: "David", last_name: "Solis", email: "David@soliskit.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", roles: [ r1, r2, r3 ] })
  u5 = User.create({first_name: "Patrick", last_name: "Morrissey", email: "litlmoz@gmail.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", roles: [ r1, r2, r3 ] })

# Industry Table
  industry_list = [
    'Agriculture, Forestry, Fishing',
    'Mining',
    'Construction',
    'Manufacturing',
    'Transportation & Public Utilities',
    'Wholesale Trade',
    'Retail Trade',
    'Finance, Insurance, & Real Estate',
    'Services',
  ]

industry_list.each do |name|
  Industry.create( name: name )
end

# States Table
  state_list = [
    ['Alabama', 'AL', 'South'],
    ['Alaska', 'AK', 'West'],
    ['Arizona', 'AZ', 'West'],
    ['Arkansas', 'AR', 'South'],
    ['California', 'CA', 'West'],
    ['Colorado', 'CO', 'West'],
    ['Connecticut', 'CT', 'Northeast'],
    ['Delaware', 'DE', 'South'],
    ['Florida', 'FL', 'South'],
    ['Georgia', 'GA', 'South'],
    ['Hawaii', 'HI', 'West'],
    ['Idaho',	'ID', 'West'],
    ['Illinois', 'IL', 'Midwest'],
    ['Indiana',	'IN', 'Midwest'],
    ['Iowa', 'IA', 'Midwest'],
    ['Kansas', 'KS', 'Midwest'],
    ['Kentucky', 'KY', 'South'],
    ['Louisiana',	'LA', 'South'],
    ['Maine',	'ME', 'Northeast'],
    ['Maryland', 'MD', 'South'],
    ['Massachusetts',	'MA', 'Northeast'],
    ['Michigan', 'MI', 'Midwest'],
    ['Minnesota',	'MN', 'Midwest'],
    ['Mississippi',	'MS', 'South'],
    ['Missouri', 'MO', 'Midwest'],
    ['Montana',	'MT', 'West'],
    ['Nebraska', 'NE', 'Midwest'],
    ['Nevada', 'NV', 'West'],
    ['New Hampshire',	'NH', 'Northeast'],
    ['New Jersey', 'NJ', 'Northeast'],
    ['New Mexico', 'NM', 'West'],
    ['New York', 'NY', 'Northeast'],
    ['North Carolina', 'NC', 'South'],
    ['North Dakota', 'ND', 'Midwest'],
    ['Ohio', 'OH', 'Midwest'],
    ['Oklahoma', 'OK', 'South'],
    ['Oregon', 'OR', 'West'],
    ['Pennsylvania', 'PA', 'Northeast'],
    ['Rhode Island', 'RI', 'Northeast'],
    ['South Carolina', 'SC', 'South'],
    ['South Dakota', 'SD', 'Midwest'],
    ['Tennessee',	'TN', 'South'],
    ['Texas',	'TX', 'South'],
    ['Utah', 'UT', 'West'],
    ['Vermont',	'VT', 'Northeast'],
    ['Virginia', 'VA', 'South'],
    ['Washington', 'WA', 'West'],
    ['West Virginia',	'WV', 'South'],
    ['Wisconsin',	'WI', 'Midwest'],
    ['Wyoming',	'WY', 'West'],
    ['Washington DC',	'DC', 'South'],
  ]

state_list.each do |name, acronym, region|
  State.create( name: name, acronym: acronym, region: region )
end

# Certificates Table
  certificate_list = [

  ]
certificate_list.each do |name, acronym|
  Certificate.create( name: name, acronym: acronym )
end
