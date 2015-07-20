// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// Error messages fade-in/fade-out

$(function() {

    $('.mobile-menu-trigger').on('click', function () {
        $('.nav-container').toggleClass('mobile-menu-active');
    });

    $('.notice').delay(500).fadeIn('normal', function() {
        $(this).delay(2500).fadeOut();
    });

    $('.item-name-price-container').each(function () {
        var $this = $(this);
        var carted = false;
        var cartedClass = 'added-to-cart';

        var $checkbox = $this.find('[type="checkbox"]');
        var $label = $this.find('.toggle-item-label').find('.text');

        var addToCart = function () {
            carted = true;
            $label.text('Remove from cart');
            $this.addClass(cartedClass);
        };

        var removeFromCart = function () {
            carted = false;
            $label.text('Add to cart');
            $this.removeClass(cartedClass);
        };

        var toggleItemInCart = function () {
            if(carted) {
                removeFromCart();
            } else {
                addToCart();
            }
        };

        $('.item-name, .item-quantity, .item-price', $this).click(toggleItemInCart);
        $checkbox.click(toggleItemInCart);

    });
});

