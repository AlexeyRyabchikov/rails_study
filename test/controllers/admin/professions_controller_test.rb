require 'test_helper'

class Admin::ProfessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profession = create :profession
    @admin = create :admin
    sign_in_as_admin(@admin)
  end

  test 'should get index profession page' do
    get admin_professions_path
    assert_response :success
  end

  test 'should get new profession page' do
    get new_admin_profession_path
    assert_response :success
  end

  test 'should post create profession' do
    profession_attrs = attributes_for :profession

    post admin_professions_path, params: { profession: profession_attrs }
    assert_response :redirect

    profession = Profession.last
    assert_equal profession_attrs[:description], profession.description
  end

  test 'should not post create profession' do
    profession_attrs = attributes_for :profession, title: nil

    post admin_professions_path, params: { profession: profession_attrs }
    assert_response :success

    profession = Profession.find_by(title: profession_attrs[:title])
    assert_nil profession
  end

  test 'should get show profession page' do
    get admin_profession_path(@profession.id)
    assert_response :success
  end

  test 'should get edit profession page' do
    get edit_admin_profession_path(@profession.id)
    assert_response :success
  end

  test 'should put update profession' do
    attrs = {}
    attrs[:title] = generate :title

    put admin_profession_path(@profession.id), params: { profession: attrs }
    assert_response :redirect

    @profession.reload
    assert_equal attrs[:title], @profession.title
  end

  test 'should delete destroy profession' do
    delete admin_profession_path(@profession.id)
    assert_response :redirect

    assert_not Profession.exists?(@profession.id)
  end
end