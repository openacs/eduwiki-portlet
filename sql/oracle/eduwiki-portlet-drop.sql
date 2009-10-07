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

@ eduwiki-tables-drop.sql

declare
  ds_id portal_datasources.datasource_id%TYPE;
begin

  begin
  select datasource_id into ds_id
      from portal_datasources
     where name = 'eduwiki_portlet';
   exception when no_data_found then
     ds_id := null;
  end;

  if ds_id is not null then
    portal_datasource.del(ds_id);
  end if;

end;
/
show errors

declare
	foo integer;
begin

	-- drop the hooks
	foo := acs_sc_impl.delete_alias (
	       'portal_datasource',
	       'eduwiki_portlet',
	       'GetMyName'
	);

	foo := acs_sc_impl.delete_alias (
	       'portal_datasource',
	       'eduwiki_portlet',
	       'GetPrettyName'
	);


	foo := acs_sc_impl.delete_alias (
	       'portal_datasource',
	       'eduwiki_portlet',
	       'Link'
	);

	foo := acs_sc_impl.delete_alias (
	       'portal_datasource',
	       'eduwiki_portlet',
	       'AddSelfToPage'
	);

	foo := acs_sc_impl.delete_alias (
	       'portal_datasource',
	       'eduwiki_portlet',
	       'Show'
	);

	foo := acs_sc_impl.delete_alias (
	       'portal_datasource',
	       'eduwiki_portlet',
	       'Edit'
	);

	foo := acs_sc_impl.delete_alias (
	       'portal_datasource',
	       'eduwiki_portlet',
	       'RemoveSelfFromPage'
	);

	-- Drop the binding
	acs_sc_binding.del (
	    'portal_datasource',
	    'eduwiki_portlet'
	);

	-- drop the impl
	foo := acs_sc_impl.del (
		'portal_datasource',
		'eduwiki_portlet'
	);
  	
end;
/
show errors

declare
  ds_id portal_datasources.datasource_id%TYPE;
begin

 begin
  select datasource_id into ds_id
      from portal_datasources
     where name = 'eduwiki_admin_portlet';
  exception when no_data_found then
     ds_id := null;
   end ;

  if ds_id is NOT null then
    portal_datasource.del(ds_id);
  end if;

	-- drop the hooks
		foo := acs_sc_impl.delete_alias (

	       'portal_datasource',
	       'eduwiki_admin_portlet',
	       'GetMyName'
	);

		foo := acs_sc_impl.delete_alias (

	       'portal_datasource',
	       'eduwiki_admin_portlet',
	       'GetPrettyName'
	);


		foo := acs_sc_impl.delete_alias (

	       'portal_datasource',
	       'eduwiki_admin_portlet',
	       'Link'
	);

		foo := acs_sc_impl.delete_alias (

	       'portal_datasource',
	       'eduwiki_admin_portlet',
	       'AddSelfToPage'
	);

		foo := acs_sc_impl.delete_alias (

	       'portal_datasource',
	       'eduwiki_admin_portlet',
	       'Show'
	);

		foo := acs_sc_impl.delete_alias (

	       'portal_datasource',
	       'eduwiki_admin_portlet',
	       'Edit'
	);

		foo := acs_sc_impl.delete_alias (

	       'portal_datasource',
	       'eduwiki_admin_portlet',
	       'RemoveSelfFromPage'
	);

	-- Drop the binding
	foo := acs_sc_impl.del (
	    'portal_datasource',
	    'eduwiki_admin_portlet'
	);

	-- drop the impl
	foo := acs_sc_impl.del (
		'portal_datasource',
		'eduwiki_admin_portlet'
	);
  	
	return 0;
end;
/
show errors


