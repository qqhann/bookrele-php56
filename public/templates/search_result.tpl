{include file='base.tpl' page_title={$smarty.const.MY_TITLE}}

{foreach $res as $row}
<a href="{echo_url('/series.php?series_name=')}{$row['name']}">
<div>
名前: {$row['name']}
完結(真偽値0or1): {$row['complete']}
</div>
</a>
{/foreach}

{include file='footer.tpl'}