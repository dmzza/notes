rails g scaffold Industry name:string

rails g scaffold State name:string{14} region:string{10} acronym:string{2}

rails g scaffold Certification name:string acronym:string

rails g scaffold Company name:string{50} address_1:string{100} address_2:string{50} city:string state:belongs_to zip:string{10} business_structure:string year_established:integer number_of_employees:integer last_year_sales:decimal counties:text general_liability_insurance_amount:decimal contract_dollars_level_interest_min:decimal contract_dollars_level_interest_max:decimal nature_of_business:text is_union_contractor:boolean bonding_capacity:string type_of_construction:string

rails g scaffold User company:belongs_to first_name:string{30} last_name:string{30} title:string{50} address_1:string{100} address_2:string{50} city:string state:belongs_to zip:string{10} mobile_number:integer{8} office_number:integer{8} extension:string{15} fax_number:integer{8} gender:string ethnicity:string veteran_status:string

rails g model CertificationsCompanies company:belongs_to certification:belongs_to

rails g model CompanyIndustries company:belongs_to industry:belongs_to

rails g scaffold client name:string{50} address_1:string{100} address_2:string{50} city:string state:belongs_to zip:string{10}

rails g scaffold opportunity client:belongs_to project_name:string contact_name:string contact_phone:integer{8} contact_fax:integer{8} contact_email:string bid_date:date trades_solicited:text instructions:text

rails g scaffold bid opportunity:belongs_to is_interested:boolean wants_reminder:boolean company:belongs_to area_of_expertise:string

class Certification
  has_many :company_certifications
class CompanyCertification
  belongs_to: company
  belongs_to: certification
class CompanyIndustry
  belongs_to: industry
  belongs_to: company
class CompanyState
  belongs_to: state
  belongs_to: company
class Company
belongs_to: state
  has_many: users
  has_many: company_industries
  has_many: company_certifications
  has_many: company_states
class Industry
 has_many :company_industries
class State
  has_many: users
  has_many: company_states
  has_many: companies
class User
  belongs_to: state
  belongs_to: company


  opportunity has_many bids
  opportunity belongs_to client
  bid belongs_to company
  bid belongs_to user
  bid belongs_to opportunity
