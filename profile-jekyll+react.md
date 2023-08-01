Jekyll is a great tool to quickly create modern static websites. To include some more interactive pieces on our websites, we can use Node modules using npm packages manager and combine them using [webpack](https://webpack.js.org/) and [Babel](https://babeljs.io/) to “compile” the website.

Here I listed some problems I faced while using `npm` and `jekyll` to build my website.
1. If I install `bundle` with `gem` then it will not be compatible with ruby-2.5. It requires ruby version >=2.6.0
```
(profile) raihan@raihan-XPS-8940:~/profile-website/fredhohman.github.io$ sudo gem install bundler
Fetching: bundler-2.4.17.gem (100%)
ERROR:  Error installing bundler:
        The last version of bundler (>= 0) to support your Ruby & RubyGems was 2.3.26. Try installing it with `gem install bundler -v 2.3.26`
        bundler requires Ruby version >= 2.6.0. The current ruby version is 2.5.0.
(profile) raihan@raihan-XPS-8940:~/profile-website/fredhohman.github.io$ sudo gem install bundler -v 2.3.26
Fetching: bundler-2.3.26.gem (100%)
Successfully installed bundler-2.3.26
Parsing documentation for bundler-2.3.26
Installing ri documentation for bundler-2.3.26
Done installing documentation for bundler after 0 seconds
1 gem installed
(profile) raihan@raihan-XPS-8940:~/profile-website/fredhohman.github.io$ bundle install
Traceback (most recent call last):
        2: from /usr/local/bin/bundle:23:in `<main>'
        1: from /usr/lib/ruby/2.5.0/rubygems.rb:308:in `activate_bin_path'
/usr/lib/ruby/2.5.0/rubygems.rb:289:in `find_spec_for_exe': can't find gem bundler (>= 0.a) with executable bundle (Gem::GemNotFoundException)
```

To solve this, I tried to update `gem` first but didn't work,
```
(profile) raihan@raihan-XPS-8940:~$ sudo gem update --system 3.2.3
Updating rubygems-update
Successfully installed rubygems-update-3.2.3
Parsing documentation for rubygems-update-3.2.3
Done installing documentation for rubygems-update after 0 seconds
Parsing documentation for rubygems-update-3.2.3
Done installing documentation for rubygems-update after 0 seconds
Installing RubyGems 3.2.3
Traceback (most recent call last):
	4: from setup.rb:23:in `<main>'
	3: from setup.rb:23:in `require'
	2: from /var/lib/gems/2.5.0/gems/rubygems-update-3.2.3/lib/rubygems.rb:1348:in `<top (required)>'
	1: from /var/lib/gems/2.5.0/gems/rubygems-update-3.2.3/lib/rubygems.rb:1348:in `require'
/usr/lib/ruby/vendor_ruby/rubygems/defaults/operating_system.rb:43:in `<top (required)>': uninitialized constant Gem::BasicSpecification (NameError)
(profile) raihan@raihan-XPS-8940:~$ gem -v
2.7.6
(profile) raihan@raihan-XPS-8940:~$ ruby -v
ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-linux-gnu]
```

**SOLVED:** So, do following to solve this issue,
```
# set the key
gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB 
curl -sSL https://rvm.io/mpapis.asc | gpg --import -

# curl the rvm
\curl -sSL https://get.rvm.io | bash -s stable

# run the terminal again with source initializing rvm
source ~/.rvm/scripts/rvm

# Install 2.6.0
rvm install 2.6.0

# install bundle
gem install bundler

# now check
ruby -v
gem -v
```

Now, navigate to the working directory and run,
```
bundle install
npm run start # If not installed, install it sudo apt install npm
# It will show the addess of localhost it is running the website, probably this is the address: http://127.0.0.1:4000/
```


