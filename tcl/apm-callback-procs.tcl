ad_library {

    @author Hector Amado (hr_amado@galileo.edu)
    @creation-date 2009-06-01
}

namespace eval eduwiki-portlet::apm {}

ad_proc -public eduwiki-portlet::apm::package_mount { 
    {-package_id:required}
    {-node_id:required}
} {
    Check if packages needed are mounted, if not mount them!
} {

}
