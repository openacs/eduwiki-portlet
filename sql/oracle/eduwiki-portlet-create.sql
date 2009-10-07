--
--  Copyright (C) 2001, 2002 MIT
--
--  This file is part of dotLRN.
--
--  dotLRN is free software; you can redistribute it and/or modify it under the
--  terms of the GNU General Public License as published by the Free Software
--  Foundation; either version 2 of the License, or (at your option) any later
--  version.
--
--  dotLRN is distributed in the hope that it will be useful, but WITHOUT ANY
--  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
--  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
--  details.
--
--
-- Oracle port samir@symphinity.com 11 July 2002
--

-- table to differentiate between normal pages and activity pages inside content
@ eduwiki-tables-create.sql

declare
  ds_id portal_datasources.datasource_id%TYPE;
begin
  ds_id := portal_datasource.new(
    name             => 'eduwiki_portlet',
    description      => 'Displays the content page as a portlet'
  );

  -- 4 defaults procs

  -- shadeable_p 
  portal_datasource.set_def_param (
	datasource_id => ds_id,
	config_required_p => 't',
	configured_p => 't',
	key => 'shadeable_p',
	value => 't'
  );	

  -- shaded_p 
    portal_datasource.set_def_param (
	datasource_id => ds_id,
	config_required_p => 't',
	configured_p => 't',
	key => 'shaded_p',
	value => 'f'
  );	

  -- hideable_p 
  portal_datasource.set_def_param (
	datasource_id => ds_id,
	config_required_p => 't',
	configured_p => 't',
	key => 'hideable_p',
	value => 't'
  );	

  -- user_editable_p 
  portal_datasource.set_def_param (
	datasource_id => ds_id,
	config_required_p => 't',
	configured_p => 't',
	key => 'user_editable_p',
	value => 'f'
);	

  -- link_hideable_p 
  portal_datasource.set_def_param (
	datasource_id => ds_id,
	config_required_p => 't',
	configured_p => 't',
	key => 'link_hideable_p',
	value => 't'
);	


  -- content-specific procs

  -- package_id must be configured
  portal_datasource.set_def_param (
	datasource_id => ds_id,
	config_required_p => 't',
	configured_p => 'f',
	key => 'package_id',
	value => ''
);	

  portal_datasource.set_def_param (
	datasource_id => ds_id,
	config_required_p => 't',
	configured_p => 'f',
	key => 'page_name',
	value => ''
);	

end;
/
show errors

declare
	foo integer;
begin

	-- create the implementation
	foo := acs_sc_impl.new (
		impl_contract_name => 'portal_datasource',
		impl_name => 'eduwiki_portlet',
		impl_pretty_name => 'Content Portlet',
		impl_owner_name => 'eduwiki_portlet'
	);
end;
/
show errors

declare
	foo integer;
begin

	-- add all the hooks
	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'eduwiki_portlet',
	       'GetMyName',
	       'eduwiki_portlet::get_my_name',
	       'TCL'
	);

	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'eduwiki_portlet',
	       'GetPrettyName',
	       'eduwiki_portlet::get_pretty_name',
	       'TCL'
	);

	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'eduwiki_portlet',
	       'Link',
	       'eduwiki_portlet::link',
	       'TCL'
	);

	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'eduwiki_portlet',
	       'AddSelfToPage',
	       'eduwiki_portlet::add_self_to_page',
	       'TCL'
	);

	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'eduwiki_portlet',
	       'Show',
	       'eduwiki_portlet::show',
	       'TCL'
	);

	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'eduwiki_portlet',
	       'Edit',
	       'eduwiki_portlet::edit',
	       'TCL'
	);

	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'eduwiki_portlet',
	       'RemoveSelfFromPage',
	       'eduwiki_portlet::remove_self_from_page',
	       'TCL'
	);

end;
/
show errors

declare
	foo integer;
begin

	-- Add the binding
	acs_sc_binding.new (
	    contract_name => 'portal_datasource',
	    impl_name => 'eduwiki_portlet'
	);


end;
/
show errors

declare
  ds_id portal_datasources.datasource_id%TYPE;
begin
 ds_id := portal_datasource.new(
    name             => 'eduwiki_admin_portlet',
    description      => 'Displays the admin interface for the content data portlets '
  );

  -- 4 defaults procs

  -- shadeable_p 
  portal_datasource.set_def_param (
	datasource_id => ds_id,
	config_required_p => 't',
	configured_p => 't',
	key => 'shadeable_p',
	value => 'f'
);	

  -- shaded_p 
  portal_datasource.set_def_param (
	datasource_id => ds_id,
	config_required_p => 't',
	configured_p => 't',
	key => 'shaded_p',
	value => 'f'
);	

  -- hideable_p 
  portal_datasource.set_def_param (
	datasource_id => ds_id,
	config_required_p => 't',
	configured_p => 't',
	key => 'hideable_p',
	value => 't'
);	

  -- user_editable_p 
  portal_datasource.set_def_param (
	datasource_id => ds_id,
	config_required_p => 't',
	configured_p => 't',
	key => 'user_editable_p',
	value => 'f'
);	

  -- link_hideable_p 
  portal_datasource.set_def_param (
	datasource_id => ds_id,
	config_required_p => 't',
	configured_p => 't',
	key => 'link_hideable_p',
	value => 't'
);	


  -- content-admin-specific procs

  -- package_id must be configured
  portal_datasource.set_def_param (
	datasource_id => ds_id,
	config_required_p => 't',
	configured_p => 'f',
	key => 'package_id',
	value => ''
);	

end;
/
show errors

declare
	foo integer;
begin
	-- create the implementation
	foo := acs_sc_impl.new (
		impl_contract_name => 'portal_datasource',
		impl_name => 'eduwiki_admin_portlet',
		impl_pretty_name => 'Content Admin Portlet',
		impl_owner_name => 'eduwiki_admin_portlet'
	);

end;
/
show errors

declare
	foo integer;
begin

	-- add all the hooks
	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'eduwiki_admin_portlet',
	       'GetMyName',
	       'eduwiki_admin_portlet::get_my_name',
	       'TCL'
	);

	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'eduwiki_admin_portlet',
	       'GetPrettyName',
	       'eduwiki_admin_portlet::get_pretty_name',
	       'TCL'
	);

	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'eduwiki_admin_portlet',
	       'Link',
	       'eduwiki_admin_portlet::link',
	       'TCL'
	);

	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'eduwiki_admin_portlet',
	       'AddSelfToPage',
	       'eduwiki_admin_portlet::add_self_to_page',
	       'TCL'
	);

	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'eduwiki_admin_portlet',
	       'Show',
	       'eduwiki_admin_portlet::show',
	       'TCL'
	);

	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'eduwiki_admin_portlet',
	       'Edit',
	       'eduwiki_admin_portlet::edit',
	       'TCL'
	);

	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'eduwiki_admin_portlet',
	       'RemoveSelfFromPage',
	       'eduwiki_admin_portlet::remove_self_from_page',
	       'TCL'
	);

	-- Add the binding
	acs_sc_binding.new (
	    contract_name => 'portal_datasource',
	    impl_name => 'eduwiki_admin_portlet'
	);

end;
/
show errors