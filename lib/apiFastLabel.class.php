<?php

/**
 * Class file for FastLabel API Client
 * 
 * apiFastLabel class implements methods
 * to communicate with FastLabel API endpoints.
 * 
 * Documentation is at:
 * http://api.fastway.org/v2/docs/detail?ControllerName=fastlabel&api_key=fc02f7481690e29cc62b6f816fb8cfde
 * 
 * Looks like simple url retrieval rather than all complex rest/soap client implementation and handshaking
 */
Class apiFastLabel extends apiCore {

    public $key = 'fc02f7481690e29cc62b6f816fb8cfde';
    public $apiURL = "http://api.fastway.org/v2/fastlabel/";
    public $apiEndpoint = '';
    public $params = array();

    public function __construct() {
        $this->params['api_key'] = $this->key;
    }

    public function getUsers() {
        $this->apiEndpoint = 'listusers';
        $url = $this->prepareApiUrl();
        $users = $this->doCall($url);
        return json_decode($users, true);
    }

    public function getOpenManifest($userID) {
        $this->apiEndpoint = 'getopenmanifest';
        $this->params['UserID'] = $userID;
        $this->params['AutoImport'] = 'false';
        $url = $this->prepareApiUrl();
        $mainfest = $this->doCall($url);
        return json_decode($mainfest, true);
    }

}

?>
