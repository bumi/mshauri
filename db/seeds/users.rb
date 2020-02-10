# frozen_string_literal: true

user = User.where(email: 'admin@tech-guide.rw').first_or_initialize(name: 'admin')
user.admin = true
user.save!
puts '------'
puts "Created an admin user: admin@tech-guide.rw - slug: #{user.slug} (http://localhost:3000/#{user.slug})"
puts '------'
Iteration.where(user: user).first_or_create!
