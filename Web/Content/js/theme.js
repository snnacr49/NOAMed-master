$(document).ready(function() {

    $('.haber-prev').click(function(){
        $('.haber-slider').slick('slickPrev');
    })

    $('.haber-next').click(function(){
        $('.haber-slider').slick('slickNext');
    })

    $('.urun-prev').click(function(){
        $('.slider-urun-sol').slick('slickPrev');
        $('.slider-urun-sag').slick('slickPrev');
    })

    $('.urun-next').click(function(){
        $('.slider-urun-sag').slick('slickNext');
        $('.slider-urun-sol').slick('slickNext');
    })


    /*--
    Sliders
-----------------------------------*/
    var $elementCarousel = $('.tf-element-carousel');
    var $html = $('html');
    var $body = $('body');

    var slickInstances = [];

    $elementCarousel.each(function (index, element) {
        var $this = $(this);

        // Carousel Options


        var $options = typeof $this.data('slick-options') !== 'undefined' ? $this.data('slick-options') : '';

        var $spaceBetween = $options.spaceBetween ? parseInt($options.spaceBetween, 10) : 0,
            $rowSpace = $options.rowSpace ? parseInt($options.rowSpace, 10) : 0,
            $isCustomArrow = $options.isCustomArrow ? $options.isCustomArrow : false,
            $customPrev = $isCustomArrow === true ? ($options.customPrev ? $options.customPrev : '') : '',
            $customNext = $isCustomArrow === true ? ($options.customNext ? $options.customNext : '') : '',
            $vertical = $options.vertical ? $options.vertical : false,
            $focusOnSelect = $options.focusOnSelect ? $options.focusOnSelect : false,
            $asNavFor = $options.asNavFor ? $options.asNavFor : '',
            $fade = $options.fade ? $options.fade : false,
            $autoplay = $options.autoplay ? $options.autoplay : false,
            $autoplaySpeed = $options.autoplaySpeed ? $options.autoplaySpeed : 5000,
            $swipe = $options.swipe ? $options.swipe : false,
            $swipeToSlide = $options.swipeToSlide ? $options.swipeToSlide : true,
            $verticalSwiping = $options.verticalSwiping ? $options.verticalSwiping : false,
            $arrows = $options.arrows ? $options.arrows : false,
            $dots = $options.dots ? $options.dots : false,
            $infinite = $options.infinite ? $options.infinite : false,
            $centerMode = $options.centerMode ? $options.centerMode : false,
            $centerPadding = $options.centerPadding ? $options.centerPadding : '',
            $speed = $options.speed ? parseInt($options.speed, 10) : 1000,
            $appendArrows = $options.appendArrows ? $options.appendArrows : $this,
            $prevArrow = $arrows === true ? ($options.prevArrow ? '<span class="' + $options.prevArrow.buttonClass + '"><i class="' + $options.prevArrow.iconClass + '"></i></span>' : '<button class="slick-prev">prev</span>') : '',
            $nextArrow = $arrows === true ? ($options.nextArrow ? '<span class="' + $options.nextArrow.buttonClass + '"><i class="' + $options.nextArrow.iconClass + '"></i></span>' : '<button class="slick-next">next</span>') : '',
            $rows = $options.rows ? parseInt($options.rows, 10) : 1,
            $rtl = $options.rtl || $html.attr('dir="rtl"') || $body.attr('dir="rtl"') ? true : false,
            $slidesToShow = $options.slidesToShow ? parseInt($options.slidesToShow, 10) : 1,
            $slidesToScroll = $options.slidesToScroll ? parseInt($options.slidesToScroll, 10) : 1;

        /*Responsive Variable, Array & Loops*/
        var $responsiveSetting = typeof $this.data('slick-responsive') !== 'undefined' ? $this.data('slick-responsive') : '',
            $responsiveSettingLength = $responsiveSetting.length,
            $responsiveArray = [];
        for (var i = 0; i < $responsiveSettingLength; i++) {
            $responsiveArray[i] = $responsiveSetting[i];

        }

        // Adding Class to instances
        $this.addClass('slick-carousel-' + index);
        $this.parent().find('.slick-dots').addClass('dots-' + index);
        $this.parent().find('.slick-btn').addClass('btn-' + index);

        if ($spaceBetween != 0) {
            $this.addClass('slick-gutter-' + $spaceBetween);
        }
        var $slideCount = null;
        $this.on('init', function (event, slick) {
            $slideCount = slick.slideCount;
            if ($slideCount <= $slidesToShow) {
                $this.children('.slick-dots').hide();
            }
        });
        $this.slick({
            slidesToShow: $slidesToShow,
            slidesToScroll: $slidesToScroll,
            asNavFor: $asNavFor,
            autoplay: $autoplay,
            autoplaySpeed: $autoplaySpeed,
            speed: $speed,
            infinite: $infinite,
            rows: $rows,
            arrows: $arrows,
            dots: $dots,
            vertical: $vertical,
            focusOnSelect: $focusOnSelect,
            centerMode: $centerMode,
            centerPadding: $centerPadding,
            swipe: $swipe,
            swipeToSlide: $swipeToSlide,
            fade: $fade,
            appendArrows: $appendArrows,
            prevArrow: $prevArrow,
            nextArrow: $nextArrow,
            verticalSwiping: $verticalSwiping,
            rtl: $rtl,
            responsive: $responsiveArray,
        });
    });
});
