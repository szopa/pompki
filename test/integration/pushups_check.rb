# -*- coding: utf-8 -*-
require "#{File.dirname(__FILE__)}/../../test/test_helper"


class PushupsCheckTest < ActionDispatch::IntegrationTest
  setup do
    @user = Factory(:user)
  end
  test 'add pushups, check sum' do
    log_in
    visit '/series'
    click_link 'New Serie'
    k = 10
    a=[]
    all(:xpath, '/html/body/form/ol/li/input[1]').each { |i| i.set k+=1; a << k }
    click_button "Create Series"
    assert Pushup.last.amount==k
    k=-1
    all(:xpath, '/html/body/ol/li').each { |i| assert i.text.include? "#{a[k+=1]}" }
    assert Series.last.sum== a.sum
  end
  test 'add series of pushups' do
    log_in
    visit '/series'
    click_link 'New Series'
    click_link 'Add series'
    click_link "Add series"
    p all(:xpath, '/html/body/form/ol/li/input[1]').count
  end
  test 'remove series of pushups'do
    log_in
    visit '/series'
    click_link 'New Series'
    click_link 'usuń'
    a=0
    #all(:xpath, '/html/body/form/ol/li/input[1]').each { |i| p i.visible?}
    page.all('label').each { |i|  a+=1  if i.visible? }
    p a
    save_page
  end
end
