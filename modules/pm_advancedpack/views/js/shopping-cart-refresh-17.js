$(document).ready(function() {
	$('.js-cart').data('refresh-url', ap5_cartRefreshUrl);
	prestashop.emit('updateCart', { reason: { cart: null } });
});
$(document).ajaxSuccess(function(e, ajaxOptions, ajaxData) {
	$('.js-cart').data('refresh-url', ap5_cartRefreshUrl);
});