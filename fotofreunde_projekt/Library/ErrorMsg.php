<?php

namespace ppa\Library;

use ppa\Library\View;

class ErrorMsg
{
    protected $view;

    public function __construct($msg = 'Ihre Anfrage konnte nicht verarbeitet werden', $ex = '')
    {
        $this->view = new \ppa\Library\View(dirname(__DIR__).DIRECTORY_SEPARATOR.'Views'
        , 'Error', 'showErrMsg');
        $this->view->setVars([
            'error' => $msg,
            'debug' => $ex

        ]);
        $this->view->render();
    }


    
}