{extends file='catalog/product.tpl'}

{block name='content'}

  <section id="main" itemscope itemtype="https://schema.org/Product">
    <meta itemprop="url" content="{$product.url}">

    {* Pack title *}

    <div class="row row-pack">

      {block name='ap5_product_list'}
        {* Product list of the pack *}
        {include file='module:pm_advancedpack/views/templates/front/1.7/pack-product-list.tpl'}
      {/block}

      {block name='ap5_buy_block'}
        {* Buy block *}
        {include file='module:pm_advancedpack/views/templates/front/1.7/pack-price-container.tpl'}
      {/block}
    </div>


    {block name='ap5_footer'}
      {block name='product_footer'}
        {hook h='displayFooterProduct' product=$product category=$category}
      {/block}
    {/block}

    {block name='ap5_images'}
      {block name='product_images_modal'}
        {include file='catalog/_partials/product-images-modal.tpl'}
      {/block}
    {/block}

    {block name='ap5_footer_container'}
      {block name='page_footer_container'}
        <footer class="page-footer">
          {block name='page_footer'}
            <!-- Footer content -->
          {/block}
        </footer>
      {/block}
    {/block}
  </section>

{/block}
