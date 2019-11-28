# frozen_string_literal: true

user = User.where(email: 'lewisdylan@octangrp.com').first_or_create!(name: 'lewis')
puts user.slug
Iteration.where(user: user).first_or_create!
