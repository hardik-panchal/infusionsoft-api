<?php

/**
 *
 * @author Hardik Panchal <hardikpanchal469@gmail.com>
 * @version 1.0
 * @package BePure
 * 
 * credentials:
 * 
 *  
 *  https://signin.infusionsoft.com/login?service=https://os140.infusionsoft.com/j_spring_cas_security_check

    Use: ben@bepure.co.nz
    Incredible22
  
    1. http://help.infusionsoft.com/developers/tables : 
    2. http://help.infusionsoft.com/api-docs/dataservice#query
  
    API KEY: 7b6e7bf7278e41be52eda569b9f563bf

   
 *  ----FASTWAY----
 *  Then we want this information pushed into Fastway, please use the details below...

    www.fastwaycustomer.com

    Username: info@bepure.co.nz
    Password: 0630452

 *  Please use this link to access fastlabel documentation for integration, 
    http://api.fastway.org/v2/docs/index.html?api_key=fc02f7481690e29cc62b6f816fb8cfde 
 *  
 *  Precisely FastLabel documentation is here:
 *  http://api.fastway.org/v2/docs/detail?ControllerName=fastlabel&api_key=fc02f7481690e29cc62b6f816fb8cfde

 
 * 
 * 
 * 
 * 
 */
session_start();
error_reporting(0);


# DB informaitons
define('DB_HOST', 'localhost');
define('DB_PASSWORD', '');
define('DB_UNAME', 'root');
define('DB_NAME', 'infusionsoft-api');

include "loader.php";
?>
