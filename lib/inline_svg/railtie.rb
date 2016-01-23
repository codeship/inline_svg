require('rails/railtie')
require_relative('static_asset_finder')

module InlineSvg
  class Railtie < ::Rails::Railtie
    initializer("inline_svg.action_view") do |app|
      ActiveSupport.on_load(:action_view) do
        require("inline_svg/action_view/helpers")
        include(InlineSvg::ActionView::Helpers)
      end
    end

    config.after_initialize do |app|
      InlineSvg.configure do |config|
        config.asset_finder = StaticAssetFinder
      end
    end
  end
end
