require 'typekit'

class Typie
  class << self
    
    def new_kit(options = {}, &block)
      raise 'Token required' unless options[:token]
      
      # Setup Typie
      @typekit = Typekit::Client.new(options[:token])
      @settings = { :name => 'Unnamed', :domains => [] }
      @fonts = []
      
      # Wreak havoc
      instance_eval &block
      
      # Handle it all
      kit = @typekit.create_kit @settings
      @fonts.each do |font|
        kit.add_family(font[:id], :variations => font[:variations])
      end
      
      kit.id
    end
    
    def call_it(name)
      @settings[:name] = name
    end
    
    def add_domains(*domains)
      @settings[:domains] << domains
      @settings[:domains].flatten!
    end
    alias :add_domain :add_domains
    
    def add_font(name, options = {})
      font = @typekit.family_by_name(name)
      
      if options[:include_variations]
        # We're silently ignoring invalid variations
        variations = options[:include_variations] & font.variations.map(&:to_fvd)
      else
        # Add all variations available by default
        variations = font.variations.map(&:to_fvd)
      end
      
      @fonts << { :id => font.id, :variations => variations }
    end
  end
end
