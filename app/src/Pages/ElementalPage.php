<?php


namespace App\Pages;

use Page;

class ElementalPage extends Page
{
    private static $db = [];

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        return $fields;
    }
}
