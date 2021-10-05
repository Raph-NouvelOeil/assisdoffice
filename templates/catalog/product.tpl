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
{extends file=$layout}

{block name='head_seo' prepend}
  <link rel="canonical" href="{$product.canonical_url}">
{/block}

{block name='head' append}
  <meta property="og:type" content="product">
  <meta property="og:url" content="{$urls.current_url}">
  <meta property="og:title" content="{$page.meta.title}">
  <meta property="og:site_name" content="{$shop.name}">
  <meta property="og:description" content="{$page.meta.description}">
  <meta property="og:image" content="{$product.cover.large.url}">
  <meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
  <meta property="product:pretax_price:currency" content="{$currency.iso_code}">
  <meta property="product:price:amount" content="{$product.price_amount}">
  <meta property="product:price:currency" content="{$currency.iso_code}">
  {if isset($product.weight) && ($product.weight != 0)}
  <meta property="product:weight:value" content="{$product.weight}">
  <meta property="product:weight:units" content="{$product.weight_unit}">
  {/if}
{/block}

{block name='content'}

  <section id="main" itemscope itemtype="https://schema.org/Product">
    <meta itemprop="url" content="{$product.url}">

    <div class="row">
      <div class="col-md-5 pt-50">
        <a href="javascript:history.go(-1)" class="btn-retour"><i class="material-icons navigate_before" style="margin-bottom: 5px;">navigate_before</i> Retour aux résultats de recherche</a>
        {block name='page_content_container'}
          <section class="page-content" id="content">
            {block name='page_content'}
              {block name='product_flags'}
                <ul class="product-flags">
                  {foreach from=$product.flags item=flag}
                    <li class="product-flag {$flag.type}">{$flag.label}</li>
                  {/foreach}
                </ul>
              {/block}
              {foreach from=$product.features item=feature}
                  {if $feature.name == 'Liseret'}
                    {if $feature.value == 'Nouveauté'}
                        <div class="liseret-texte">
                          Nouveauté
                        </div>
                      {elseif $feature.value == 'Coup de cœur'}
                        <div class="liseret-texte">
                          Coup de coeur 
                        </div>
                      {elseif $feature.value == 'Entrée de gamme'}
                        <div class="liseret-texte">
                          Entrée de gamme
                        </div>
                    {/if}
                {/if}
              {/foreach}

              {block name='product_cover_thumbnails'}
                {include file='catalog/_partials/product-cover-thumbnails.tpl'}
              {/block}
              <div class="scroll-box-arrows">
                <i class="material-icons left">&#xE314;</i>
                <i class="material-icons right">&#xE315;</i>
              </div>

            {/block}
          </section>
        {/block}
        </div>
        <div class="col-md-1 pt-50">
          {foreach from=$product.features item=feature}
            {if $feature.name == 'Mécanisme - Contact permanent'}
                {if $feature.value == 'Contact permanent'}
                <img src="{$urls.base_url}themes/classic/assets/img/ico-contact.png" title="Contact permanent">
                {/if}
            {/if}
            {if $feature.name == 'Mécanisme - Basculant'}
                {if $feature.value == 'Basculant'}
                <img src="{$urls.base_url}themes/classic/assets/img/ico-basculant.png" title="Basculant">
                {/if}
            {/if}
            {if $feature.name == 'Mécanisme - Synchrone'}
                {if $feature.value == 'Synchrone'}
                <img src="{$urls.base_url}themes/classic/assets/img/ico-synchrone.png" title="Synchrone">
                {/if}
            {/if}
            {if $feature.name == 'Mécanisme - Translation d\'assise'}
                {if $feature.value == 'Translation d\'assise'}
                <img src="{$urls.base_url}themes/classic/assets/img/ico-translation.png" title="Translation d\'assise">
                {/if}
            {/if}
            {if $feature.name == 'Mécanisme - Réglable en hauteur'}
                {if $feature.value == 'Réglable en hauteur'}
                <img src="{$urls.base_url}themes/classic/assets/img/ico-pied-hauteur.png" title="Réglable en hauteur">
                {/if}
            {/if}
            {if $feature.name == 'Mécanisme - Dos réglable en hauteur'}
                {if $feature.value == 'Réglable en hauteur'}
                <img src="{$urls.base_url}themes/classic/assets/img/ico-dossier-hauteur.png" title="Dos réglable en hauteur">
                {/if}
            {/if}
            {if $feature.name == 'Mécanisme - Assise négative'}
                {if $feature.value == 'Assise négative'}
                <img src="{$urls.base_url}themes/classic/assets/img/ico-assise.png" title="Assise négative">
                {/if}
            {/if}
            {if $feature.name == 'Mécanisme - Soutien lombaire'}
                {if $feature.value == 'Soutien lombaire'}
                <img src="{$urls.base_url}themes/classic/assets/img/ico-soutien.png" title="Soutien lombaire">
                {/if}
            {/if}
            {if $feature.name == 'Mécanisme - Tension réglable'}
                {if $feature.value == 'Tension réglable'}
                <img src="{$urls.base_url}themes/classic/assets/img/ico-tension.png" title="Tension réglable">
                {/if}
            {/if}
            {if $feature.name == 'Roulettes sol dur'}
                {if $feature.value == 'Sol dur'}
                <img src="{$urls.base_url}themes/classic/assets/img/ico-soldur.png" title="Roulettes sol dur">
                {/if}
            {/if}
            {if $feature.name == 'Roulettes sol souple'}
                {if $feature.value == 'Sol souple'}
                <img src="{$urls.base_url}themes/classic/assets/img/ico-sol-souple.png" title="Roulettes sol souple">
                {/if}
            {/if}
            {if $feature.name == 'Accoudoirs fixes'}
                {if $feature.value == 'Fixes'}
                <img src="{$urls.base_url}themes/classic/assets/img/ico-accfixe.jpg" title="Accoudoirs fixes">
                {/if}
            {/if}
            {if $feature.name == 'Accoudoirs 2D'}
                {if $feature.value == '2D'}
                <img src="{$urls.base_url}themes/classic/assets/img/ico-acc2D.jpg" title="Accoudoirs 2D : réglage hauteur et profondeur">
                {/if}
            {/if}
            {if $feature.name == 'Accoudoirs 3D'}
                {if $feature.value == '3D'}
                <img src="{$urls.base_url}themes/classic/assets/img/ico-acc3D.jpg" title="Accoudoirs 3D : réglage hauteur, profondeur et largeur">
                {/if}
            {/if}
            {if $feature.name == 'Accoudoirs 4D'}
                {if $feature.value == '4D'}
                <img src="{$urls.base_url}themes/classic/assets/img/ico-acc4D.jpg" title="Accoudoirs 4D : réglage hauteur, profondeur, largeur et orientation de chaque accoudoir">
                {/if}
            {/if}
          {/foreach}  
        </div>
        <div class="col-md-6 pt-50 infos-produit">
          {block name='page_header_container'}
            {block name='page_header'}
              <h1 class="h1 h1produit" itemprop="name">{block name='page_title'}{$product.name}{/block}</h1>
            {/block}
          {/block}
          {foreach from=$product.features item=feature}
            {if $feature.name == 'Sous-titre'}
              <div class="sous-titre">
                {$feature.value}
              </div>
            {/if}
          {/foreach}
          <div class="reference-produit">Réf. : {$product.reference}</div>

          {block name='product_prices'}
            {include file='catalog/_partials/product-prices.tpl'}
          {/block}

          <div class="product-information">
            {block name='product_description_short'}
              <div id="product-description-short-{$product.id}" itemprop="description" class="product-description">{$product.description_short nofilter}</div>
            {/block}

             {block name='product_description'}
              <div class="product-description">{$product.description nofilter}</div>
            {/block}

            {if $product.is_customizable && count($product.customizations.fields)}
              {block name='product_customization'}
                {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
              {/block}
            {/if}

            <div class="product-actions">
              {block name='product_buy'}
                <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                  <input type="hidden" name="token" value="{$static_token}">
                  <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
                  <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">

                  {block name='product_variants'}
                    {include file='catalog/_partials/product-variants.tpl'}
                  {/block}

                  {block name='product_attachments'}
                   {if $product.attachments}
                    <div class="tab-pane fade in" id="attachments" role="tabpanel">
                       <section class="product-attachments">
                         {foreach from=$product.attachments item=attachment}
                           <div class="attachment">
                              <img src="{$urls.base_url}themes/classic/assets/img/pdf-file.png" title="pdf" class="ico-pdf">
                             <h4><a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">{$attachment.name}</a></h4>
                             <p>{$attachment.description}</p
                             <a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
                             </a>
                           </div>
                         {/foreach}
                       </section>
                     </div>
                   {/if}
                 {/block}

                  {block name='product_pack'}
                    {if $packItems}
                      <section class="product-pack">
                        <h3 class="h4">{l s='This pack contains' d='Shop.Theme.Catalog'}</h3>
                        {foreach from=$packItems item="product_pack"}
                          {block name='product_miniature'}
                            {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack}
                          {/block}
                        {/foreach}
                    </section>
                    {/if}
                  {/block}

                  {block name='product_discounts'}
                    {include file='catalog/_partials/product-discounts.tpl'}
                  {/block}

                  {block name='product_add_to_cart'}
                    {include file='catalog/_partials/product-add-to-cart.tpl'}
                  {/block}

                  {block name='product_additional_info'}
                    {include file='catalog/_partials/product-additional-info.tpl'}
                  {/block}

                  {block name='product_refresh'}
                    <input class="product-refresh ps-hidden-by-js" name="refresh" type="submit" value="{l s='Refresh' d='Shop.Theme.Actions'}">
                  {/block}
                </form>
              {/block}

            </div>

            {block name='hook_display_reassurance'}
              {hook h='displayReassurance'}
            {/block}
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12">
        {block name='product_tabs'}
              <div class="tabs">
                <ul class="nav nav-tabs" role="tablist">
                  {foreach from=$product.extraContent item=extra key=extraKey}
                    <li class="nav-item">
                      <a
                        class="nav-link"
                        data-toggle="tab"
                        href="#extra-{$extraKey}"
                        role="tab"
                        aria-controls="extra-{$extraKey}">{$extra.title}</a>
                    </li>
                  {/foreach}
                </ul>

                <div class="tab-content" id="tab-content">
                 {foreach from=$product.extraContent item=extra key=extraKey}
                 <div class="tab-pane fade in {$extra.attr.class}" id="extra-{$extraKey}" role="tabpanel" {foreach $extra.attr as $key => $val} {$key}="{$val}"{/foreach}>
                   {$extra.content nofilter}
                 </div>
                 {/foreach}
              </div>  
            </div>
          {/block}
      </div> 
    </div>

    {block name='product_accessories'}
      {if $accessories}
        <section class="product-accessories clearfix">
          <h3 class="h5 text-uppercase">{l s='You might also like' d='Shop.Theme.Catalog'}</h3>
          <div class="products">
            {foreach from=$accessories item="product_accessory"}
              {block name='product_miniature'}
                {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory}
              {/block}
            {/foreach}
          </div>
        </section>
      {/if}
    {/block}

    {block name='product_footer'}
      {hook h='displayFooterProduct' product=$product category=$category}
    {/block}

    {block name='product_images_modal'}
      {include file='catalog/_partials/product-images-modal.tpl'}
    {/block}

    {block name='page_footer_container'}
      <footer class="page-footer">
        {block name='page_footer'}
          <!-- Footer content -->
        {/block}
      </footer>
    {/block}
  </section>

{/block}
