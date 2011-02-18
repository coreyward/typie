Typie – Typekit Kits Made Easy
==============================

Typie helps you create [Typekit](http://typekit.com/) kits with custom domains for each of your users' custom domains. This allows hosting user websites with badass typography, easily.

Usage
-----

So hotshot John Smith wants you to be his [Flavors.me](http://flavors.me/) using on his own 'thejohnsmith.com' domain name. You don't want to give up the really awesome Calluna font you've been using through Typekit. So what do you do? Drop in a Typie and tell your boss you deserve a raise.

    Typie.new_kit :token => 'your_api_token' do
      call_it 'JohnSmith'
      add_domains 'localhost', 'thejohnsmith.com'
      add_font 'Calluna', :include_variations => ['n3', 'n4', 'i4', 'n6']
      add_font 'Calluna Sans' # includes all available variations (watch out for large kit sizes)
    end
    #=> 'abcdef' (Typekit Kit ID)
    
Typie returns the Typekit Kit ID. You can store it along with the domain or user information, then you can easily use the Typekit API to add or remove domains, fonts, and variations, or delete it when you're done with it. Typie uses the [Typekit API Ruby Client](http://github.com/coreyward/typekit) gem. If you find yourself needing to do more than what Typie offers, check it out.

#### Font Variation Descriptions

If you're not familiar with "Font Variation Descriptions" like 'n4' and 'i6', you should check out [this page](http://typekit.github.com/fvd/) where they are explained in detail. In the future Typie will probably allow you to use Font Names like 'Calluna Regular' and 'Calluna Black Italic', but for now it uses the same FVDs that the Typekit API uses.

    
Install
-------

Typie is available as a RubyGem. You can install it like so:

    gem install typie
    
Or if you'll be using Typie in a Rails project (or anywhere else with a Gemfile):

    gem 'typie'
    
Note that Typie currently requires Ruby 1.9+, or that you have added a Symbol#to_proc method.

Documentation
-------------

Full documentation is available at [http://rubydoc.info/github/coreyward/typie](http://rubydoc.info/github/coreyward/typie).

Contributing to Typie
---------------------
 
* Fork the project
* Start a feature/bugfix branch
* Add [yard](http://yardoc.org/)-compatible documentation for your changes, where relevant. Follow the existing styles.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
---------

Copyright (c) 2011 Corey Ward. Licensed under the "MIT" license. See LICENSE.txt for further details.
