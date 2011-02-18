require 'typekit'

class Typie
  class << self
    
    # Add a Kit to Typekit
    # @param options [Hash]
    # @option options [String] :token Required: Your Typekit API Token
    # @return [String] Typekit Kit ID of the resulting Kit
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
    
    private 
    
    # Set the name of the Kit
    # @param name [String] The desired name
    def call_it(name)
      @settings[:name] = name
    end
    
    # Add domains for Typekit to serve this Kit to
    # @param domains [Array] An array of the domains to allow
    def add_domains(*domains)
      @settings[:domains] << domains
      @settings[:domains].flatten!
    end
    alias :add_domain :add_domains
    
    # Add a Family to the Kit
    # @param name [String] The Family name (must match Typekit exactly)
    # @param options [Hash]
    # @option options [Array] :include_variations An array of Font Variation Descriptions to be included
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
