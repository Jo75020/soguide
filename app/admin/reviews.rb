ActiveAdmin.register Review do
permit_params :content, :user_id, :guide_id, :checked
      form do |f|
    f.inputs "Review" do
      f.input :user_id
      f.input :guide_id
      f.input :content
      f.input :checked
    end
    f.actions
  end
end