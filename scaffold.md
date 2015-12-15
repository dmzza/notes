rails g scaffold Certification name:string acronym:string
rails g scaffold Industry name:string
rails g scaffold State name:string{14} acronym:string{2}

rails g model CompanyCertifications company:belongs_to certification:belongs_to

rails g model CompanyStates company:belongs_to state:belongs_to
rails g model CompanyIndustries company:belongs_to industry:belongs_to

class State
  has_many: users
  has_many: companystates
  has_many: companies
class Company
  has_many: users
  has_many: companyindustries
  has_many: companycertifications
  has_many: companystates
  belongs_to: state
class User
  belongs_to: state
  belongs_to: company
class Industry
  has_many :company_industries
class Certification
  has_many :company_certifications
class CompanyStates
  belongs_to: state
  belongs_to: company
class CompanyIndustries
  belongs_to: industry
class CompanyCertifications
  belongs_to: certifications
  belongs_to: company

rails g scaffold User company:belongs_to first_name:string{30} last_name:string{30} title:string{50} address_1:string{100} address_2:string{50} city:string state:belongs_to zip:string{10} phone_number:integer extension:string{15} fax_number:integer email:string gender:string ethnicity:string veteran_status:string

rails g scaffold Company name:string{50} address_1:string{100} address_2:string{50} city:string state:belongs_to zip:string{10} expiration_date:timestamp is_ca_bid_preference_eligible:boolean business_structure:string year_established:integer number_of_employees:integer last_year_sales:decimal counties:text general_liability_insurance_amount:decimal contract_dollars_level_interest_min:decimal contract_dollars_level_interest_max:decimal nature_of_business:text is_union_contractor:boolean bonding_capacity:string type_of_construction:string
