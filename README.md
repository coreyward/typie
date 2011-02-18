Typie – Typekit Kits Made Easy
==============================

Typie helps you create kits with custom domains for each of your users' custom domains. This allows hosting user websites with badass typography, easily.

Usage
-----

    Typie.new_kit :token => 'your_api_token' do
      call_it 'User Website 20'
      add_domains 'localhost', 'example.com'
      
      add_font 'Calluna' do
        include_variations 'n3', 'n4', 'i4', 'n6'
      end
      
      add_font 'Droid Sans', :include_all_variations
    end
    #=> 'abcdef' (Typekit Kit ID)

Contributing to Typie
---------------------
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
---------

Copyright (c) 2011 Corey Ward. Licensed under the "MIT" license. See LICENSE.txt for further details.
