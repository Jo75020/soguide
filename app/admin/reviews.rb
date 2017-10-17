ActiveAdmin.register Review do
permit_params :content, :user_id, :guide_id, :checked
      form do |f|
    f.inputs "Review" do
      f.input :user
      f.input :guide
      f.input :content
      f.input :checked, checkbox: false
    end
    f.actions
  end
end
