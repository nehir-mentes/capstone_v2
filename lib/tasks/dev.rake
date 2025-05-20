desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do

    if Rails.env.development?
    User.destroy_all
    end

    names.each do |name|
      user = User.new
      user.email    = "#{name.downcase}@example.com"
      user.password = "password"
      user.save
    end

  p "Added #{User.count} Users"

end
