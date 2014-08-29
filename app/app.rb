module FlexibleApiPadrinoExample
  class App < Padrino::Application
    use ActiveRecord::ConnectionAdapters::ConnectionManagement
    register Padrino::Mailer
    register Padrino::Helpers
    register Padrino::Rendering

    Rabl.register!
    enable :sessions

  end
end
