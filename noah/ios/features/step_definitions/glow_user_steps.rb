def new_noah_user(args={})
  GlowUser.new(args).parent_signup.login.leave_group 72057594037927941
end

def forum_new_noah_user(args={})
  GlowUser.new(args).parent_signup.login.leave_group 72057594037927941
end
  
Given(/^I create a new "(.*?)" glow user$/) do |type|
  case type.downcase
  when "non-ttc"
    $user = new_noah_user
  when "ttc"
    $user = new_noah_user
  end
  puts $user.email, $user.password
end





#----------------Community--------------------


Given(/^"([^"]*)" create a "([^"]*)" topic in the test group$/) do |user_name, topic_type|
  puts "New Glow User '#{user_name}' created: #{$user.email}, #{$user.password}"
  case topic_type.downcase
  when "text"
    $user.create_topic({:title => 'create topic by www api', :group_id => GROUP_ID})
  when "poll"
    $user.create_poll({:title => 'create poll by www api', :group_id => GROUP_ID})
  end
  puts "Topic created, the title is  >>>>#{$user.topic_title}<<<<"
  logout_if_already_logged_in
end

Then(/^I create another glow user "([^"]*)" and create a topic in the test group$/) do |user_name|
  $user2 = forum_new_noah_user(first_name: user_name).join_group
  puts GROUP_ID
  $user2.create_topic({:title => "Test follow/block user", :group_id => GROUP_ID})
end

Then(/^I created another user to vote the poll$/) do
  $user2 = forum_new_noah_user
  $user2.vote_poll({ topic_id: $user.topic_id})
  puts "#{$user2.email} voted on #{$user.email}'s topic, #{$user.topic_id}"
end


# Then(/^the user add (\d+) comments and user2 added (\d+) subreplies to each comment\.$/) do |comment_number, subreply_number|
Then(/^"([^"]*)" add (\d+) comment(?:s)? and "([^"]*)" added (\d+) subrepl(?:y|ies) to each comment\.$/) do |user1_name, comment_number, user2_name, subreply_number|
  puts "Glow User #{user1_name} topic_id is #{$user.topic_id}"
  $user2 = forum_new_noah_user(first_name: user2_name)
  puts "#{user2_name} user id is: #{$user2.user_id},  email is: #{$user2.email}"
  comment_number.to_i.times do |comment_number|
    $user.reply_to_topic $user.topic_id, reply_content: "content number #{comment_number+1}"
    puts "GlowUser #{user1_name} reply_id is #{$user.reply_id}"
    subreply_number.to_i.times do |subreply_number|
      puts "GlowUser #{user2_name} sub reply ++; subreply number is #{subreply_number+1}"
      $user2.reply_to_comment $user.topic_id, $user.reply_id, reply_content: "subreply number #{subreply_number+1}"
    end
  end
end



Then(/^"([^"]*)" create (\d+) topics$/) do |name, number|
  number.to_i.times do |number|
    $user.create_topic({:title => "Test load more topic #{number+1}"})
  end
end




Then(/^"([^"]*)" create (\d+) topics for searching topic$/) do |name, arg1|
  $topic_numbers = arg1
  $time_created = $user.random_str
  arg1.to_i.times do |arg1|
    $user.create_topic({:title => "Test+search+#{arg1+1}+#{$time_created}" })
  end
end


Then(/^"([^"]*)" create (\d+) topic(?:s)? and (\d+) comment(?:s)? and (\d+) subrepl(?:y|ies) for each comment$/) do |user_name, arg1, comment_number, subreply_number|
  $user.create_topic
  puts "GlowUser #{user_name} topic_id is #{$user.topic_id}, topic title is #{$user.topic_title}"
  $comment_number = comment_number
  $subreply_number = subreply_number
  comment_number.to_i.times do |comment_number|
    $user.reply_to_topic $user.topic_id, reply_content: "Test search comment #{comment_number+1}"
    if comment_number == 0
      $first_comment_id = $user.reply_id
      puts "first reply id is #{$first_comment_id}"
    end
    puts "GlowUser reply_id is #{$user.reply_id}"
    subreply_number.to_i.times do |subreply_number|
      puts "GlowUser sub reply ++"
      $user.reply_to_comment $user.topic_id, $user.reply_id, reply_content: "Test search sub-reply #{subreply_number+1}"
    end
  end
end



