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


  csv col_sep: ';', force_quotes: true do
    column('ID') { |r| r.id }
    column('User_email') { |r| r.user.email }
    column('User_first_name') { |r| r.user.first_name}
    column('User_last_name') { |r| r.user.last_name}
    column('User_password') { |r| r.user.password}
    column('Date') { |r| r.fake_date}
    column('Body review') { |r| r.content}
    column('Guide Csv') { |r| r.guide.user.email}
  end



end
