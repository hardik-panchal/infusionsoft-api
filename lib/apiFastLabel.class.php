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
 * 
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

    public function createConsignment($userID, $data) {

        /*
          http://api.fastway.org/v2/fastlabel/addconsignment?UserID=96&
         *  CompanyName=Test Company&
         *  Address1=Test Address 1&
         *  Suburb=Ahuriri&
         *  Postcode=4110&
         *  Items[0].Weight=1&
         *  Items[0].Quantity=1&
         *  Items[0].Packaging=1&
         *  api_key=fc02f7481690e29cc62b6f816fb8cfde
         * 
         * */

        $this->apiEndpoint = 'addconsignment';
        $this->params['UserID'] = $userID;
        $this->params['CompanyName'] = $data['CompanyName'];
        $this->params['Address1'] = $data['Address1'];
        $this->params['Suburb'] = $data['Suburb'];
        $this->params['Postcode'] = $data['Postcode'];
        foreach ($data['items'] as $index => $each_item) {
            if ($each_item['Weight']) {
                $this->params["Items[{$index}].Weight"] = $each_item['Weight'];
            }
            $this->params["Items[{$index}].Quantity"] = $each_item['Quantity'];
            $this->params["Items[{$index}].Packaging"] = $each_item['Packaging'];
            
        }

        $url = $this->prepareApiUrl();
        $data = $this->doCall($url);
        return json_decode($data, true);

        #Response
        # it will have manifest
        # Cost, consignment id
        /**
         * {

          'result': {
          'CostExGst': '5.25',
          'CostMarkupExGst': '10',
          'ConsignmentID': '1289190',
          'ManifestID': '104408',
          'LabelNumbers': [
          'FW0000730421'
          ]
          },
          'generated_in': '76ms'
          }
         */
    }

}

?>
