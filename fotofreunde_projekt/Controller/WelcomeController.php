<?php

namespace ppa\Controller;

/**
 * Description of Welcome
 *
 * @author reich
 */
class WelcomeController
{
    public function setView(\ppa\Library\View $view)
    {
        $this->view = $view;
    }

    function showWelcome() 
    {
    }
}
