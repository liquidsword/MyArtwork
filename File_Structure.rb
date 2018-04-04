├── CONTRIBUTING.md
├── Gemfile
├── Gemfile.lock
├── LICENSE.md
├── README.md
├── Rakefile
├── app
│   ├── controllers
│   │   └── application_controller.rb
        └── artwork_controller.rb
        └── user_controller.rb
│   ├── models
│   │   ├── artwork.rb
│   │   └── user.rb
│   └── views
│       ├── index.erb
│       ├── layout.erb
│       ├── artwork
│       │   ├── create_artwork.erb
│       │   ├── edit_artwork.erb
│       │   ├── show_artwork.erb
│       │   └── artwork.erb
│       └── users
│           ├── create_user.erb
│           └── login.erb
│           └── show.erb
├── config
│   └── environment.rb
├── config.ru
├── db
│   ├── development.sqlite
│   ├── migrate
│   │   ├── 01_create_users.rb
│   │   └── 02_create_artwork.rb
│   ├── schema.rb
│   └── test.sqlite
└── spec
├── controllers
│   └── application_controller_spec.rb
└── spec_helper.rb
