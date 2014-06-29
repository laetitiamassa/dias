ActiveAdmin.register User do

  index do
    column :name_or_fullname
    column :phone
    column :skype
    column :email
    column :validated
    column :director
    column :contribution
    column :contribution_frequency
    column :total_contribution
    column :skills
    column :birth_date
    column :birth_place
    column :pays
    column :address 
    actions 
  end

  permit_params :email, :name, :first_name, :last_name, :birth_date, :birth_place,
                                  :pays, :address,
                                  :phone, :skype,
                                  :membership, :skills,
                                  :contribution, :contribution_frequency, :total_contribution,
                                  :director, :validated
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
