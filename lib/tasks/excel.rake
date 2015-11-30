namespace :excel do
  desc "Import Clients from CSV File"
  task import_clients: :environment do

  	file ||= "#{Rails.root}/public/clients.csv"

  	CSV.foreach(file, headers: true,  :encoding => "ISO8859-1") do |row|
  		Client.create!(row.to_hash)
  	end

  end

  desc "Import Dog Breeds from CSV File"
  task import_dog_breeds: :environment do

  	file ||= "#{Rails.root}/public/dog_breeds.csv"

  	CSV.foreach(file, headers: true,  :encoding => "ISO8859-1") do |row|
  		Breed.create(name: row[0], species: Species.find_by(name: 'Perros'))
  	end

  end

end
