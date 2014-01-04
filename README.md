# Foundation::Rails::Confirm

This gem adds some javascript to change the default behaviour of data-confirm processing.

The normal confirm dialog shows a text with buttons 'ok' and 'cancel'. More information is needed here for a user to make the right decision. This gem therefore also adds:

* data-confirm-fade (default: false)
* data-confirm-title (default: window.top.location.origin)
* data-confirm-cancel (default: 'cancel')
* data-confirm-cancel-class (default: 'btn cancel')
* data-confirm-proceed (default: 'ok')
* data-confirm-proceed-class (default: 'btn-primary')

This behaviour is similar to that of a "regular" confirm box in ways that it uses the same title and button labels. Defaults can be changed in two ways:

Changing all default values:

    $.fn.foundation_confirmbox.defaults = {
        fade: false,
        title: null, // if title equals null window.top.location.origin is used
        cancel: "Cancel",
        cancel_class: "btn cancel",
        proceed: "OK",
        proceed_class: "btn proceed btn-primary"
    };

Only changing one default value:

    $.fn.foundation_confirmbox.defaults.proceed_class = "btn proceed btn-success";

## Installation

Add this line to your application's Gemfile:

    gem 'foundation-rails-confirm'

And then execute:

    $ bundle

## Usage

Add it to your application.js, anywhere after you require jquery_ujs:

    //= require foundation/rails/confirm

Next... nothing. There is nothing you need to do to get this working. A helper could be useful for handling large amount of destroy buttons:

    def destroy_link_to(path, options)
      link_to t('.destroy'), path, 
        "method"                     => :delete,
        "class"                      => "btn",
        "confirm"                    => t('.destroy_confirm.body',    item: options[:item]),
        "data-confirm-title"         => t('.destroy_confirm.title',   item: options[:item]),
        "data-confirm-cancel"        => t('.destroy_confirm.cancel',  item: options[:item]),
        "data-confirm-cancel-class"  => "button secondary"),
        "data-confirm-proceed"       => t('.destroy_confirm.proceed', item: options[:item]),
        "data-confirm-proceed-class" => "button "
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Thanks

This gem is based to amazing gem by Rene van Lieshout, [twitter-bootstrap-rails-confirm](https://github.com/bluerail/foundation-rails-confirm). All thanks goes to all conributors and authors of that gem.
