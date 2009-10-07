ad_library {

    Procedures to support the Educational Wiki Admin portlet

    @author hr_amado@galileo.edu
    @creation-date 2009-06-01

}

namespace eval eduwiki_admin_portlet {

    ad_proc -private get_my_name {
    } {
        return "eduwiki_admin_portlet"
    }

    ad_proc -public get_pretty_name {
    } {
        return "#eduwiki-portlet.admin_pretty_name#"
    }

    ad_proc -private my_package_key {
    } {
        return "eduwiki-portlet"
    }

    ad_proc -public link {
    } {
        return ""
    }

    ad_proc -public add_self_to_page {
        {-portal_id:required}
        {-package_id:required}
    } {
        Adds a content admin PE to the given portal
    } {
        return [portal::add_element_parameters \
            -portal_id $portal_id \
            -portlet_name [get_my_name] \
            -key package_id \
            -value $package_id
        ]
    }

    ad_proc -public remove_self_from_page {
        {-portal_id:required}
    } {
        Removes content PE from the given page
    } {
        # This is easy since there's one and only one instace_id
        portal::remove_element \
            -portal_id $portal_id \
            -portlet_name [get_my_name]
    }

    ad_proc -public show {
        cf
    } {
        Display the PE
    } {
        portal::show_proc_helper \
            -package_key [my_package_key] \
            -config_list $cf \
            -template_src "eduwiki-admin-portlet"
    }
}
