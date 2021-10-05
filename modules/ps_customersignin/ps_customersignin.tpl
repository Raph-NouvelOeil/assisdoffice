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
<div id="_desktop_user_info">
  <div class="user-info">
    {if $logged}
	    <a
			class="account"
			href="{$my_account_url}"
			title="{l s='View my customer account' d='Shop.Theme.Customeraccount'}"
			rel="nofollow"
      	>
        <div class="hidden-sm-down align-center bloc-connexion">{l s='Sign out' d='Shop.Theme.Actions'}</div>
        <div class="img-user">
          <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="25px" height="25px" viewBox="0 0 283.46 283.46" enable-background="new 0 0 283.46 283.46" xml:space="preserve">
          <circle fill="#010202" cx="143.117" cy="75.536" r="64.864"></circle>
          <path fill="#010202" d="M11.74,273.773c0-60.833,58.819-110.148,131.377-110.148s131.377,49.315,131.377,110.148"></path>
          </svg>
        </div>
		<span class="hidden-sm-down compte-client">{$customerName}</span></a><span> <a class="logout hidden-sm-down en-bloc-connexion" href="{$logout_url}" rel="nofollow">X</a></span>
    {else}
      <a
        href="{$my_account_url}"
        title="{l s='Log in to your customer account' d='Shop.Theme.Customeraccount'}"
        rel="nofollow"
        class="en-bloc-connexion"
      >
        <div class="hidden-sm-down align-center bloc-connexion">{l s='Sign in' d='Shop.Theme.Actions'}</div>
        <div class="img-user">
          <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="25px" height="25px" viewBox="0 0 283.46 283.46" enable-background="new 0 0 283.46 283.46" xml:space="preserve">
          <circle fill="#010202" cx="143.117" cy="75.536" r="64.864"></circle>
          <path fill="#010202" d="M11.74,273.773c0-60.833,58.819-110.148,131.377-110.148s131.377,49.315,131.377,110.148"></path>
          </svg>
      </div>
      </a>

    {/if}
  </div>
</div>
