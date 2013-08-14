# DebugPrint

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'debug_print'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install debug_print


## Optional Configuration

To configure output method (default is puts):

    DebugPrint.debug_output do |output|
       ::Rails.logger.debug output
    end

## Usage

	@foo = 'bar'

    # If you want to log what @foo is 	
	d :@foo

	Log output ->

	<String> @foo = 'bar'



NOTE:

Because this uses binding_of_caller, it should only be used in development


TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
