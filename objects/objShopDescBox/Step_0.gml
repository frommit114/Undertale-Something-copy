#region //Animate desc box height and desc text y
if (sh_desc_box_current_height < sh_desc_box_height) 
{
	sh_desc_box_current_height += ((sh_desc_box_height - sh_desc_box_current_height) / 3);
}
if (sh_desc_box_current_height > sh_desc_box_height) 
{
	sh_desc_box_current_height -= ((sh_desc_box_current_height - sh_desc_box_height) / 3);
}
if (sh_item_desc_current_y < sh_item_desc_y) 
{
	sh_item_desc_current_y += ((sh_item_desc_y - sh_item_desc_current_y) / 3);
}
if (sh_item_desc_current_y > sh_item_desc_y) 
{
	sh_item_desc_current_y -= ((sh_item_desc_current_y - sh_item_desc_y) / 3);
}
#endregion

