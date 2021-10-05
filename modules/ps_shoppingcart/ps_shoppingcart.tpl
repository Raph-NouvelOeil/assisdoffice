{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2017 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
<div id="_desktop_cart">
  <div class="blockcart cart-preview {if $cart.products_count > 0}active{else}inactive{/if}" data-refresh-url="{$refresh_url}">
    <div class="header">
      {if $cart.products_count > 0}
        <a rel="nofollow" href="{$cart_url}">
      {/if}

        <div class="hidden-sm-down bloc-panier align-center"><span class="cart-products-count">{$cart.products_count}</span></div>
       <div class="img-panier">
        <svg version="1.1" id="Calque_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="30px" height="30px" viewBox="0 0 283.46 283.46" enable-background="new 0 0 283.46 283.46" xml:space="preserve">
          <rect x="10.886" y="35.039" fill="#010202" width="43.648" height="22.718"></rect>
          <polygon fill="#010202" points="227.847,187.143 68.923,187.143 50.547,76.038 273.372,76.038 "></polygon>
          <polygon fill="#010202" points="56.307,91.834 38.531,51.103 54.595,35.039 72.371,75.77 "></polygon>
          <circle fill="#010202" cx="90.208" cy="225.48" r="21.831"></circle>
          <circle fill="#010202" cx="206.016" cy="225.48" r="21.831"></circle>
        </svg>
      </div>
      {if $cart.products_count > 0}
        </a>
      {/if}
    </div>
  </div>
</div>
