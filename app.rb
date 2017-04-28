require('sinatra')
require('sinatra/reloader')
require('./lib/definition')
require('./lib/word')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all()
  erb(:index)
end

post('/new') do
  word = params.fetch('word')
  Word.new({:word_content => word}).save
  @words = Word.all()
  erb(:index)
end

# get('/contacts') do
#   @contacts = Contact.all()
#   erb(:contacts)
# end
#
# get('/contacts/new') do
#   erb(:contacts_form)
# end
#
# post('/contacts') do
#   first_name = params.fetch('first_name')
#   last_name = params.fetch('last_name')
#   job_title = params.fetch('job_title')
#   company = params.fetch('company')
#   Contact.new({:first_name => first_name, :last_name => last_name, :job_title => job_title, :company => company}).save()
#   @contacts = Contact.all()
#   erb(:contacts)
# end
#
# get('/contacts/:id') do
#   @contact = Contact.find(params.fetch('id').to_i())
#   erb(:contact)
# end
#
# get('/contacts/:id/emails/new') do
#   @contact = Contact.find(params.fetch('id').to_i())
#   erb(:email_address_form)
# end
#
# get('/contacts/:id/phone_numbers/new') do
#   @contact = Contact.find(params.fetch('id').to_i())
#   erb(:phone_number_form)
# end
#
# get('/contacts/:id/mailing_addresses/new') do
#   @contact = Contact.find(params.fetch('id').to_i())
#   erb(:mailing_address_form)
# end
#
# post('/contacts/:id') do
#   contact = Contact.find(params.fetch('id').to_i())
#   @contact = contact
#   if params[:phone_number]
#     phone_number = params.fetch('phone_number')
#     area_code = params.fetch('area_code')
#     type = params.fetch('type')
#     @phone_number = Phone_number.new({:phone_number => phone_number, :area_code => area_code, :type => type})
#     contact.add_phone_number(@phone_number)
#   elsif params[:email]
#     email = params.fetch('email')
#     @email = Email_address.new({:email => email})
#     contact.add_email_address(@email)
#   else
#     street_address = params.fetch('street_address')
#     city = params.fetch('city')
#     state = params.fetch('state')
#     zip = params.fetch('zip')
#     type = params.fetch('type')
#     @mailing_address = Mailing_address.new({:street_address => street_address, :city => city, :state => state, :zip => zip, :type => type})
#     contact.add_mailing_address(@mailing_address)
#   end
#   erb(:contact)
