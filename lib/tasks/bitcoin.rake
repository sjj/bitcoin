namespace :bitcoin do
  
  desc "Load Bitcoin values to the database"
  task :load_bitcoin_values => :environment do
    BitcoinApi.loadvalues
  end
  
end