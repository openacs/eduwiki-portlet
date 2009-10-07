array set config $cf
set user_id [ad_conn user_id]
set package_id [ad_conn package_id]
set community_id [dotlrn_community::get_community_id]

set eduwiki_url [site_node::get_url_from_object_id -object_id $config(package_id)]
set folder_id [content::folder::get_folder_from_package -package_id $config(package_id)]
set admin_p 0
set admin_p [permission::permission_p -object_id $config(package_id) -party_id $user_id -privilege admin]
#
# We define a table with an action to add new items
#

TableWidget index -volatile \
    -actions "" \
    -columns {
	AnchorField title -label "[_ eduwiki.Eduwiki_Title_]" -orderby title
    }

db_foreach instance_select \
    [::eduwiki::EduwikiTask instance_select_query \
	 -parent_id $config(package_id) \
         -from_clause ", eduwiki_tasks e" \
	 -select_attributes [list "object_id as eduwiki_id" title eduwiki_category creation_user \
             "to_char(release_date,'DD-MM-YYYY HH24:MI:SS') as release_date" \
             "to_char(close_date,'DD-MM-YYYY HH24:MI:SS') as close_date"]\
          -where_clause "e.eduwiki_id = acs_objects.object_id and ci.publish_status = 'ready'" \
    ] {

	set page_url [eduwiki::get_best_eduwiki_page_url -eduwiki_id $item_id \
			                                 -user_id $user_id \
			                                 -folder_id $folder_id \
			                                 -eduwiki_category $eduwiki_category ]
	if {[empty_string_p $page_url]} {
	    set page_url [export_vars -base $eduwiki_url {{eduwiki_id $item_id}}]
	} else {
	    set page_url "${eduwiki_url}$page_url"
	    set page_url [export_vars -base $page_url {{m view}}]
	}

	index add \
	  -title $title \
	  -title.href $page_url
    }


      if { [llength [$index children]] } {   
	  set html [index asHTML]
      } else {
	  set html "[_ eduwiki.There_are_not_eduwiki_activities]"
      }

