require "foundation/rails/confirm/version"

module Foundation
  module Rails
    module Confirm
      require 'foundation/rails/confirm/engine' if defined?(Rails)
    end
  end
end
