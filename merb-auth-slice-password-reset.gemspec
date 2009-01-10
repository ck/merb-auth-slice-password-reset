# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{merb-auth-slice-password-reset}
  s.version = "0.9.12"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Daniel Neighman, Christian Kebekus"]
  s.date = %q{2009-01-10}
  s.description = %q{Merb Slice that adds basic password-reset functionality to merb-auth-based merb applications.}
  s.email = %q{has.sox@gmail.com}
  s.extra_rdoc_files = ["README.textile", "LICENSE", "TODO"]
  s.files = ["LICENSE", "README.textile", "Rakefile", "TODO", "lib/merb-auth-slice-password-reset", "lib/merb-auth-slice-password-reset/merbtasks.rb", "lib/merb-auth-slice-password-reset/mixins", "lib/merb-auth-slice-password-reset/mixins/senile_user", "lib/merb-auth-slice-password-reset/mixins/senile_user/ar_senile_user.rb", "lib/merb-auth-slice-password-reset/mixins/senile_user/dm_senile_user.rb", "lib/merb-auth-slice-password-reset/mixins/senile_user/sq_senile_user.rb", "lib/merb-auth-slice-password-reset/mixins/senile_user.rb", "lib/merb-auth-slice-password-reset/slicetasks.rb", "lib/merb-auth-slice-password-reset/spectasks.rb", "lib/merb-auth-slice-password-reset.rb", "spec/mailers", "spec/mailers/password_reset_mailer_spec.rb", "spec/mixins", "spec/mixins/senile_user_spec.rb", "spec/spec_helper.rb", "app/controllers", "app/controllers/application.rb", "app/controllers/passwords.rb", "app/helpers", "app/helpers/application_helper.rb", "app/helpers/mailer_helper.rb", "app/mailers", "app/mailers/password_reset_mailer.rb", "app/mailers/views", "app/mailers/views/password_reset_mailer", "app/mailers/views/password_reset_mailer/new_password.html.erb", "app/mailers/views/password_reset_mailer/password_reset.text.erb", "app/views", "app/views/layout", "app/views/layout/merb_auth_slice_password_reset.html.erb", "app/views/passwords", "app/views/passwords/forgot_password.html.erb", "public/javascripts", "public/javascripts/master.js", "public/stylesheets", "public/stylesheets/master.css", "stubs/app", "stubs/app/controllers", "stubs/app/controllers/passwords.rb", "stubs/app/mailers", "stubs/app/mailers/views", "stubs/app/mailers/views/password_reset_mailer", "stubs/app/mailers/views/password_reset_mailer/new_password.html.erb", "stubs/app/mailers/views/password_reset_mailer/password_reset.text.erb", "stubs/app/views", "stubs/app/views/passwords", "stubs/app/views/passwords/forgot_password.html.erb"]
  s.has_rdoc = true
  s.homepage = %q{http://merbivore.com/}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{merb}
  s.rubygems_version = %q{1.3.0}
  s.summary = %q{Merb Slice that adds basic password-reset functionality to merb-auth-based merb applications.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<merb-slices>, [">= 1.0.0"])
      s.add_runtime_dependency(%q<merb-auth-core>, [">= 1.0.0"])
      s.add_runtime_dependency(%q<merb-auth-more>, [">= 1.0.0"])
      s.add_runtime_dependency(%q<merb-mailer>, [">= 1.0.0"])
    else
      s.add_dependency(%q<merb-slices>, [">= 1.0.0"])
      s.add_dependency(%q<merb-auth-core>, [">= 1.0.0"])
      s.add_dependency(%q<merb-auth-more>, [">= 1.0.0"])
      s.add_dependency(%q<merb-mailer>, [">= 1.0.0"])
    end
  else
    s.add_dependency(%q<merb-slices>, [">= 1.0.0"])
    s.add_dependency(%q<merb-auth-core>, [">= 1.0.0"])
    s.add_dependency(%q<merb-auth-more>, [">= 1.0.0"])
    s.add_dependency(%q<merb-mailer>, [">= 1.0.0"])
  end
end
