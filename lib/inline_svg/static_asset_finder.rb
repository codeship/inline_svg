module InlineSvg
  class StaticAssetFinder
    def self.find_asset(filename)
      new(filename)
    end

    attr_accessor(:pathname)

    def initialize(filename)
      @filename = filename
    end

    def pathname
      if ::Rails.application.config.assets.compile
        ::Rails.application.assets[@filename].pathname
      else
        manifest = ::Rails.application.assets_manifest
        asset_path = manifest.assets[@filename]
        ::Rails.root.join(manifest.directory, asset_path)
      end
    end
  end
end
