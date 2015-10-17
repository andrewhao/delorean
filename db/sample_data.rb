# Populate the database with a small set of realistic sample data so that as a developer/designer, you can use the
# application without having to create a bunch of stuff or pull down production data.
#
# After running db:sample_data, a developer/designer should be able to fire up the app, sign in, browse data and see
# examples of practically anything (interesting) that can happen in the system.
#
# It's a good idea to build this up along with the features; when you build a feature, make sure you can easily demo it
# after running db:sample_data.
#
# Data that is required by the application across all environments (i.e. reference data) should _not_ be included here.
# That belongs in seeds.rb instead.
#
puts "Creating sample data..."
begin
  ActiveRecord::Base.transaction do
    u1 = User.create!(email: "driver1@example.com", password: "password", is_driver: true)
    u2 = User.create!(email: "passenger2@example.com", password: "password")
    u3 = User.create!(email: "passenger3@example.com", password: "password")

    year_2015 = Time.zone.parse("2015-01-01")
    year_1985 = Time.zone.parse("1985-01-01")
    year_1955 = Time.zone.parse("1955-01-01")

    vehicle_type_default = VehicleType.create!(name: "delorean")
    vehicle_type_van = VehicleType.create!(name: "delorean-van")

    tier_default = ServiceTier.create!(rate: 5, vehicle_type: vehicle_type_default)
    tier_pool = ServiceTier.create!(rate: 2, vehicle_type: vehicle_type_default, is_eligible_for_trip_pooling: true)
    tier_xl = ServiceTier.create!(rate: 10, vehicle_type: vehicle_type_van)
    v1 = Vehicle.create!(user: u1, gigawatt_output_rating: 1.21, vehicle_type: vehicle_type_default)

    t1 = Trip.create!(origin_date: year_2015, destination_date: year_1985, driver: u1, passenger: u2, service_tier: tier_default)
    t2 = Trip.create!(origin_date: year_2015, destination_date: year_1955, driver: u1, passenger: u2, service_tier: tier_pool)
    t3 = Trip.create!(origin_date: year_1985, destination_date: year_1955, driver: u1, passenger: u3, service_tier: tier_pool)
    tpool = TripPool.create
    tpool.update(trips: [t2, t3])

    payment1 = Payment.create(user: u2, trip: t1, amount: 500)
    payment2 = Payment.create(user: u2, trip: t2, amount: 200)
    payment3 = Payment.create(user: u3, trip: t3, amount: 200)

    puts "Finished creating sample data."
  end
rescue Exception => e
  puts "I found an error. Aborting..."
  puts e.inspect
end

