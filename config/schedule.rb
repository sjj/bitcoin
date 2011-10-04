#job_type :rake, "export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/var/lib/gems/1.8/bin:/usr/bin:/sbin:/bin:/usr/games:/usr/bin && cd :path && RAILS_ENV=:environment bundle exec rake :task :output"

every :hour do
  rake "bitcoin:load_bitcoin_values"
end