if defined?(Merb::Plugins)

  $:.unshift File.dirname(__FILE__)

  load_dependency 'merb-slices'
  load_dependency 'merb-auth-core'
  load_dependency 'merb-auth-more'
  load_dependency 'merb-mailer'
  require(File.expand_path(File.dirname(__FILE__) / "merb-auth-slice-password-reset" / "mixins") / "senile_user")
  
  Merb::Plugins.add_rakefiles "merb-auth-slice-password-reset/merbtasks", "merb-auth-slice-password-reset/slicetasks", "merb-auth-slice-password-reset/spectasks"

  # Register the Slice for the current host application
  Merb::Slices::register(__FILE__)

  # Slice configuration - set this in a before_app_loads callback.
  # By default a Slice uses its own layout, so you can swicht to
  # the main application layout or no layout at all if needed.
  #
  # Configuration options:
  # :layout - the layout to use; defaults to :merb-auth-slice-password-reset
  # :mirror - which path component types to use on copy operations; defaults to all
  Merb::Slices::config[:merb_auth_slice_password_reset][:layout] ||= :application

  # All Slice code is expected to be namespaced inside a module
  module MerbAuthSlicePasswordReset

    # Slice metadata
    self.description = "MerbAuthSlicePasswordReset is a merb slice that adds password-reset functionality for merb-auth-based merb applications."
    self.version = "0.9.10"
    self.author = "Daniel Neighman, Christian Kebekus"

    # Stub classes loaded hook - runs before LoadClasses BootLoader
    # right after a slice's classes have been loaded internally.
    def self.loaded
    end

    # Initialization hook - runs before AfterAppLoads BootLoader
    def self.init
    end

    # Activation hook - runs after AfterAppLoads BootLoader
    def self.activate
    end

    # Deactivation hook - triggered by Merb::Slices.deactivate(MerbAuthSlicePasswordReset)
    def self.deactivate
    end

    # Setup routes inside the host application
    #
    # @param scope<Merb::Router::Behaviour>
    #  Routes will be added within this scope (namespace). In fact, any
    #  router behaviour is a valid namespace, so you can attach
    #  routes at any level of your router setup.
    #
    # @note prefix your named routes with :merb_auth_slice_password_reset_
    #   to avoid potential conflicts with global named routes.
    def self.setup_router(scope)
      scope.match("/:password_reset_code").to(:controller => "passwords", :action => "reset").name(:reset_password)
    end

  end

  # Setup the slice layout for MerbAuthSlicePasswordReset
  #
  # Use MerbAuthSlicePasswordReset.push_path and MerbAuthSlicePasswordReset.push_app_path
  # to set paths to merb-auth-slice-password-reset-level and app-level paths. Example:
  #
  # MerbAuthSlicePasswordReset.push_path(:application, MerbAuthSlicePasswordReset.root)
  # MerbAuthSlicePasswordReset.push_app_path(:application, Merb.root / 'slices' / 'merb-auth-slice-password-reset')
  # ...
  #
  # Any component path that hasn't been set will default to MerbAuthSlicePasswordReset.root
  #
  # Or just call setup_default_structure! to setup a basic Merb MVC structure.
  MerbAuthSlicePasswordReset.setup_default_structure!
  MaSPR = MerbAuthSlicePasswordReset unless defined?(MaSPR)

  # Add dependencies for other MerbAuthSlicePasswordReset classes below. Example:
  # dependency "merb-auth-slice-password-reset/other"

end
