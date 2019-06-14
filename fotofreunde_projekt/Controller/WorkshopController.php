<?php
namespace ppa\Controller;

use ppa\Model\WorkshopModel;
use ppa\Library\View;

class WorkshopController
{
    protected $view;
    private $workshopModel;

    public function __construct($view)
    {
        $this->workshopModel = new WorkshopModel();
        $this->view = $view;
    }
    
    public function showAllWorkshops()
    {
        $this->view->setVars([
            'workshops' => $this->workshopModel->selectWorkshops()
        ]);
    }

    
}