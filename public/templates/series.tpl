{include file='base.tpl' page_title={$smarty.const.MY_TITLE}}

<div class="alert alert-success" role="alert">
  <h4 class="alert-heading">ブクリリ ガイド</h4>
  <p>
  シリーズの編集，消去，購読（！）ができます．<br>
  気になるシリーズを購読しよう．
  </p>
  <p>
  本の各巻のついか，編集，消去もここから行えます．
  </p>
</div>


<h4>
    {$series_name}シリーズの本一覧
</h4>
<div>
{a_tag_btn("/series_edit.php?name=`$series_name`", 'edit')}
{a_tag_btn("/series_delete.php?series_name=`$series_name`&delete", 'delete')}
{if logged_in()}
    {if is_subscripted(current_user(), $series_name)}
        {a_tag_btn_disabled("/subscribe.php?series_name=`$series_name`", 'subscribed')}
    {else}
        {a_tag_btn("/subscribe.php?series_name=`$series_name`&subscribe", 'subscribe')}
    {/if}
{else}
    {a_tag('/login.php', 'login to subscribe')}
{/if}
</div>

{foreach $res as $row}
<div class="card">
    <p>
    巻数: {$row['volume']}
    公開日: {$row['published_at']}
    {a_tag_btn("/book_edit.php?series_name=`$series_name`&volume=`$row['volume']`", 'edit')}
    {a_tag_btn("/book_delete.php?series_name=`$series_name`&volume=`$row['volume']`&delete", 'delete')}
    </p>
</div>
{/foreach}

{a_tag_btn_primary("/book_new.php?series_name=`$series_name`", '新しく巻を追加')}

{include file='footer.tpl'}
