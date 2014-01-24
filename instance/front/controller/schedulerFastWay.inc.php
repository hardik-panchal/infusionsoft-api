<?php

/**
 *  Scheduler file for fastway to push the 
 *  infusionsoft order into fastway > fastlabel
 * 
 *  @author Hardik Panchal<hardikpanchal469@gmail.com>
 *  @since January 24, 2014
 * 
 */
_errors_on();

$apiFL = new apiFastLabel();

# Get the userid from fastlabel
$users = $apiFL->getUsers();
$user_id = $users['result'][0]['UserID'];

if (!$user_id) {
    die("Unable to retrieve UserID");
}

$manifest = $apiFL->getOpenManifest($user_id);
$manifest_id = $manifest['result'][0]['ManifestID'];

if(!$manifest_id){
    die("Unable to get menifeft id");
}



die;
?>
