		<!-- pack product list-->
		<div id="ap5-product-list" class="pack-col-left pt-50 card ap5-product-list {if empty($from_quickview)}col-xs-12 col-sm-12 order-sm-2 col-md-6 col-lg-6{else}col-xs-12 col-12{/if}{if $packAvailableQuantity <= 0} ap5-pack-oos{/if}{if $packDeviceIsTablet || $packDeviceIsMobile} ap5-is-mobile{/if}">
		{assign var=nbPackProducts value=count($productsPack)}
		{assign var=numproduit value=0}
		{foreach from=$productsPack item=productPack}
			{assign var=imageIds value="`$productPack.id_product`-`$productPack.image.id_image`"}
			{if !empty($productPack.image.legend)}
				{assign var=imageTitle value=$productPack.image.legend}
			{else}
				{assign var=imageTitle value=$productPack.presentation.name}
			{/if}
			{if $numproduit == 0}
			<a href="javascript:history.go(-1)" class="btn-retour"><i class="material-icons navigate_before" style="margin-bottom: 5px;">navigate_before</i> Retour aux résultats de recherche</a>
			<div class="row">
				<div id=" ap5-pack-product-{$productPack.id_product_pack}" class=" border-product-one ap5-pack-product ap5-no-plus-icon col-xs-12 col-sm-12 col-md-10 col-lg-10 {if isset($productsPackErrors[$productPack.id_product_pack])} ap5-product-pack-row-has-errors{/if}{if isset($productsPackFatalErrors[$productPack.id_product_pack])} ap5-product-pack-row-has-fatal-errors{/if}{if !$productPack.attributes.groups|@count} ap5-no-attributes{/if}{if in_array($productPack.id_product_pack, $packExcludeList)} ap5-is-excluded-product{/if}">

					<div class="ap5-pack-product-content">

						{foreach from=$productsPack[0].features item=feature}
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

						{block name='ap5_product_quantity_ribbon'}
							<!-- quantity -->
							{if $productPack.quantity > 1}
							<div class="ribbon-wrapper">
								<div class="ap5-pack-product-quantity ribbon">
									x {$productPack.quantity|intval}
								</div>
							</div>
							{/if}
						{/block}

						{block name='ap5_product_images'}
							{if !$mobile_device}
								<div class="ap5-pack-product-image">
									<a class="no-print" {if empty($from_quickview)}data-toggle="modal" data-target="#ap5-pack-product-{$productPack.id_product_pack}-modal #product-modal"{/if} title="{$imageTitle}" href="{$pmlink->getImageLink($productPack.presentation.link_rewrite, $imageIds, $imageFormatProductZoom)}">
										<img class="img-fluid d-block mx-auto" id="thumb_{$productPack.image.id_image|intval}" src="{$pmlink->getImageLink($productPack.presentation.link_rewrite, $imageIds, $imageFormatProductCover)}" alt="{$imageTitle}" title="{$imageTitle}" height="{$imageFormatProductCoverHeight}" width="{$imageFormatProductCoverWidth}" itemprop="image" />
									</a>
								</div>
								{* Modal images *}
								{if empty($from_quickview)}
									<div id="ap5-pack-product-{$productPack.id_product_pack}-modal">
										{include file='catalog/_partials/product-images-modal.tpl' product=$productPack.presentation}
									</div>
								{/if}
								<hr class="ap5-pack-product-icon-plus" />
								{if $packShowProductsThumbnails && (count($productPack.images) > 1 || $packMaxImagesPerProduct > 1)}
								<div class="ap5-pack-product-slideshow pm-ap-owl-carousel clearfix">
									{foreach from=$productPack.images item=productPackImage}
										{assign var=productPackImageTitle value=$productPack.presentation.name}
										{assign var=productPackImageIds value="`$productPack.id_product`-`$productPackImage.id_image`"}

										<div id="ap5-pack-product-thumbnail-{$productPackImage.id_image|intval}" class="ap5-pack-product-thumbnail">
											<a title="{$productPackImageTitle}" href="{$pmlink->getImageLink($productPack.presentation.link_rewrite, $productPackImageIds, $imageFormatProductZoom)}"{if empty($from_quickview)} data-toggle="modal" data-target="#ap5-pack-product-{$productPack.id_product_pack}-modal #product-modal"{/if}>
												<img class="img-fluid d-block mx-auto" id="thumb_{$productPackImage.id_image|intval}" src="{$pmlink->getImageLink($productPack.presentation.link_rewrite, $productPackImageIds, $imageFormatProductSlideshow)}" alt="{$productPackImageTitle}" title="{$productPackImageTitle}" height="{$imageFormatProductSlideshowHeight}" width="{$imageFormatProductSlideshowWidth}" itemprop="image" />
											</a>
										</div>
									{/foreach}
								</div>
								{/if}
							{else}
								
								{if $packShowProductsThumbnails && (count($productPack.images) > 1 || $packMaxImagesPerProduct > 1)}
								<div class="ap5-pack-product-mobile-slideshow pm-ap-owl-carousel clearfix">
									{foreach from=$productPack.imagesMobile item=productPackImage}
										{assign var=productPackImageTitle value=$productPack.presentation.name}
										{assign var=productPackImageIds value="`$productPack.id_product`-`$productPackImage.id_image`"}

										<div id="ap5-pack-product-thumbnail-{$productPackImage.id_image|intval}" class="ap5-pack-product-thumbnail">
											<img class="img-fluid d-block mx-auto" id="thumb_{$productPackImage.id_image|intval}" src="{$pmlink->getImageLink($productPack.presentation.link_rewrite, $productPackImageIds, $imageFormatProductCoverMobile)}" alt="{$productPackImageTitle}" title="{$productPackImageTitle}" height="{$imageFormatProductCoverMobileHeight}" width="{$imageFormatProductCoverMobileWidth}" itemprop="image" />
										</div>
									{/foreach}
								</div>
								{/if}
							{/if}
						{/block}

						{if $productPack.presentation.show_price && !$configuration.is_catalog}
							{if $packShowProductsThumbnails && $packMaxImagesPerProduct > 1}<hr />{/if}
							<div class="ap5-pack-product-price-table-container product-prices {if $productPack.reduction_amount <= 0} ap5-no-reduction{/if}">
								<div class="ap5-pack-product-price-table-cell {if $productPack.reduction_amount > 0} has-discount{/if}">
									{block name='ap5_product_price'}
										<div class="current-price ap5-pack-product-price text-center">
											{if $productPack.reduction_amount > 0}
												<div class="product-discount ap5-pack-product-original-price text-center">
													<span class="regular-price ap5-pack-product-original-price-value">
													{if !$priceDisplay || $priceDisplay == 2}
														{$productPack.presentation.productClassicPriceTotal}
													{elseif $priceDisplay == 1}
														{$productPack.presentation.productClassicPriceTaxExclTotal}
													{/if}
													</span>
												</div>
											{/if}
											<div class="product-price h5 has-discount">
												{if $productPack.presentation.show_price}
													{if $productPack.productPackPrice == 0}
														Pas d'option
													{else}
														{if !$priceDisplay || $priceDisplay == 2}
															<span>Tarif sans option : {$productPack.presentation.productPackPriceTotal}</span>
														{elseif $priceDisplay == 1}
															<span>Tarif sans option :  {$productPack.presentation.productPackPriceTaxExclTotal}</span>
														{/if}
													{/if}
												{/if}
												{if $productPack.reduction_amount > 0}
													{if $productPack.productPackPrice > 0}
														{if $productPack.reduction_type == 'amount'}
															<span class="discount discount-amount ap5-pack-product-reduction-value">
																{l s='Save %amount%' d='Shop.Theme.Catalog' sprintf=['%amount%' => $productPack.presentation.productReductionAmountTotal]}
															</span>
														{else}
															<span class="discount discount-percentage ap5-pack-product-reduction-value">{l s='Save %percentage%' d='Shop.Theme.Catalog' sprintf=['%percentage%' => $productPack.reduction_amount * 100]}%</span>
														{/if}
													{/if}
												{/if}
											</div>
										</div>
									{/block}
									{block name='ap5_product_availability'}
										{if $packShowProductsAvailability}
										<!-- availability -->
										<div class="ap5-availability-statut">
											<span id="product-availability">
											{if $packShowProductsAvailability}
												{if $productPack.presentation.availability == 'available'}
													<i class="material-icons product-available">&#xE5CA;</i>
												{elseif $productPack.presentation.availability == 'last_remaining_items'}
													<i class="material-icons product-last-items">&#xE002;</i>
												{else}
													<i class="material-icons product-unavailable">&#xE14B;</i>
												{/if}
												{$productPack.presentation.availability_message}
											{/if}
											</span>
										</div>
										{/if}
									{/block}
								</div>
							</div>
							{/if}
						<hr />
						{* Let's display error list *}
						{if isset($productsPackErrors[$productPack.id_product_pack]) || isset($productsPackFatalErrors[$productPack.id_product_pack])}
						{if isset($productsPackFatalErrors[$productPack.id_product_pack])}<div class="ap5-overlay"></div>{/if}
						<div class="alert animated shake {if isset($productsPackFatalErrors[$productPack.id_product_pack])}alert-danger{else}alert-warning{/if}">
							<ol>
							{if isset($productsPackErrors[$productPack.id_product_pack])}
								{foreach from=$productsPackErrors[$productPack.id_product_pack] item=errorRow}
									<li>{$errorRow}</li>
								{/foreach}
							{/if}
							{if isset($productsPackFatalErrors[$productPack.id_product_pack])}
								{foreach from=$productsPackFatalErrors[$productPack.id_product_pack] item=errorRow}
									<li>{$errorRow}</li>
								{/foreach}
							{/if}
							</ol>
						</div>
						{/if}
						<div class="product-actions">
							{if $packAllowRemoveProduct && $packShowProductsQuantityWanted}
							<!-- quantity wanted -->
							<fieldset id="ap5-quantity-wanted-{$productPack.id_product_pack|intval}" class="attribute_fieldset ap5-attribute-fieldset ap5-quantity-fieldset">
								<label class="attribute_label" for="quantity_wanted_{$productPack.id_product_pack|intval}">{l s='Quantity' d='Shop.Theme.Catalog'}</label>
								<div class="attribute_list ap5-attribute-list ap5-quantity-input-container">
									<input type="text" name="qty_{$productPack.id_product_pack|intval}" id="quantity_wanted_{$productPack.id_product_pack|intval}" value="{$productPack.quantity|intval}" class="ap5-quantity-wanted input-group form-control" data-id-product-pack="{$productPack.id_product_pack|intval}"{if in_array($productPack.id_product_pack, $packExcludeList)} disabled="disabled"{/if} />
								</div>
							</fieldset>
							{/if}
							{if $productPack.attributes.groups|@count >= 1}
							<!-- attributes -->
							<div class="product-variants ap5-attributes" data-id-product-pack="{$productPack.id_product_pack|intval}">
								{foreach from=$productPack.attributes.groups key=id_attribute_group item=group}
									{if $group.attributes|@count}
										<div id="ap5-product-variants-item-{$id_attribute_group|intval}" class="clearfix product-variants-item ap5-attribute-fieldset">
											<span class="control-label">{$group.name}</span>
											{assign var="groupName" value="group_`$productPack.id_product_pack`_$id_attribute_group"}
											<div class="attribute_list ap5-attribute-list">
												{if ($group.group_type == 'select')}
													<select name="{$groupName}" id="group_{$id_attribute_group|intval}" class="ap5-attribute-select no-print form-control form-control-select"{if in_array($productPack.id_product_pack, $packExcludeList)} disabled="disabled"{/if}>
														{foreach from=$group.attributes key=id_attribute item=group_attribute}
															{assign var=ap5_isCurrentSelectedIdAttribute value=((isset($productsPackErrors[$productPack.id_product_pack]) && isset($packCompleteAttributesList[$productPack.id_product_pack]) && in_array($id_attribute, $packCompleteAttributesList[$productPack.id_product_pack])) || !isset($productsPackErrors[$productPack.id_product_pack]) && $group.default == $id_attribute)}
															<option value="{$id_attribute|intval}"{if $ap5_isCurrentSelectedIdAttribute} selected="selected"{/if} title="{$group_attribute}">{$group_attribute}</option>
														{/foreach}
													</select>
												{elseif ($group.group_type == 'color')}
													<ul class="ap5-color-to-pick-list ap5-color-to-pick-list-{$productPack.id_product_pack|intval}-{$id_attribute_group|intval}">
														{assign var="default_colorpicker" value=""}
														{foreach from=$group.attributes key=id_attribute item=group_attribute}
															{assign var=ap5_isCurrentSelectedIdAttribute value=((isset($productsPackErrors[$productPack.id_product_pack]) && isset($packCompleteAttributesList[$productPack.id_product_pack]) && in_array($id_attribute, $packCompleteAttributesList[$productPack.id_product_pack])) || $group.default == $id_attribute)}
															<li class="float-left float-xs-left pull-xs-left input-container{if $ap5_isCurrentSelectedIdAttribute} selected{/if}">
																<a href="{$productPack.presentation.url}" data-id-product-pack="{$productPack.id_product_pack|intval}" data-id-attribute-group="{$id_attribute_group|intval}" data-id-attribute="{$id_attribute|intval}" id="color_{$id_attribute|intval}" name="{$productPack.attributes.colors.$id_attribute.name}" class="ap5-color color color_pick{if $ap5_isCurrentSelectedIdAttribute} selected{/if}{if in_array($productPack.id_product_pack, $packExcludeList)} disabled{/if}" style="background: {$productPack.attributes.colors.$id_attribute.value};" title="{$productPack.attributes.colors.$id_attribute.name}">
																	{if $productPack.attributes.colors.$id_attribute.image_exists}
																		<img src="{$urls.img_col_url}{$id_attribute|intval}.jpg" alt="{$productPack.attributes.colors.$id_attribute.name}" />
																	{/if}
																</a>
															</li>
															{if $ap5_isCurrentSelectedIdAttribute}
																{$default_colorpicker = $id_attribute}
															{/if}
														{/foreach}
													</ul>
													<input type="hidden" class="color_pick_hidden_{$productPack.id_product_pack|intval}_{$id_attribute_group|intval}" name="{$groupName}" value="{$default_colorpicker|intval}" />
												{elseif ($group.group_type == 'radio')}
													<ul>
														{foreach from=$group.attributes key=id_attribute item=group_attribute}
															{assign var=ap5_isCurrentSelectedIdAttribute value=((isset($productsPackErrors[$productPack.id_product_pack]) && isset($packCompleteAttributesList[$productPack.id_product_pack]) && in_array($id_attribute, $packCompleteAttributesList[$productPack.id_product_pack])) || $group.default == $id_attribute)}
															<li class="input-container float-left float-xs-left pull-xs-left">
																<input type="radio" class="input-radio ap5-attribute-radio" name="{$groupName}" value="{$id_attribute}" {if $ap5_isCurrentSelectedIdAttribute} checked="checked"{/if}{if in_array($productPack.id_product_pack, $packExcludeList)} disabled="disabled"{/if} />
																<span class="radio-label">{$group_attribute}</span>
															</li>
														{/foreach}
													</ul>
												{/if}
											</div> <!-- end attribute_list -->
										</div>
									{/if}
								{/foreach}
							</div>
							{/if}
						</div>
					</div>
					{if $packAllowRemoveProduct}
						{if !in_array($productPack.id_product_pack, $packExcludeList)}
						<span class="ap5-pack-product-icon-remove" data-id-product-pack="{$productPack.id_product_pack|intval}"></span>
						{else}
						<span class="ap5-pack-product-icon-check" data-id-product-pack="{$productPack.id_product_pack|intval}"></span>
						{/if}
					{/if}
			</div>
			<div class="col-md-2 col-lg-2">

							{foreach from=$productPack.features item=feature}
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
                <img src="{$urls.base_url}themes/classic/assets/img/ico-translation.png" title="Translation d'assise">
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
           </div>
			<div><h2 class="h2-accessoires">Vos options</h2></div>
			{*-----------------------------------------------------------------------------------------------------------------------------------------------------*}
			{else}
			
			<div id="border-product ap5-pack-product-{$productPack.id_product_pack}" class="ap5-pack-product ap5-no-plus-icon col-xs-12 col-12 col-sm-6 col-md-6 col-lg-6{if $nbPackProducts != 2} col-md-4{/if}{if isset($productsPackErrors[$productPack.id_product_pack])} ap5-product-pack-row-has-errors{/if}{if isset($productsPackFatalErrors[$productPack.id_product_pack])} ap5-product-pack-row-has-fatal-errors{/if}{if !$productPack.attributes.groups|@count} ap5-no-attributes{/if}{if in_array($productPack.id_product_pack, $packExcludeList)} ap5-is-excluded-product{/if}">

				<div class="ap5-pack-product-content">
					<div class="product-actions">
						{if $packAllowRemoveProduct && $packShowProductsQuantityWanted}
						<!-- quantity wanted -->
						<fieldset id="ap5-quantity-wanted-{$productPack.id_product_pack|intval}" class="attribute_fieldset ap5-attribute-fieldset ap5-quantity-fieldset">
							<label class="attribute_label" for="quantity_wanted_{$productPack.id_product_pack|intval}">{l s='Quantity' d='Shop.Theme.Catalog'}</label>
							<div class="attribute_list ap5-attribute-list ap5-quantity-input-container">
								<input type="text" name="qty_{$productPack.id_product_pack|intval}" id="quantity_wanted_{$productPack.id_product_pack|intval}" value="{$productPack.quantity|intval}" class="ap5-quantity-wanted input-group form-control" data-id-product-pack="{$productPack.id_product_pack|intval}"{if in_array($productPack.id_product_pack, $packExcludeList)} disabled="disabled"{/if} />
							</div>
						</fieldset>
						{/if}
						{if $productPack.attributes.groups|@count >= 1}
						<!-- attributes -->
						<div class="product-variants ap5-attributes" data-id-product-pack="{$productPack.id_product_pack|intval}">
							{foreach from=$productPack.attributes.groups key=id_attribute_group item=group}
								{if $group.attributes|@count}
									<div id="ap5-product-variants-item-{$id_attribute_group|intval}" class="clearfix product-variants-item ap5-attribute-fieldset">
										<span class="control-label">{$group.name}</span>
										{assign var="groupName" value="group_`$productPack.id_product_pack`_$id_attribute_group"}
										<div class="attribute_list ap5-attribute-list">
											{if ($group.group_type == 'select')}
												<select name="{$groupName}" id="group_{$id_attribute_group|intval}" class="ap5-attribute-select no-print form-control form-control-select"{if in_array($productPack.id_product_pack, $packExcludeList)} disabled="disabled"{/if}>
													{foreach from=$group.attributes key=id_attribute item=group_attribute}
														{assign var=ap5_isCurrentSelectedIdAttribute value=((isset($productsPackErrors[$productPack.id_product_pack]) && isset($packCompleteAttributesList[$productPack.id_product_pack]) && in_array($id_attribute, $packCompleteAttributesList[$productPack.id_product_pack])) || !isset($productsPackErrors[$productPack.id_product_pack]) && $group.default == $id_attribute)}
														<option value="{$id_attribute|intval}"{if $ap5_isCurrentSelectedIdAttribute} selected="selected"{/if} title="{$group_attribute}">{$group_attribute}</option>
													{/foreach}
												</select>
											{elseif ($group.group_type == 'color')}
												<ul class="ap5-color-to-pick-list ap5-color-to-pick-list-{$productPack.id_product_pack|intval}-{$id_attribute_group|intval}">
													{assign var="default_colorpicker" value=""}
													{foreach from=$group.attributes key=id_attribute item=group_attribute}
														{assign var=ap5_isCurrentSelectedIdAttribute value=((isset($productsPackErrors[$productPack.id_product_pack]) && isset($packCompleteAttributesList[$productPack.id_product_pack]) && in_array($id_attribute, $packCompleteAttributesList[$productPack.id_product_pack])) || $group.default == $id_attribute)}
														<li class="float-left float-xs-left pull-xs-left input-container{if $ap5_isCurrentSelectedIdAttribute} selected{/if}">
															<a href="{$productPack.presentation.url}" data-id-product-pack="{$productPack.id_product_pack|intval}" data-id-attribute-group="{$id_attribute_group|intval}" data-id-attribute="{$id_attribute|intval}" id="color_{$id_attribute|intval}" name="{$productPack.attributes.colors.$id_attribute.name}" class="ap5-color color color_pick{if $ap5_isCurrentSelectedIdAttribute} selected{/if}{if in_array($productPack.id_product_pack, $packExcludeList)} disabled{/if}" style="background: {$productPack.attributes.colors.$id_attribute.value};" title="{$productPack.attributes.colors.$id_attribute.name}">
																{if $productPack.attributes.colors.$id_attribute.image_exists}
																	<img src="{$urls.img_col_url}{$id_attribute|intval}.jpg" alt="{$productPack.attributes.colors.$id_attribute.name}" />
																{/if}
															</a>
														</li>
														{if $ap5_isCurrentSelectedIdAttribute}
															{$default_colorpicker = $id_attribute}
														{/if}
													{/foreach}
												</ul>
												<input type="hidden" class="color_pick_hidden_{$productPack.id_product_pack|intval}_{$id_attribute_group|intval}" name="{$groupName}" value="{$default_colorpicker|intval}" />
											{elseif ($group.group_type == 'radio')}
												<ul>
													{foreach from=$group.attributes key=id_attribute item=group_attribute}
														{assign var=ap5_isCurrentSelectedIdAttribute value=((isset($productsPackErrors[$productPack.id_product_pack]) && isset($packCompleteAttributesList[$productPack.id_product_pack]) && in_array($id_attribute, $packCompleteAttributesList[$productPack.id_product_pack])) || $group.default == $id_attribute)}
														<li class="input-container float-left float-xs-left pull-xs-left">
															<input type="radio" class="input-radio ap5-attribute-radio" name="{$groupName}" value="{$id_attribute}" {if $ap5_isCurrentSelectedIdAttribute} checked="checked"{/if}{if in_array($productPack.id_product_pack, $packExcludeList)} disabled="disabled"{/if} />
															<span class="radio-label">{$group_attribute}</span>
														</li>
													{/foreach}
												</ul>
											{/if}
										</div> <!-- end attribute_list -->
									</div>
								{/if}
							{/foreach}
						</div>
						{/if}
					</div>
					{if $productPack.presentation.show_price && !$configuration.is_catalog}
						{if $packShowProductsThumbnails && $packMaxImagesPerProduct > 1}{/if}
						<div class="ap5-pack-product-price-table-container product-prices {if $productPack.reduction_amount <= 0} ap5-no-reduction{/if}">
							<div class="ap5-pack-product-price-table-cell {if $productPack.reduction_amount > 0} has-discount{/if}">
								{block name='ap5_product_price'}
									<div class="current-price ap5-pack-product-price text-center">
										{if $productPack.reduction_amount > 0}
											<div class="product-discount ap5-pack-product-original-price text-center">
												<span class="regular-price ap5-pack-product-original-price-value">
												{if !$priceDisplay || $priceDisplay == 2}
													{$productPack.presentation.productClassicPriceTotal}
												{elseif $priceDisplay == 1}
													{$productPack.presentation.productClassicPriceTaxExclTotal}
												{/if}
												</span>
											</div>
										{/if}
										<div class="product-price h5 has-discount">
											{if $productPack.presentation.show_price}
												{if $productPack.productPackPrice == 0}
												{else}
													{if !$priceDisplay || $priceDisplay == 2}
														<span>{$productPack.presentation.productPackPriceTotal}</span>
													{elseif $priceDisplay == 1}
														<span>{$productPack.presentation.productPackPriceTaxExclTotal}</span>
													{/if}
												{/if}
											{/if}
											{if $productPack.reduction_amount > 0}
												{if $productPack.productPackPrice > 0}
													{if $productPack.reduction_type == 'amount'}
														<span class="discount discount-amount ap5-pack-product-reduction-value">
															{l s='Save %amount%' d='Shop.Theme.Catalog' sprintf=['%amount%' => $productPack.presentation.productReductionAmountTotal]}
														</span>
													{else}
														<span class="discount discount-percentage ap5-pack-product-reduction-value">{l s='Save %percentage%' d='Shop.Theme.Catalog' sprintf=['%percentage%' => $productPack.reduction_amount * 100]}%</span>
													{/if}
												{/if}
											{/if}
										</div>
									</div>
								{/block}
								{block name='ap5_product_availability'}
									{if $packShowProductsAvailability}
									<!-- availability -->
									<div class="ap5-availability-statut">
										<span id="product-availability">
										{if $packShowProductsAvailability}
											{if $productPack.presentation.availability == 'available'}
												<i class="material-icons product-available">&#xE5CA;</i>
											{elseif $productPack.presentation.availability == 'last_remaining_items'}
												<i class="material-icons product-last-items">&#xE002;</i>
											{else}
												<i class="material-icons product-unavailable">&#xE14B;</i>
											{/if}
											{$productPack.presentation.availability_message}
										{/if}
										</span>
									</div>
									{/if}
								{/block}
							</div>
						</div>
						{/if}
					{block name='ap5_product_quantity_ribbon'}
						<!-- quantity -->
						{if $productPack.quantity > 1}
						<div class="ribbon-wrapper">
							<div class="ap5-pack-product-quantity ribbon">
								x {$productPack.quantity|intval}
							</div>
						</div>
						{/if}
					{/block}
					{block name='ap5_product_images'}
						{if !$mobile_device}
							<div class="ap5-pack-product-image">
								<a class="no-print" {if empty($from_quickview)}data-toggle="modal" data-target="#ap5-pack-product-{$productPack.id_product_pack}-modal #product-modal"{/if} title="{$imageTitle}" href="{$pmlink->getImageLink($productPack.presentation.link_rewrite, $imageIds, $imageFormatProductZoom)}">
									<img class="options img-fluid d-block mx-auto" id="thumb_{$productPack.image.id_image|intval}" src="{$pmlink->getImageLink($productPack.presentation.link_rewrite, $imageIds, $imageFormatProductCover)}" alt="{$imageTitle}" title="{$imageTitle}" height="{$imageFormatProductCoverHeight}" width="{$imageFormatProductCoverWidth}" itemprop="image" />
								</a>
							</div>
							{* Modal images *}
							{if empty($from_quickview)}
								<div id="ap5-pack-product-{$productPack.id_product_pack}-modal">
									{include file='catalog/_partials/product-images-modal.tpl' product=$productPack.presentation}
								</div>
							{/if}
						{else}
							<hr class="ap5-pack-product-icon-plus" />
							{if $packShowProductsThumbnails && (count($productPack.images) > 1 || $packMaxImagesPerProduct > 1)}
							<div class="ap5-pack-product-mobile-slideshow pm-ap-owl-carousel clearfix">
								{foreach from=$productPack.imagesMobile item=productPackImage}
									{assign var=productPackImageTitle value=$productPack.presentation.name}
									{assign var=productPackImageIds value="`$productPack.id_product`-`$productPackImage.id_image`"}

									<div id="ap5-pack-product-thumbnail-{$productPackImage.id_image|intval}" class="ap5-pack-product-thumbnail">
										<img class="img-fluid d-block mx-auto" id="thumb_{$productPackImage.id_image|intval}" src="{$pmlink->getImageLink($productPack.presentation.link_rewrite, $productPackImageIds, $imageFormatProductCoverMobile)}" alt="{$productPackImageTitle}" title="{$productPackImageTitle}" height="{$imageFormatProductCoverMobileHeight}" width="{$imageFormatProductCoverMobileWidth}" itemprop="image" />
									</div>
								{/foreach}
							</div>
							{/if}
						{/if}
					{/block}

					
					{* Let's display error list *}
					{if isset($productsPackErrors[$productPack.id_product_pack]) || isset($productsPackFatalErrors[$productPack.id_product_pack])}
					{if isset($productsPackFatalErrors[$productPack.id_product_pack])}<div class="ap5-overlay"></div>{/if}
					<div class="alert animated shake {if isset($productsPackFatalErrors[$productPack.id_product_pack])}alert-danger{else}alert-warning{/if}">
						<ol>
						{if isset($productsPackErrors[$productPack.id_product_pack])}
							{foreach from=$productsPackErrors[$productPack.id_product_pack] item=errorRow}
								<li>{$errorRow}</li>
							{/foreach}
						{/if}
						{if isset($productsPackFatalErrors[$productPack.id_product_pack])}
							{foreach from=$productsPackFatalErrors[$productPack.id_product_pack] item=errorRow}
								<li>{$errorRow}</li>
							{/foreach}
						{/if}
						</ol>
					</div>
					{/if}
					
				</div>
				{if $packAllowRemoveProduct}
					{if !in_array($productPack.id_product_pack, $packExcludeList)}
					<span class="ap5-pack-product-icon-remove" data-id-product-pack="{$productPack.id_product_pack|intval}"></span>
					{else}
					<span class="ap5-pack-product-icon-check" data-id-product-pack="{$productPack.id_product_pack|intval}"></span>
					{/if}
				{/if}
			</div>
			{/if}
			<div style="display:none">
			{$numproduit++}
			</div>
		{/foreach}
		</div>
		<!-- end pack product list -->
