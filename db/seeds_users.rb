User.create!(username: "ゲストユーザー",
             email: 'test@example.com',
             password: '123456',
             password_confirmation: '123456',
             image: open("#{Rails.root}/app/assets/images/8.png"),
             admin: false)