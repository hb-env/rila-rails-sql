json.array!(@registrations) do |registration|
  json.extract! registration, :id, :run_id, :startnumber, :transponder, :finishtime, :runner_title, :runner_name, :runner_firstname, :runner_street, :runner_city, :runner_zip, :runner_country, :runner_date_of_birth, :runner_gender, :runner_contact, :runner_email, :runner_organisation
  json.url registration_url(registration, format: :json)
end
