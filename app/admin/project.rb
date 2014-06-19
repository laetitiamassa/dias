ActiveAdmin.register Project do

  index do
    column :title
    column :description
    column :pays
    column :sector
    column :budget
    column :funding
    column :deadline
  end

  permit_params :title, :description,
                                      :pays, :sector,
                                      :budget, :funding, :deadline
  
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
