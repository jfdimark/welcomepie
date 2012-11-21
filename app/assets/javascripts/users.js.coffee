# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#user_occupation_list').tokenInput '/tag_data/find_tags.json'
    theme: 'facebook'
    tokenValue: 'name'
    prePopulate: $('#user_occupation_list').data('load')
    
  $('#user_gender_list').tokenInput '/tag_data/find_tags.json'
    theme: 'facebook'
    tokenValue: 'name'
    prePopulate: $('#user_gender_list').data('load')

  $('#moving_from_user_list').tokenInput '/tag_data/find_tags.json'
    theme: 'facebook'
    tokenValue: 'name'
    prePopulate: $('#moving_from_user_list').data('load')

  $('#moving_to_user_list').tokenInput '/tag_data/find_tags.json'
    theme: 'facebook'
    tokenValue: 'name'
    prePopulate: $('#moving_to_user_list').data('load')

  $('#family_type_user_list').tokenInput '/tag_data/find_tags.json'
    theme: 'facebook'
    tokenValue: 'name'
    prePopulate: $('#family_type_user_list').data('load')

  $('#age_bracket_user_list').tokenInput '/tag_data/find_tags.json'
    theme: 'facebook'
    tokenValue: 'name'
    prePopulate: $('#age_bracket_user_list').data('load')

  $('#interest_user_list').tokenInput '/tag_data/find_tags.json'
    theme: 'facebook'
    tokenValue: 'name'
    prePopulate: $('#interest_user_list').data('load')