Then(/^another user "([^"]*)" create (\d+) topic(?:s)? and (\d+) comment(?:s)? and (\d+) subrepl(?:y|ies) for each comment$/) do |name, arg1, comment_number, subreply_number|
  $user2 = forum_new_noah_user(first_name: name)
  $user2.create_topic :title => "Test hide/flag #{$user2.random_str}"
  puts "Glow User #{name} topic_id is #{$user2.topic_id}, topic title is #{$user2.topic_title}"
  $comment_number2 = comment_number
  $subreply_number2 = subreply_number
  comment_number.to_i.times do |comment_number|
    $user2.reply_to_topic $user2.topic_id, reply_content: "Test hide/report comment #{comment_number+1}"
    $hidereply_content = "Test hide/report comment #{comment_number+1}"
    puts "GlowUser2 reply_id is #{$user2.reply_id}"
    subreply_number.to_i.times do |subreply_number|
      puts "GlowUser2 sub reply ++"
      $user2.reply_to_comment $user2.topic_id, $user2.reply_id, reply_content: "Test hide/report sub-reply #{subreply_number+1}"
    end
  end
end

Then(/^"([^"]*)" create topics and comments and replies for delete use$/) do |name|
  $user.create_topic
  puts "GlowUser #{name} topic_id is #{$user.topic_id}, topic title is #{$user.topic_title}"
  $random_str1 = $user.random_str
  $random_str2 = $user.random_str
  $user.reply_to_topic $user.topic_id, reply_content: "#{$random_str1}"
  puts "GlowUser #{name} reply_id is #{$user.reply_id}, reply_content = #{$random_str1}"
  $user.reply_to_comment $user.topic_id, $user.reply_id, reply_content: "#{$random_str2}"
  puts "GlowUser #{name} subreply content is #{$random_str2}"
  $user.delete_topic $user.topic_id
end


Then(/^I follow another user "([^"]*)" and the user also follows me$/) do |arg1|
  $user2 = forum_new_noah_user(first_name: arg1)
  $user.follow_user $user2.user_id
  $user2.follow_user $user.user_id
end


Then(/^the user bookmarked the topic$/) do
  $user.bookmark_topic $user.topic_id
end


Given(/^the user upvote the first comment$/) do
  $user.upvote_comment $user.topic_id, $first_comment_id
end

Given(/^(\d+) other users upvote the topic and (\d+) other users downvote the topic$/) do |arg1, arg2|
  arg1.to_i.times do
    new_user = new_noah_user.upvote_topic $user.topic_id
    puts "#{new_user.first_name} upvoted #{$user.topic_id}  >> #{$user.topic_title} << "
  end
  arg2.to_i.times do
    new_user = new_noah_user.downvote_topic $user.topic_id
    puts "#{new_user.first_name} downvoted #{$user.topic_id} >> #{$user.topic_title} << "
  end
end

Given(/^(\d+) other users upvote the comment and (\d+) other users downvote the comment$/) do |arg1, arg2|
  arg1.to_i.times do
    new_user = new_noah_user.upvote_comment $user.topic_id, $first_comment_id
    puts "#{new_user.first_name} upvoted comment #{$first_comment_id} under #{$user.topic_id}  >> #{$user.topic_title} << "
  end
  arg2.to_i.times do
    new_user = new_noah_user.downvote_comment $user.topic_id, $first_comment_id
    puts "#{new_user.first_name} downvoted comment #{$first_comment_id} under #{$user.topic_id} >> #{$user.topic_title} << "
  end
end

Given(/^(\d+) other users reported the topic$/) do |arg1|
  reason_poll = ["Wrong group", "Rude", "Obscene", "Spam", "Solicitation"]
  arg1.to_i.times do
    new_user = new_noah_user.report_topic $user.topic_id, reason_poll.sample
    puts "#{new_user.first_name} reported #{$user.topic_id}"
  end
end


Given(/^(\d+) other users reported the comment$/) do |arg1|
  reason_poll = ["Rude", "Obscene", "Spam", "Solicitation"]
  arg1.to_i.times do
    new_user = new_noah_user.report_comment $user.topic_id, $first_comment_id, reason_poll.sample
    puts "#{new_user.first_name} reported #{$user.topic_id}"
  end
end

Given(/^I create a new "(.*?)" glow user with name "(.*?)"$/) do |type,name|
  case type.downcase
  when "non-ttc"
    $user = forum_new_noah_user(first_name: name)
  when "ttc"
    $user = forum_new_noah_user(first_name: name)
  when "prep", "med", "iui", "ivf"
    $user = forum_new_ft_user(type: type, first_name: name)
  when "single male"
    $user = GlowUser.new(gender: "male", first_name: name).male_signup.join_group
  end
  puts $user.email, $user.password
  puts "Default group id is #{GROUP_ID}"
end